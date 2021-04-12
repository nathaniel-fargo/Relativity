import SpriteKit
import Entities
import Math

public class BouncingLight: SimScene, MeterDelegate {
    
    let simBounds = CGRect(x: superBounds.minX, y: superBounds.minY, width: superBounds.width - graphWidth, height: superBounds.height)
    let graphBounds = CGRect(x: superBounds.maxX - graphWidth, y: superBounds.minY, width: graphWidth, height: superBounds.height)
    
    var photons = [Photon]()
    
    var rects = [SKShapeNode]()
    let rectsCount = 10
    
    let meter: Meter
    
    public func addPhoton(radius: CGFloat?, color: UIColor?) {
        photons.append(Photon(position: CGPoint(Random(min: simBounds.minX, max: simBounds.maxX), Random(min: simBounds.minY, max: simBounds.maxY)), direction: CGVector.random(), radius: radius, color: color))
        addChild(photons.last!.node)
    }
    public func addPhoton() {
        addPhoton(radius: nil, color: nil)
    }
    
    override init() {
        
        meter = Meter(radius: 150, vector: CGVector(1, 0), degrees: [-CGFloat.pi, CGFloat.pi], xAxisLabelText: "X-Velocity", yAxisLabelText: "Y-Velocity")
        meter.position = CGPoint(graphBounds.midX, graphBounds.midY)
        
        // do stuff up here
        for _ in 0...rectsCount {
            let w: CGFloat = Random(min: 20, max: 150)
            let h: CGFloat = Random(min: 20, max: 150)
            let newRect = SKShapeNode(rect: CGRect(x: Random(min: simBounds.minX, max: simBounds.maxX - w), y: Random(min: simBounds.minY, max: simBounds.maxY - h), width: w, height: h))
            newRect.fillColor = UIColor(hue: RandomDecimal(), saturation: 0.6, brightness: 0.8, alpha: 1)
            newRect.lineWidth = 5
            rects.append(newRect)
        }
        
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.06666666269302368, green: 0.06666666269302368, blue: 0.06666666269302368, alpha: 1.0)
        
        let graphBG = SKShapeNode(rect: graphBounds)
        graphBG.fillColor = .black
        addChild(graphBG)
        graphBG.lineWidth = 0
        
        for i in photons {
            addChild(i.node)
        }
        for i in rects {
            addChild(i)
        }
        
        addPhoton(radius: nil, color: nil)
        
        addChild(meter)
        meter.delegate = self
    }
    
    public override func update(_ currentTime: TimeInterval) {
        for photon in photons {
            photon.move(simulationSpeed: simSpeed)
            photon.keepInRect(rect: simBounds, simSpeed: simSpeed)
            for rect in rects {
                let _ = photon.keepOutOfRect(rect: rect.frame, simSpeed: simSpeed)
            }
        }
        if let photon = photons.first {
            meter.setVector(to: photon.getDirection())
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
    
    public func recieveUpdatedMeterVector(vector: CGVector) {
        for photon in photons {
            photon.setDirection(vec: vector)
        }
    }
    
}
