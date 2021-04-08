
import SpriteKit
import GameKit
import Entities
import Math

class TestingGrounds: SimScene {
    
    let photon = LightRay(position: CGPoint(0, 0), direction: CGVector(RandomDecimal(), RandomDecimal()), radius: 10)
    
    let rect = SKShapeNode(rect: CGRect(x: 150, y: 150, width: 724, height: 468))
    
    override init() {
        
        // do stuff up here
        photon.node.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        photon.node.lineWidth = 0
        photon.node.position = CGPoint(x: 0, y: 0)
        rect.fillColor = #colorLiteral(red: 0.0, green: 0.3803921937942505, blue: 0.9921568632125854, alpha: 1.0)
        rect.lineWidth = 5
        
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.06666666269302368, green: 0.06666666269302368, blue: 0.06666666269302368, alpha: 1.0)
        addChild(photon.node)
        addChild(rect)
    }
    
    override func update(_ currentTime: TimeInterval) {
        photon.move(simulationSpeed: simSpeed)
        photon.keepInRect(rect: frame)
        photon.keepOutOfRect(rect: rect.frame)
    }
     
}
