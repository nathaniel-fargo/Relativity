import SceneKit
import SpriteKit
import Entities

public class LCViewController: UIViewController, MeterDelegate {
    
    var scnView: SCNView!
    var scnScene = LCSCNScene()
    var skView: SKView!
    var skScene: LCSKScene!
    
    init () {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been mplementeded")
    }
    public override func loadView() {
        super.loadView()
        
        let f = UIScreen.main.bounds
        let sF = CGRect(x: f.minX, y: f.minY, width: f.width - 400, height: f.height - 200)
        
        skView = SKView(frame: f)
        view.addSubview(skView)
        skScene = LCSKScene(size: f.size, scnBounds: sF)
        
        scnView = SCNView(frame: sF)
        view.addSubview(scnView)
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        scnView.scene = scnScene
        scnView.allowsCameraControl = true
        scnView.defaultCameraController.interactionMode = .orbitTurntable
        scnView.defaultCameraController.inertiaEnabled  = true
        scnView.defaultCameraController.maximumVerticalAngle = 89
        scnView.defaultCameraController.minimumVerticalAngle = -1
        scnView.backgroundColor = #colorLiteral(red: 0.07450980693101883, green: 0.21960783004760742, blue: 0.3607843220233917, alpha: 1.0)
        scnScene.sceneDidLoad()
        
        skScene.scaleMode = .aspectFit
        skView.presentScene(skScene)
        skScene.meterDelegate = self
    }
    
    public func recieveUpdatedMeterVector(vector: CGVector) {
        scnScene.setRocketRotation(to: -asin(vector.dx))
    }
    
    public func getScene() -> LCSKScene {
        return skScene
    }
}
