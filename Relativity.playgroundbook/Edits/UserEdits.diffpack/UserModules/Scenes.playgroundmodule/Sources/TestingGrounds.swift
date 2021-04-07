
import SpriteKit
import GameKit

class TestingGrounds: SimScene {
    
    let photon = SKShapeNode(circleOfRadius: 100)
    
    override init() {
        
        // do stuff up here
        photon.fillColor = #colorLiteral(red: 0.886274516582489, green: 0.1411764770746231, blue: 0.0, alpha: 1.0)
        photon.strokeColor = #colorLiteral(red: 0.9960784316062927, green: 0.7058823704719543, blue: 0.24705880880355835, alpha: 1.0)
        photon.position = CGPoint(x: 200, y: 200)
        
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        photon.position
        addChild(photon)
        children
    }
    
    override func update(_ currentTime: TimeInterval) {
        // photon.setScale(2)
    }
     
}
