import SpriteKit

public class SpeedLabel: SKNode {
    var labelNode: SKLabelNode
    var subject: String
    
    public init(subject: String, width: CGFloat) {
        self.subject = subject
        labelNode = SKLabelNode(text: "The \(self.subject) is not moving")
        labelNode.fontColor = .white
        labelNode.fontSize = 20
        labelNode.verticalAlignmentMode = .center
        labelNode.fontName = "Avenir-Heavy"
        labelNode.position.y += 10
        labelNode.preferredMaxLayoutWidth = width - 20
        labelNode.numberOfLines = 2
        
        super.init()
        
        addChild(labelNode)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateWithVelocity(of velocity: CGFloat) {
        let vel = abs(velocity)
        var speedText: String!
        switch vel {
        case 0...0.01:
            speedText = " is not moving"
        case 0.01...0.03:
            speedText = " is moving at spaceship speeds"
        case 0.03...0.2:
            speedText = " is faster than the fastest rocket"
        case 0.2...0.4:
            speedText = " is going \(round(vel * 3000000) / 10) km/sec"
        case 0.4...0.55:
            speedText = " travelling at half lightspeed"
        case 0.55...0.7:
            speedText = " is zooming"
        case 0.7...0.9:
            speedText = "is going \(round(vel * 1000) / 10)% of lightspeed"
        case 0.9...0.96:
            speedText = "'s speed is impractical!"
        case 0.96...0.99:
            speedText = "'s speed is improbable!"
        case 0.99..<1:
            speedText = "'s speed is (practically) impossible!"
        case 1:
            speedText = " is traveling at the speed of light"
        default: 
            speedText = " broke the laws of physics"
        }
        labelNode.text = "The " + subject + speedText
    }
}
