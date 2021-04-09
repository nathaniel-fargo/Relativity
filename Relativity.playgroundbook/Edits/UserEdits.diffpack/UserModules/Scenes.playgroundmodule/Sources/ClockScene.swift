import SpriteKit
import Entities
import Math

public class ClockScene: SimScene {
    
    public var stillClock: LightClock? = nil
    
    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addClock(height: CGFloat, color: UIColor) {
        stillClock = LightClock(frame: CGRect(x: superBounds.midX - superBounds.width / 6, y: superBounds.midY - height / 2, width: superBounds.width / 3, height: height), mirrorHeight: min(40, height / 3), photonRadius: min(20, height / 6), mirrorColor: color)
        stillClock?.addChildren(to: self)
    }
    
    public override func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.06666666269302368, green: 0.06666666269302368, blue: 0.06666666269302368, alpha: 1.0)
    }
    
    public override func update(_ currentTime: TimeInterval) {
        stillClock?.update(bounds: superBounds, simSpeed: simSpeed)
    }
    
}
