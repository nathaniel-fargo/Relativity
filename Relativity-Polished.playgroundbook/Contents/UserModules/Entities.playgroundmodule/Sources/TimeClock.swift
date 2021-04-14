import SpriteKit

public class TimeClock: SKNode {
    
    let radius: CGFloat
    var ticks: Int = 0
    
    let tickLabel: SKLabelNode
    let clockBG: SKNode
    let clockHand: SKShapeNode
    
    public init(radius: CGFloat) {
        
        self.radius = radius
        
        tickLabel = SKLabelNode(text: "0")
        tickLabel.fontName = "AppleSDGothicNeo"
        tickLabel.fontSize = radius
        tickLabel.position = CGPoint(0, radius * 1.1)
        tickLabel.verticalAlignmentMode = .bottom
        
        let clockHandPath = CGMutablePath(ellipseIn: CGRect(x: -radius / 20, y: -radius / 20, width: radius / 10, height: radius / 10), transform: nil)
        clockHandPath.move(to: .zero)
        clockHandPath.addLine(to: CGPoint(0, radius * 0.9))
        clockHandPath.addLine(to: CGPoint(-radius / 10, radius * 0.7))
        clockHandPath.addLine(to: CGPoint(radius / 10, radius * 0.7))
        clockHandPath.addLine(to: CGPoint(0, radius * 0.9))
        
        clockHand = SKShapeNode(path: clockHandPath)
        clockHand.lineWidth = radius / 7
        clockHand.strokeColor = .red
        clockHand.fillColor = clockHand.strokeColor
        
        let whiteCircle = SKShapeNode(circleOfRadius: radius)
        whiteCircle.fillColor = .white
        whiteCircle.lineWidth = 0
        
        clockBG = SKNode()
        clockBG.addChild(whiteCircle)
        
        let tickMarkPath = CGMutablePath()
        tickMarkPath.addLines(between: [CGPoint(0, radius / 2), CGPoint(0, radius * 0.8)])
        for i in 0 ... 7 {
            let theta = CGFloat(i) * .pi / 4
            let tickMark = SKShapeNode(path: tickMarkPath)
            tickMark.lineWidth = radius / 15
            tickMark.strokeColor = .black
            tickMark.zRotation = theta
            clockBG.addChild(tickMark)
        }
        
        super.init()
        
        addChild(tickLabel)
        addChild(clockBG)
        addChild(clockHand)
    }

    public func tick(whileMovingAtSpeed speed: CGFloat, withSimSpeed simSpeed: CGFloat) {
        clockHand.zRotation -= (simSpeed / 150) * sqrt(1 - speed * speed)
        if clockHand.zRotation < -.pi * 2 {
            clockHand.zRotation += .pi * 2
            ticks += 1
            tickLabel.text = "\(ticks)"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
