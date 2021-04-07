import CoreGraphics
import Math

public let c: CGFloat = 1

class LightRay {
    
    public var position: CGVector
    var direction: CGVector
    
    // init
    public init(position: CGVector, direction: CGVector) {
        self.direction = direction
        self.position = position
    }
    // makes sure direction fits in mag 1
    func checkDirection () {
        direction = direction.magnitude() == 1 ? direction: direction.normalized(setZeroTo: CGVector(1, 0))
    }
    // Move position according to direction and speed
    public func move(simulationSpeed simSpeed: CGFloat) {
        position += direction * c * simSpeed
    }
    // sets direction to vector nd then normalizes
    public func setDirection(vec newVector: CGVector) {
        direction = newVector.normalized(setZeroTo: CGVector(1, 0))
    }
    // sets direction to vector with mag 1 and x-value
    public func setDX(x newX: CGFloat) {
        // creates x from newX bounded to -1,1
        let x = abs(Int(newX)) < 1 ? newX : newX > 0 ? 1 : -1
        // sets values
        direction.dx = x
        direction.dy = sqrt(1 - x * x)
    }
    // does same but for y
    public func setDY(y newY: CGFloat) {
        let y = abs(Int(newY)) < 1 ? newY : newY > 0 ? 1 : -1
        // sets values
        direction.dx = sqrt(1 - y * y)
        direction.dy = y
    }
}
