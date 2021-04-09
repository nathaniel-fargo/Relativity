
import UIKit
import SceneKit
import PlaygroundSupport

public class Sim3DViewController: UIViewController {
    var scnView: SCNView!
    var scene: Sim3DScene!
    
    init(scene: Sim3DScene) {
        super.init(nibName: nil, bundle: nil)
        self.scene = scene
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been mplementeded")
    }
    public override func loadView() {
        super.loadView()
        scnView = SCNView(frame: self.view.frame)
        self.view = scnView
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.defaultCameraController.interactionMode = .orbitTurntable
        scnView.defaultCameraController.inertiaEnabled  = true
        scnView.defaultCameraController.maximumVerticalAngle = 80
        scnView.defaultCameraController.minimumVerticalAngle = -80
        scene.sceneDidLoad()
    }
    public func getScene() -> Sim3DScene {
        return scene
    }
}
