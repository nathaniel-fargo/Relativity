import SpriteKit
import Entities
import Math

public class LightTunnel: SimScene, MeterDelegate {
    
    let simBounds = CGRect(x: superBounds.minX, y: superBounds.minY, width: superBounds.width - graphWidth, height: superBounds.height)
    let graphBounds = CGRect(x: superBounds.maxX - graphWidth, y: superBounds.minY, width: graphWidth, height: superBounds.height)
    
    var stuckPhoton: Photon
    var movingPhoton: Photon
    
    let stuckPhotonBox: SKShapeNode
    let movingPhotonBox: SKShapeNode
    
    let rectsCount = 10
    
    let meter: Meter
    
    override init() {
        
        meter = Meter(radius: 150, vector: CGVector(1, 0), degrees: [-CGFloat.pi / 2, CGFloat.pi / 2], xAxisLabelText: "X-Velocity", yAxisLabelText: "Y-Speed")
        meter.position = CGPoint(graphBounds.midX, graphBounds.midY)
        
        stuckPhotonBox = SKShapeNode(rect: CGRect(x: simBounds.width * 2 / 5 + simBounds.minX, y: simBounds.minY + simBounds.height * 7 / 12, width: simBounds.width / 5, height: simBounds.height / 4), cornerRadius: 10)
        stuckPhotonBox.lineWidth = 0
        stuckPhotonBox.fillColor = #colorLiteral(red: 0.11760873347520828, green: 0.11767067760229111, blue: 0.11760520190000534, alpha: 1.0)
        movingPhotonBox = SKShapeNode(rect: CGRect(x: simBounds.minX - 50, y: simBounds.minY + simBounds.height / 6, width: simBounds.width + 100, height: simBounds.height / 4))
        movingPhotonBox.lineWidth = 0
        movingPhotonBox.fillColor = #colorLiteral(red: 0.1176309660077095, green: 0.11765829473733902, blue: 0.11762735992670059, alpha: 1.0)
        
        stuckPhoton = Photon(position: CGPoint(stuckPhotonBox.frame.midX, stuckPhotonBox.frame.midY), direction: CGVector(0, 1), radius: nil, color: nil)
        movingPhoton = Photon(position: CGPoint(movingPhotonBox.frame.midX, movingPhotonBox.frame.midY), direction: CGVector(0, 1), radius: nil, color: nil)
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.0588129460811615, green: 0.058830924332141876, blue: 0.058810554444789886, alpha: 1.0)
        
        let graphBG = SKShapeNode(rect: graphBounds)
        graphBG.fillColor = .black
        graphBG.lineWidth = 0
        
        meter.delegate = self
        
        addChild(stuckPhotonBox)
        addChild(movingPhotonBox)
        
        addChild(stuckPhoton)
        addChild(movingPhoton)
        
        addChild(graphBG)
        addChild(meter)
    }
    
    public override func update(_ currentTime: TimeInterval) {
        
        stuckPhoton.move(simulationSpeed: simSpeed)
        movingPhoton.move(simulationSpeed: simSpeed)
        
        let _ = stuckPhoton.keepInRect(rect: stuckPhotonBox.frame)
        let collision = movingPhoton.keepInRect(rect: movingPhotonBox.frame)
        if movingPhoton.position.x - movingPhoton.radius > simBounds.maxX {
            movingPhoton.position.x = simBounds.minX - movingPhoton.radius
        } else if movingPhoton.position.x + movingPhoton.radius < simBounds.minX {
            movingPhoton.position.x = simBounds.maxX + movingPhoton.radius
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
    
    public func recieveUpdatedMeterVector(vector: CGVector) {
        movingPhoton.setDX(x: vector.dx)
    }
    
}
