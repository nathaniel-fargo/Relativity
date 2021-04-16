import SpriteKit
import Entities
import Math

public class LCSKScene: SKScene, MeterDelegate {
    
    public var simSpeed: CGFloat = 1
    
    let scnBounds: CGRect
    var graphBounds: CGRect = CGRect()
    
    var rocket: SKNode
    var rocketVelocity: CGFloat = 0
    var rocketWidth: CGFloat = 200
    var meter: Meter
    public var meterDelegate: MeterDelegate?
    
    init(size: CGSize, scnBounds: CGRect) {
        
        self.scnBounds = scnBounds
        
        let rocketPath = SKShapeNode(path: RocketPath.rocketPath.cgPath)
        rocketPath.fillColor = .red
        rocketPath.setScale(rocketWidth / 20)
        rocketPath.lineWidth = 0
        rocketPath.zRotation = -.pi / 2
        rocket = SKNode()
        rocket.addChild(rocketPath)
        
        meter = Meter(radius: 150, vector: CGVector(1, 0), degrees: [-CGFloat.pi / 2, CGFloat.pi / 2], labelText: "Rocket Velocity", xAxisLabelText: "Space", yAxisLabelText: "Time")
        
        super.init(size: size)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func didMove(to view: SKView) {
        self.backgroundColor = #colorLiteral(red: 0.06666666269302368, green: 0.06666666269302368, blue: 0.06666666269302368, alpha: 1.0)
        
        graphBounds = CGRect(x: scnBounds.maxX, y: frame.minY, width: frame.width - scnBounds.width, height: frame.height)
        
        meter.position = CGPoint(graphBounds.midX, graphBounds.midY)
        meter.delegate = self
        rocket.position = CGPoint(scnBounds.midX, (graphBounds.maxY - scnBounds.maxY) / 2)
        
        let bg = SKShapeNode(rect: graphBounds)
        bg.fillColor = .black
        bg.lineWidth = 0
        
        addChild(rocket)
        addChild(bg)
        addChild(meter)
    }
    
    public override func update(_ currentTime: TimeInterval) {
        rocket.position.x += rocketVelocity * simSpeed
        if rocket.position.x - rocketWidth / 2 > scnBounds.maxX {
            rocket.position.x = scnBounds.minX - rocketWidth / 2
        } else if rocket.position.x + rocketWidth / 2 < scnBounds.minX {
            rocket.position.x = scnBounds.maxX + rocketWidth / 2
        }
    }
    
    public func recieveUpdatedMeterVector(vector: CGVector) {
        meterDelegate?.recieveUpdatedMeterVector(vector: vector)
        let swap = rocketVelocity * vector.dx <= 0
        if swap {
            let rotAction = SKAction.rotate(toAngle: vector.dx > 0 ? 0 : .pi, duration: rotationTime)
            rocket.run(rotAction)
        }
        let h = (rocketVelocity + vector.dx) / 2
        let scaleMidAction = SKAction.scaleX(to: sqrt(1 - h * h), duration: rotationTime)
        let scaleEndAction = SKAction.scaleX(to: sqrt(1 - rocketVelocity * rocketVelocity), duration: rotationTime)
        let scaleAction = SKAction.sequence([scaleMidAction, scaleEndAction])
        rocket.run(scaleAction)
        rocketVelocity = vector.dx
    }
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
}
