
import UIKit
import SpriteKit
import PlaygroundSupport

public class SimViewController: UIViewController {
    var skView: SKView!
    var scene: SimScene!
    
    init(scene: SimScene) {
        super.init(nibName: nil, bundle: nil)
        self.scene = scene
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been mplementeded")
    }
    public override func loadView() {
        super.loadView()
        skView = SKView.init(frame: self.view.frame)
        self.view = skView
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
            /* idk what this does but maybe mess around with it l8r */
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .aspectFit
        skView.presentScene(scene)
    }
    public func getScene() -> SimScene {
        return scene
    }
}
