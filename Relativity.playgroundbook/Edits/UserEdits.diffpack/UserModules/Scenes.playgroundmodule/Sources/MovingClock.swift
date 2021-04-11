import SpriteKit
import Entities
import Math

public class MovingClock: SimScene {
    
    public func addClock(speed: CGFloat) {
        clockY = clockY - clockHeight - clockPadding
        clockY = clockY > 0 ? clockY : clockY + superBounds.height - clockHeight
        let newClock = LightClock(frame: CGRect(x: superBounds.midX - clockWidth / 2, y: clockY, width: clockWidth, height: clockHeight), mirrorHeight: 30, photonRadius: nil, mirrorColor: UIColor(hue: RandomDecimal(), saturation: speed, brightness: 0.5, alpha: 1))
        newClock.velocity = speed
        newClock.addChildren(to: self)
        clocks.append(newClock)
    }
    
    var clocks = [LightClock]()
    
    let clockHeight: CGFloat = 200
    let clockWidth: CGFloat = 100
    let clockPadding: CGFloat = 50
    var clockY: CGFloat = superBounds.maxY
    
    public override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.06666666269302368, green: 0.06666666269302368, blue: 0.06666666269302368, alpha: 1.0)
        for i in clocks {
            i.addChildren(to: self)
        }
    }
    
    public override func update(_ currentTime: TimeInterval) {
        for clock in clocks {
            clock.update(bounds: frame, simSpeed: simSpeed)
        }
    }
    
}
