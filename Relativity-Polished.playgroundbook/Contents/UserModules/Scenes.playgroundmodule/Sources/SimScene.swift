
import SpriteKit
import Math

public class SimScene: SKScene {
    
    public var simSpeed: CGFloat = 1
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init() {
        super.init(size: superBounds.size)
        self.backgroundColor = UIColor.white
    }
    public override func didMove(to view: SKView) {
        
    }
    
    // add functions as needed
}
