import SpriteKit
import Entities
import Math

public class AdjustableClock: SimScene {
    
    let clockBounds: CGRect = CGRect(x: superBounds.minX, y: superBounds.minY, width: superBounds.width * 2/3, height: superBounds.height)
    let graphBounds: CGRect = CGRect(x: superBounds.width * 2/3, y: superBounds.minY, width: superBounds.width / 3, height: superBounds.height)
    let arcRadius: CGFloat = min(150, superBounds.width / 5)
    
    public var clock: LightClock
    let bg: SKShapeNode
    let arc: SKShapeNode
    var vector: SKShapeNode
    var labels = [SKLabelNode]()
    
    override init() {
        let width: CGFloat = 100
        let height: CGFloat = clockBounds.height / 3
        let clockFrame = CGRect(x: clockBounds.midX - width / 2, y: clockBounds.midY - height / 2, width: width, height: height)
        clock = LightClock(frame: clockFrame, mirrorHeight: min(40, height / 3), photonRadius: min(20, height / 6), mirrorColor: #colorLiteral(red: 0.0, green: 0.3803921937942505, blue: 0.9960784316062927, alpha: 1.0))
        
        bg = SKShapeNode(rect: graphBounds)
        bg.fillColor = #colorLiteral(red: 0.07249999046325684, green: 0.1224999949336052, blue: 0.125, alpha: 1.0)
        bg.lineWidth = 0
        
        let arcPath = CGMutablePath()
        arcPath.addArc(center: CGPoint(graphBounds.midX, graphBounds.midY), radius: arcRadius, startAngle: -0.2, endAngle: .pi + 0.2, clockwise: false)
        arcPath.addLines(between: [CGPoint(graphBounds.midX - arcRadius * 1.2, graphBounds.midY), CGPoint(graphBounds.midX + arcRadius * 1.2, graphBounds.midY)])
        arcPath.addLines(between: [CGPoint(graphBounds.midX, graphBounds.midY - arcRadius * 0.2), CGPoint(graphBounds.midX, graphBounds.midY + arcRadius * 1.2)])
        arc = SKShapeNode(path: arcPath)
        arc.lineWidth = 5
        
        let vectorWidth: CGFloat = 12
        let vectorPath = CGMutablePath()
        vectorPath.addLines(between: [CGPoint.zero, CGPoint(0, arcRadius)])
        vectorPath.addEllipse(in: CGRect(x: -vectorWidth / 2, y: -vectorWidth / 2, width: vectorWidth, height: vectorWidth))
        vectorPath.addLines(between: [CGPoint(0, arcRadius + vectorWidth * 2), CGPoint(-vectorWidth, arcRadius), CGPoint(vectorWidth, arcRadius), CGPoint(0, arcRadius + vectorWidth * 2)])
        vector = SKShapeNode(path: vectorPath)
        vector.position = CGPoint(graphBounds.midX, graphBounds.midY)
        vector.strokeColor = #colorLiteral(red: 0.0, green: 0.33725491166114807, blue: 0.8392156958580017, alpha: 1.0)
        vector.fillColor = vector.strokeColor
        vector.lineWidth = vectorWidth * 0.8
        vector.lineCap = .round
        
        super.init()
        
        createLabels()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.06665531545877457, green: 0.06667457520961761, blue: 0.06665278226137161, alpha: 1.0)
        clock.addChildren(to: self)
        addChild(bg)
        addChild(arc)
        addChild(vector)
        for label in labels {
            addChild(label)
        }
    }
    
    public override func update(_ currentTime: TimeInterval) {
        clock.update(bounds: clockBounds, simSpeed: simSpeed)
        let theta = -asin(clock.velocity / 100)
        vector.zRotation = theta
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let position = touches.first!.location(in: self)
        if graphBounds.contains(position) {
            let theta = min(.pi, max(0, atan2(position.x - graphBounds.midX, position.y - graphBounds.midY) + .pi / 2))
            clock.velocity = -cos(theta) * 100
        }
    }
    
    func createLabels() {
        labels.append(SKLabelNode(text: "The light particle always travels at the same speed, but appears slower when it has to travel horizontally"))
        labels.last!.position = CGPoint(clockBounds.midX, clockBounds.minY + 5)
        labels.last!.horizontalAlignmentMode = .center
        labels.last!.verticalAlignmentMode = .bottom
        labels.last!.preferredMaxLayoutWidth = clockBounds.width - 10
        labels.last!.numberOfLines = 3
        labels.last!.fontName = "AppleSDGothicNeo-Light"
        labels.append(SKLabelNode(text: "Speed"))
        labels.last!.position = CGPoint(graphBounds.midX + arcRadius - 15, graphBounds.midY - 10)
        labels.last!.verticalAlignmentMode = .top
        labels.last!.horizontalAlignmentMode = .right
        labels.last!.fontName = "AppleSDGothicNeo"
        labels.append(SKLabelNode(text: "Time"))
        labels.last!.position = CGPoint(graphBounds.midX, graphBounds.midY + arcRadius * 1.2 + 10)
        labels.last!.verticalAlignmentMode = .bottom
        labels.last!.fontName = "AppleSDGothicNeo"
    }
    
}
