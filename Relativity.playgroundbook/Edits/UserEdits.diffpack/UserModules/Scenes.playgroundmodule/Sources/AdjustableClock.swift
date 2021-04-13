import SpriteKit
import Entities
import Math

public class AdjustableClock: SimScene, MeterDelegate {
    
    let clockBounds: CGRect = CGRect(x: superBounds.minX, y: superBounds.minY, width: superBounds.width - graphWidth, height: superBounds.height)
    let graphBounds: CGRect = CGRect(x: superBounds.maxX - graphWidth, y: superBounds.minY, width: graphWidth, height: superBounds.height)
    
    public var clock: LightClock
    let bg: SKShapeNode
    let meter: Meter
    var labels = [SKLabelNode]()
    
    override init() {
        let width: CGFloat = 100
        let height: CGFloat = clockBounds.height / 3
        let clockFrame = CGRect(x: clockBounds.midX - width / 2, y: clockBounds.midY - height / 2, width: width, height: height)
        clock = LightClock(frame: clockFrame, mirrorHeight: min(40, height / 3), photonRadius: min(20, height / 6), mirrorColor: #colorLiteral(red: 0.0, green: 0.3803921937942505, blue: 0.9960784316062927, alpha: 1.0))
        
        bg = SKShapeNode(rect: graphBounds)
        bg.fillColor = #colorLiteral(red: 0.07249999046325684, green: 0.1224999949336052, blue: 0.125, alpha: 1.0)
        bg.lineWidth = 0
        
        meter = Meter(radius: 150, vector: CGVector(0, 1), degrees: [-CGFloat.pi / 2, CGFloat.pi / 2], xAxisLabelText: "Space", yAxisLabelText: "Time")
        meter.position = CGPoint(graphBounds.midX, graphBounds.midY)
        
        super.init()
        
        meter.delegate = self
        
        createLabels()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.06665531545877457, green: 0.06667457520961761, blue: 0.06665278226137161, alpha: 1.0)
        addChild(clock)
        addChild(bg)
        addChild(meter)
        for label in labels {
            addChild(label)
        }
    }
    
    public override func update(_ currentTime: TimeInterval) {
        clock.update(bounds: clockBounds, simSpeed: simSpeed)
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
    
    public func recieveUpdatedMeterVector(vector: CGVector) {
        clock.velocity = vector.dx
    }
    
    func createLabels() {
        let lightMessage = SKLabelNode(text: "The light particle always traveling at the same speed!")
        lightMessage.position = CGPoint(clockBounds.midX, clockBounds.minY + 5)
        lightMessage.verticalAlignmentMode = .bottom
        lightMessage.preferredMaxLayoutWidth = clockBounds.width - 10
        lightMessage.numberOfLines = 2
        lightMessage.fontName = "AppleSDGothicNeo-Light"
        labels.append(lightMessage)
        let meterMessage = SKLabelNode(text: "Instead of representing the light particle in rates of X and Y, we represent the clock in rates of time and space")
        meterMessage.position = CGPoint(graphBounds.midX, graphBounds.midY - 20)
        meterMessage.verticalAlignmentMode = .top
        meterMessage.preferredMaxLayoutWidth = graphWidth - 10
        meterMessage.numberOfLines = 5
        meterMessage.fontName = "AppleSDGothicNeo-Light"
        labels.append(meterMessage)
    }
}
