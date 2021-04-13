import SpriteKit
import Entities
import Math

let rectsCount = 10

public class BouncingLight: SimScene, MeterDelegate {
    
    let simBounds = CGRect(x: superBounds.minX, y: superBounds.minY, width: superBounds.width - graphWidth, height: superBounds.height)
    let graphBounds = CGRect(x: superBounds.maxX - graphWidth, y: superBounds.minY, width: graphWidth, height: superBounds.height)
    
    var photon: Photon
    
    var rects = [SKShapeNode]()
    
    let meter: Meter
    
    override init() {
        
        meter = Meter(radius: 150, vector: CGVector(1, 0), degrees: [-CGFloat.pi, CGFloat.pi], xAxisLabelText: "X-Velocity", yAxisLabelText: "Y-Velocity")
        meter.position = CGPoint(graphBounds.midX, graphBounds.midY)
        
        photon = Photon(position: CGPoint(50, 50), direction: CGVector(1, 1), radius: nil, color: nil)
        
        // do stuff up here
        while rects.count < rectsCount {
            let w: CGFloat = Random(min: 50, max: 150)
            let h: CGFloat = Random(min: 50, max: 150)
            let newRectRect = CGRect(x: Random(min: simBounds.minX, max: simBounds.maxX - w), y: Random(min: simBounds.minY, max: simBounds.maxY - h), width: w, height: h)
            var passesOverlapTest = true
            for var rect in rects {
                if rect.frame.intersects(newRectRect) {
                    passesOverlapTest = false
                    break
                }
            }
            if passesOverlapTest {
                let newRect = SKShapeNode(rect: newRectRect)
                newRect.fillColor = UIColor(hue: RandomDecimal(), saturation: 0.6, brightness: 0.8, alpha: 1)
                newRect.lineWidth = 5
                rects.append(newRect)
            }
        }
        
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.06665531545877457, green: 0.06667457520961761, blue: 0.06665278226137161, alpha: 1.0)
        
        let graphBG = SKShapeNode(rect: graphBounds)
        graphBG.fillColor = .black
        addChild(graphBG)
        graphBG.lineWidth = 0
        
        addChild(photon)
        for rect in rects {
            addChild(rect)
        }
        
        addChild(meter)
        meter.delegate = self
    }
    
    public override func update(_ currentTime: TimeInterval) {
        photon.move(simulationSpeed: simSpeed)
        photon.keepInRect(rect: simBounds, simSpeed: simSpeed)
        for rect in rects {
            let _ = photon.keepOutOfRect(rect: rect.frame, simSpeed: simSpeed)
        }
        meter.setVector(to: photon.getDirection())
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
    
    public func recieveUpdatedMeterVector(vector: CGVector) {
        photon.setDirection(vec: vector)
    }
    
}
