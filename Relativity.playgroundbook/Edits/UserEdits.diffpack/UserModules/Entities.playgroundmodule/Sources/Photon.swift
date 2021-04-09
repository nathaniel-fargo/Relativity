import SpriteKit
import Math

let defaultPosition = CGPoint(0, 0)
let defaultDirection = CGVector(1, 0)
let defaultRadius: CGFloat = 10

public class Photon {
    
    public var position: CGPoint
    var direction: CGVector
    var radius: CGFloat
    public var node: SKShapeNode
    var emitter: SKEmitterNode
    
    // init
    public init(position: CGPoint?, direction: CGVector?, radius: CGFloat?, color: UIColor?) {
        self.position = position ?? defaultPosition
        self.direction = direction?.normalized(setZeroTo: defaultDirection) ?? defaultDirection
        self.radius = radius ?? defaultRadius
        self.node = SKShapeNode(circleOfRadius: self.radius)
        node.fillColor = color ?? #colorLiteral(red: 0.9960784316062927, green: 0.7960784435272217, blue: 0.24313727021217346, alpha: 1.0)
        node.lineWidth = 0
        node.position = self.position
        
        emitter = SKEmitterNode()
        emitter.particleBirthRate = 1
        emitter.particleColor = node.fillColor
        emitter.particleSpeed = 10
        emitter.numParticlesToEmit = 300
        emitter.emissionAngle = 1
    }

    // makes sure direction fits in mag 1
    func checkDirection () {
        direction = direction.magnitude() == 1 ? direction: direction.normalized(setZeroTo: CGVector(1, 0))
    }
    // Move position according to direction and speed
    public func move(simulationSpeed simSpeed: CGFloat) {
        position += direction * c * simSpeed
        node.position = position
        if(node.parent != nil  && emitter.parent == nil) {
            node.parent!.addChild(emitter)
        }
    }
    // Doesn't require sim speed
    public func move() {
        checkDirection()
        
        move(simulationSpeed: 1)
    }
    // retrieve direction
    public func getDirection() -> CGVector {
        return direction
    }
    // sets direction to vector and then normalizes
    public func setDirection(vec newVector: CGVector) {
        direction = newVector.normalized(setZeroTo: CGVector(1, 0))
    }
    // sets direction to vector with mag 1 and x-value
    public func setDX(x newX: CGFloat) {
        // creates x from newX bounded to -1,1
        let x = abs(Int(newX)) < 1 ? newX : newX > 0 ? 1 : -1
        // sets values
        direction.dx = x
        direction.dy = sqrt(1 - x * x) * (direction.dy > 0 ? 1 : -1)
    }
    // does same but for y
    public func setDY(y newY: CGFloat) {
        let y = abs(Int(newY)) < 1 ? newY : newY > 0 ? 1 : -1
        // sets values
        direction.dx = sqrt(1 - y * y) * (direction.dx > 0 ? 1 : -1)
        direction.dy = y
    }
    
    // Collisions
    // Man this was a struggle but I did it all
    public func keepOutOfRect(rect: CGRect) -> CollisionType? {
        // check if it applies
        if !(position.x + radius > rect.minX && position.y + radius > rect.minY && position.x - radius < rect.maxX && position.y - radius < rect.maxY) {
            return nil
        }
        /*
         Collision theory
         ___*send up*__
         \MMMMMMMMMMMM/
         >\MMMMMMMMMM/<
         >>\MMMMMMMM/<<
         >>>||||||||<<< *send right*
         >>/WWWWWWWW\<<
         >/WWWWWWWWWW\<
         /WWWWWWWWWWWW\
         __*send down*_
         */
        // Left Bound:
        if position.x <= rect.midX &&
            ((position.y <= rect.midY && position.y >= rect.minY + position.x - rect.minX) ||
            (position.y >= rect.midY && position.y <= rect.maxY - position.x + rect.minX)) {
            direction.dx = -abs(direction.dx)
            position.x += direction.dx * 2
            return .left
        }
        // Right Bound:
        if position.x >= rect.midX &&
            ((position.y <= rect.midY && position.y >= rect.minY - position.x + rect.maxX) || 
            (position.y >= rect.midY && position.y <= rect.maxY + position.x - rect.maxX)) {
            direction.dx = abs(direction.dx)
            position.x += direction.dx * 2
            return .right
        }
        // Upper Bound
        if position.y <= rect.midY && 
            ((position.x <= rect.midX && position.x >= rect.minX + position.y - rect.minY) ||
            (position.x >= rect.midX && position.x <= rect.maxX - position.y + rect.minY)) {
            direction.dy = -abs(direction.dy)
            position.y += direction.dy * 2
            return .upper
        } 
        // Lower Bound
        if position.y >= rect.midY &&
            ((position.x <= rect.midX && position.x >= rect.minX - position.y + rect.maxY) ||
            (position.x >= rect.midX && position.x <= rect.maxX + position.y - rect.maxY)) {
            direction.dy = abs(direction.dy)
            position.y += direction.dy * 2
            return .lower
        }
        return nil
    }
    public func keepInRect(rect: CGRect) -> CollisionType? {
        if position.x - radius > rect.minX && position.y - radius > rect.minY && position.x + radius < rect.maxX && position.y + radius < rect.maxY {
            return nil
        }
        // Horizontal collision
        if position.x - radius <= rect.minX || position.x + radius >= rect.maxX {
            if position.x >= rect.midX {
                direction.dx = -abs(direction.dx)
                return .right
            } else {
                direction.dx = abs(direction.dx)
                return .left
            }
        }
        // Vertical Collision
        if (position.y - radius <= rect.minY || position.y + radius >= rect.maxY) {
            if position.y >= rect.midY {
                direction.dy = -abs(direction.dy)
                position.y += direction.dy * 2
                return .lower
            } else {
                direction.dy = abs(direction.dy)
                position.y += direction.dy * 2
                return .upper
            }
        }
        return nil
    }
    
}
