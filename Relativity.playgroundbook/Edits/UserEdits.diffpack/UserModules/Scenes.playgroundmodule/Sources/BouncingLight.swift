import SpriteKit
import Entities
import Math

public class BouncingLight: SimScene {
    
    var photons = [Photon]()
    
    var rects = [SKShapeNode]()
    let rectsCount = 10
    
    public func addPhoton(radius: CGFloat?, color: UIColor?) {
        photons.append(Photon(position: CGPoint(Random(min: superBounds.minX, max: superBounds.maxX), Random(min: superBounds.minY, max: superBounds.maxY)), direction: CGVector.random(), radius: radius, color: color))
        addChild(photons.last!.node)
    }
    public func addPhoton() {
        addPhoton(radius: nil, color: nil)
    }
    
    override init() {
        
        // do stuff up here
        for i in 0...rectsCount {
            let w: CGFloat = Random(min: 20, max: 150)
            let h: CGFloat = Random(min: 20, max: 150)
            let newRect = SKShapeNode(rect: CGRect(x: Random(min: superBounds.minX, max: superBounds.maxX - w), y: Random(min: superBounds.minY, max: superBounds.maxY - h), width: w, height: h))
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
        for i in photons {
            addChild(i.node)
        }
        for i in rects {
            addChild(i)
        }
    }
    
    public override func update(_ currentTime: TimeInterval) {
        for i in photons {
            i.move(simulationSpeed: simSpeed)
            i.keepInRect(rect: frame)
            for j in rects {
                if (i.keepOutOfRect(rect: j.frame) != nil) {
                    // adds a bit of random
                    i.setDY(y: (i.getDirection() + CGVector.random() * 0.1).normalized().dy)
                }
            }
        }
    }
    
}
