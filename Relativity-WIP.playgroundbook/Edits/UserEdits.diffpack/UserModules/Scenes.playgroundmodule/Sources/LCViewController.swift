import SceneKit
import SpriteKit
import Entities

public class LCViewController: UIViewController, MeterDelegate {
    
    let graphWidth: CGFloat = 400
    
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
        scnView = SCNView(frame: CGRect(x: f.minX, y: f.minY, width: f.width - graphWidth, height: f.height))
        view.addSubview(scnView)
        skView = SKView(frame: CGRect(x: f.maxX - graphWidth, y: f.minX, width: graphWidth, height: f.height))
        view.addSubview(skView)
        skScene = LCSKScene(size: CGSize(width: graphWidth, height: f.height))
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
        
        skScene.meter.delegate = self
    }
    
    public func recieveUpdatedMeterVector(vector: CGVector) {
        scnScene.setRocketRotation(to: -asin(vector.dx))
    }
}
