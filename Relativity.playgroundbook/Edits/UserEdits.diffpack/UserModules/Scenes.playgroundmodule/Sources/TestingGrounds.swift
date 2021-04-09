import SpriteKit
import Entities
import Math

class TestingGrounds: SimScene {
    
    let photon = Photon(position: CGPoint(0, 0), direction: CGVector.random(), radius: 10, color: nil)
    var emitter: SKEmitterNode
    
    let margin: CGFloat = 150
    let rect: SKShapeNode
    
    override init() {
        
        // do stuff up here
        photon.node.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        photon.node.lineWidth = 0
        photon.node.position = CGPoint(x: 0, y: 0)
        
        let bounds = UIScreen.main.bounds
        
        rect = SKShapeNode(rect: CGRect(x: bounds.minX + margin, y: bounds.minY + margin, width: bounds.maxX - margin * 2, height: bounds.maxY - margin * 2))
        rect.fillColor = #colorLiteral(red: 0.0, green: 0.3803921937942505, blue: 0.9921568632125854, alpha: 1.0)
        rect.lineWidth = 0
        
        emitter = SKEmitterNode()
        emitter.particleColor = #colorLiteral(red: 0.4627450704574585, green: 0.7333333492279053, blue: 0.250980406999588, alpha: 1.0)
        emitter.particleBirthRate = 50
        emitter.emissionAngleRange = .pi * 2
        emitter.position = CGPoint(superBounds.midX, superBounds.midY)
        emitter.particleSize = CGSize(width: 10, height: 10)
        emitter.particleLifetime = 10
        emitter.particleAlphaSpeed = -0.1
        emitter.particleSpeed = 0
        emitter.particleSpeedRange = 100
        
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.06666666269302368, green: 0.06666666269302368, blue: 0.06666666269302368, alpha: 1.0)
        addChild(photon.node)
        addChild(rect)
        addChild(emitter)
    }
    
    override func update(_ currentTime: TimeInterval) {
        photon.move(simulationSpeed: simSpeed)
        photon.keepInRect(rect: frame)
        photon.keepOutOfRect(rect: rect.frame)
    }
     
}
