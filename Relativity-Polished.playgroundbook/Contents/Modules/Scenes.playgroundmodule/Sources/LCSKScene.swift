import SpriteKit
import Entities

class LCSKScene: SKScene {
    
    public var meter: Meter
    
    override init(size: CGSize) {
        
        meter = Meter(radius: 150, vector: CGVector(1, 0), degrees: [-CGFloat.pi / 2, CGFloat.pi / 2], xAxisLabelText: "Space", yAxisLabelText: "Time")
        
        super.init(size: size)
        
        meter.position = CGPoint(frame.midX, frame.midY)
        
        self.backgroundColor = UIColor.black
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func didMove(to view: SKView) {
        addChild(meter)
    }
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        meter.touched(touchPos: touches.first!.location(in: self))
    }
}
