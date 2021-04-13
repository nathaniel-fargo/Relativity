import SpriteKit
import Entities
import Math

let mirrorHeight: CGFloat = 30

public class LightClockScene: SimScene, MeterDelegate {
    
    let simBounds = CGRect(x: superBounds.minX, y: superBounds.minY, width: superBounds.width - graphWidth, height: superBounds.height)
    let graphBounds = CGRect(x: superBounds.maxX - graphWidth, y: superBounds.minY, width: graphWidth, height: superBounds.height)
    
    let photonMeter: Meter
    let clockMeter: Meter
    
    let stillClock: LightClock
    let movingClock: LightClock
    
    public override init() {
        
        stillClock = LightClock(frame: CGRect(x: simBounds.minX + simBounds.width * 2 / 5, y: simBounds.minY + simBounds.height * 7 / 12 - mirrorHeight, width: simBounds.width / 5, height: simBounds.height / 4 + mirrorHeight * 2), mirrorHeight: mirrorHeight, photonRadius: nil, mirrorColor: #colorLiteral(red: 0.5215686559677124, green: 0.5215686559677124, blue: 0.5215686559677124, alpha: 1.0))
        movingClock = LightClock(frame: CGRect(x: simBounds.minX + simBounds.width * 2 / 5 , y: simBounds.minY + simBounds.height / 6 - mirrorHeight, width: simBounds.width / 5, height: simBounds.height / 4 + mirrorHeight * 2), mirrorHeight: mirrorHeight, photonRadius: nil, mirrorColor: #colorLiteral(red: 0.0, green: 0.33725491166114807, blue: 0.8392156958580017, alpha: 1.0))
        
        let meterRadius: CGFloat = min(graphBounds.width / 3, graphBounds.height / 6)
        photonMeter = Meter(radius: meterRadius, vector: CGVector(1, 2), degrees: [-CGFloat.pi / 2, CGFloat.pi / 2], xAxisLabelText: "X-Velocity", yAxisLabelText: "Y-Speed")
        clockMeter = Meter(radius: meterRadius, vector: CGVector(1, 2), degrees: [-CGFloat.pi / 2, CGFloat.pi / 2], xAxisLabelText: "Space", yAxisLabelText: "Time")
        
        photonMeter.position = CGPoint(graphBounds.midX, graphBounds.maxY - meterRadius * 2.5)
        clockMeter.position = CGPoint(graphBounds.midX, graphBounds.minY + meterRadius * 0.5)
        
        super.init()
        
        photonMeter.delegate = self
        clockMeter.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.06666666269302368, green: 0.06666666269302368, blue: 0.06666666269302368, alpha: 1.0)
        
        let graphBG = SKShapeNode(rect: graphBounds)
        let stillRectBG = SKShapeNode(rect: CGRect(x: stillClock.invisibleFrame.minX, y: stillClock.invisibleFrame.minY + mirrorHeight, width: stillClock.invisibleFrame.width, height: stillClock.invisibleFrame.height - mirrorHeight * 2), cornerRadius: 10)
        let movingRectBG = SKShapeNode(rect: CGRect(x: simBounds.minX, y: movingClock.invisibleFrame.minY + mirrorHeight, width: simBounds.width, height: movingClock.invisibleFrame.height - mirrorHeight * 2))
        graphBG.fillColor = .black
        stillRectBG.fillColor = #colorLiteral(red: 0.11764705181121826, green: 0.11764705181121826, blue: 0.11764705181121826, alpha: 1.0)
        movingRectBG.fillColor = stillRectBG.fillColor
        graphBG.lineWidth = 0
        stillRectBG.lineWidth = 0
        movingRectBG.lineWidth = 0
        
        addChild(stillRectBG)
        addChild(stillClock)
        
        addChild(movingRectBG)
        addChild(movingClock)
        
        addChild(graphBG)
        addChild(photonMeter)
        addChild(clockMeter)
        
    }
    
    public override func update(_ currentTime: TimeInterval) {
        stillClock.update(bounds: simBounds, simSpeed: simSpeed)
        movingClock.update(bounds: simBounds, simSpeed: simSpeed)
    }
    
    public func recieveUpdatedMeterVector(vector: CGVector) {
        movingClock.velocity = vector.dx
        photonMeter.setVector(to: vector)
        clockMeter.setVector(to: vector)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touched(touchPosition: touches.first!.location(in: self))
    }
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touched(touchPosition: touches.first!.location(in: self))
    }
    func touched(touchPosition: CGPoint) {
        photonMeter.touched(touchPos: touchPosition)
        clockMeter.touched(touchPos: touchPosition)
    }
    
}
