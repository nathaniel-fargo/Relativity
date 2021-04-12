import Math
import SpriteKit

public class LightClock {
    
    var frame: CGRect
    public var velocity: CGFloat = 0
    
    var photon: Photon
    var lowerMirror: SKShapeNode
    var upperMirror: SKShapeNode
    var tickMark: SKLabelNode
    
    var ticks: Int = 0
    public var timePassed: Int {
        get {
            return ticks
        }
    }
    
    public init(frame: CGRect, mirrorHeight: CGFloat, photonRadius: CGFloat?, mirrorColor color: UIColor?) {
        self.frame = frame
        let mirrorColor = color ?? #colorLiteral(red: 0.40000003576278687, green: 0.615686297416687, blue: 0.2039215862751007, alpha: 1.0)
        
        photon = Photon(position: CGPoint(frame.midX, frame.midY), direction: CGVector(0,1), radius: photonRadius, color: nil)
        
        lowerMirror = SKShapeNode(rect: CGRect(x: 0, y: 0, width: frame.width, height: mirrorHeight), cornerRadius: 5)
        lowerMirror.position = CGPoint(frame.minX, frame.minY)
        lowerMirror.fillColor = mirrorColor
        lowerMirror.lineWidth = 0
        
        upperMirror = SKShapeNode(rect: CGRect(x: 0, y: 0, width: frame.width, height: mirrorHeight), cornerRadius: 5)
        upperMirror.position = CGPoint(frame.minX, frame.maxY - mirrorHeight)
        upperMirror.fillColor = mirrorColor
        upperMirror.lineWidth = 0
        
        tickMark = SKLabelNode(text: "0")
        tickMark.verticalAlignmentMode = .bottom
        tickMark.position = CGPoint(frame.midX, frame.maxY + 5)
        tickMark.fontSize = mirrorHeight * 3 / 2
        tickMark.fontColor = #colorLiteral(red: 0.9999018311500549, green: 1.0000687837600708, blue: 0.9998798966407776, alpha: 1.0)
        tickMark.fontName = "AppleSDGothicNeo-Bold"
    }
    
    public func update(bounds: CGRect, simSpeed: CGFloat) {
        frame = frame.offsetBy(dx: velocity * simSpeed / 100, dy: 0)
        photon.setDX(x: velocity / 100)
        
        photon.move(simulationSpeed: simSpeed)
        photon.position.y = min(upperMirror.frame.midY, max(lowerMirror.frame.midY, photon.position.y))
        lowerMirror.position.x = frame.minX
        upperMirror.position.x = frame.minX
        tickMark.position.x = frame.midX
        
        let collision = photon.keepOutOfRect(rect: upperMirror.frame, simSpeed: simSpeed)
        if (collision != nil) {
            ticks += 1
            tickMark.text = "\(ticks)"
        }
        let _ = photon.keepOutOfRect(rect: lowerMirror.frame, simSpeed: simSpeed)
        if frame.minX > bounds.maxX {
            frame = frame.offsetBy(dx: -bounds.width - frame.width, dy: 0)
            photon.position.x -= bounds.width + frame.width
        } else if frame.maxX < bounds.minX {
            frame = frame.offsetBy(dx: bounds.width + frame.width, dy: 0)
            photon.position.x += bounds.width + frame.width
        }
    }
    
    public func addChildren(to parent: SKScene) {
        parent.addChild(photon.node)
        parent.addChild(upperMirror)
        parent.addChild(lowerMirror)
        parent.addChild(tickMark)
    }
    
    public func setHeight(to newHeight: CGFloat) {
        let deltaHeight = newHeight - frame.height
        upperMirror.position.y +=  deltaHeight / 2
        lowerMirror.position.y -= deltaHeight / 2
        frame = CGRect(x: frame.minX, y: frame.minY - deltaHeight / 2, width: frame.width, height: newHeight)
        tickMark.position.y += deltaHeight / 2
    }
}
