import SceneKit

public class LengthContraction: Sim3DScene {
    
    public override func sceneDidLoad() {
        
        let light = SCNLight()
        light.type = .omni
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: 1.5, y: 1.5, z: 1.5)
        
        let cubeGeometry = SCNBox(width: 0.5, height: 0.5, length: 0.5, chamferRadius: 0.0)
        let cubeNode = SCNNode(geometry: cubeGeometry)
        
        rootNode.addChildNode(lightNode)
        rootNode.addChildNode(cubeNode)
    }
    
}
