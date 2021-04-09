import SceneKit
import GameKit
import PlaygroundSupport

public class Sim3DScene: SCNScene {
    
    public var simSpeed: CGFloat = 1
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init() {
        super.init()
    }
    
    // add functions as needed
    func sceneDidLoad() {
        
    }
}
