import SceneKit

public class LCSCNScene: SCNScene {
    
    let rocketStilt = SCNNode()
    
    public func sceneDidLoad() {
        
        let lightNodes = [SCNNode(), SCNNode(), SCNNode(), SCNNode()]
        let directionalLight = SCNLight()
        directionalLight.type = .spot
        directionalLight.castsShadow = true
        directionalLight.spotOuterAngle = 5
        lightNodes[0].light = directionalLight
        lightNodes[0].position =  SCNVector3(x: 0, y: 40, z: 0)
        lightNodes[0].look(at: SCNVector3Zero)
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.color = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
        lightNodes[1].light = ambientLight
        let omniLight = SCNLight()
        omniLight.type = .omni
        omniLight.color = UIColor(red: 0.5, green: 0.5, blue: 0.4, alpha: 1)
        lightNodes[2].light = omniLight
        lightNodes[2].position = SCNVector3Make(5, 7, 3)
        lightNodes[2].look(at: SCNVector3Zero)
        let omniLight2 = SCNLight()
        omniLight2.type = .omni
        omniLight2.color = UIColor(red: 0.2, green: 0.2, blue: 0.3, alpha: 1)
        lightNodes[3].light = omniLight2
        lightNodes[3].position = SCNVector3Make(-6, 5, -4)
        lightNodes[3].look(at: SCNVector3Zero)
        
        let floorGeometry = SCNFloor()
        floorGeometry.reflectionFalloffEnd = 5
        floorGeometry.reflectionFalloffStart = 0
        let floorNode = SCNNode(geometry: floorGeometry)
        floorNode.position.y -= 0.5
        
        let axisGeometry = SCNBox(width: 0.03, height: 3, length: 0.03, chamferRadius: 0)
        let timeAxis = SCNNode(geometry: axisGeometry)
        timeAxis.scale.y = 2/3
        timeAxis.position.y = 0.5
        let spaceXAxis = SCNNode(geometry: axisGeometry)
        spaceXAxis.eulerAngles.z += .pi / 2
        let spaceYAxis = SCNNode(geometry: axisGeometry)
        spaceYAxis.eulerAngles.x += .pi / 2
        
        let timeLabelGeometry = SCNText(string: "Time", extrusionDepth: 0.1)
        timeLabelGeometry.font = UIFont(name: "Helvetica", size: 2)
        let timeLabel = SCNNode(geometry: timeLabelGeometry)
        timeLabel.scale = SCNVector3Make(0.1, 0.1, 0.1)
        timeLabel.position = SCNVector3Make(-0.2, 1, 0.03)
        let spaceLabelGeometry = SCNText(string: "Space", extrusionDepth: 0.1)
        spaceLabelGeometry.font = UIFont(name: "Helvetica", size: 2)
        let spaceLabel = SCNNode(geometry: spaceLabelGeometry)
        spaceLabel.scale = SCNVector3Make(0.1, 0.1, 0.1)
        spaceLabel.position = SCNVector3Make(0.7, 0, 0)
        
        let rocketPath = UIBezierPath(ovalIn: CGRect(x: -2, y: -1, width: 4, height: 4))
        rocketPath.move(to: CGPoint(0, 10))
        rocketPath.addCurve(to: CGPoint(5, -2), controlPoint1: CGPoint(4, 8), controlPoint2: CGPoint(5, 3))
        rocketPath.addCurve(to: CGPoint(7, -10), controlPoint1: CGPoint(6, -2), controlPoint2: CGPoint(7, -5))
        rocketPath.addLine(to: CGPoint(5, -10))
        rocketPath.addCurve(to: CGPoint(-5, -10), controlPoint1: CGPoint(3, -3), controlPoint2: CGPoint(-3, -3))
        rocketPath.addLine(to: CGPoint(-7, -10))
        rocketPath.move(to: CGPoint(0, 10))
        rocketPath.addCurve(to: CGPoint(-5, -2), controlPoint1: CGPoint(-4, 8), controlPoint2: CGPoint(-5, 3))
        rocketPath.addCurve(to: CGPoint(-7, -10), controlPoint1: CGPoint(-6, -2), controlPoint2: CGPoint(-7, -5))
        rocketPath.close()
        rocketPath.flatness = 0.01
        
        let rocketGeometry = SCNShape(path: rocketPath, extrusionDepth: 0.1)
        let rocketNode = SCNNode(geometry: rocketGeometry)
        rocketNode.scale = SCNVector3Make(0.05, 0.05, 0.05)
        rocketNode.eulerAngles.x -= .pi / 2
        rocketNode.eulerAngles.y += .pi / 2
        rocketNode.position.y = 1
        
        let rocketVectorGeometry = SCNGeometry(sources: [SCNGeometrySource(vertices: [
            // Base
            SCNVector3Make(1, 0, 1),
            SCNVector3Make(1, 0, -1),
            SCNVector3Make(-1, 0, -1),
            SCNVector3Make(-1, 0, 1),
            SCNVector3Make(1, 0, 1),
            // Right Side
            SCNVector3Make(1, 10, 1),
            SCNVector3Make(1, 10, -1),
            SCNVector3Make(1, 0, -1),
            SCNVector3Make(1, 0, 1),
            // Front Side
            SCNVector3Make(1, 10, 1),
            SCNVector3Make(-1, 10, 1),
            SCNVector3Make(-1, 0, 1),
            SCNVector3Make(1, 0, 1),
            // Left Side
            SCNVector3Make(-1, 0, 1),
            SCNVector3Make(-1, 0, -1),
            SCNVector3Make(-1, 10, -1),
            SCNVector3Make(-1, 10, 1),
            SCNVector3Make(-1, 0, 1),
            // Back Side
            SCNVector3Make(-1, 0, -1),
            SCNVector3Make(1, 0, -1),
            SCNVector3Make(1, 10, -1),
            SCNVector3Make(-1, 10, -1),
            // Top Side
            SCNVector3Make(-1, 10, 1),
            SCNVector3Make(1, 10, 1),
            SCNVector3Make(1, 10, -1),
            SCNVector3Make(-1, 10, -1)
        ])], elements: nil)
        let rocketVector = SCNNode(geometry: rocketVectorGeometry)
        rocketVector.scale = SCNVector3Make(0.1, 0.1, 0.1)
        rocketVector.position.y = 1
        
        rocketStilt.addChildNode(rocketNode)
        rocketStilt.addChildNode(rocketVector)
        
        let floorMaterial = SCNMaterial()
        floorMaterial.diffuse.contents = UIColor(red: 0, green: 0.5, blue: 1, alpha: 1)
        floorGeometry.materials = [floorMaterial]
        
        let axisMaterial = SCNMaterial()
        axisMaterial.diffuse.contents = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        axisGeometry.materials = [axisMaterial]
        rocketVectorGeometry.materials = [axisMaterial]
        
        for lightNode in lightNodes {
            rootNode.addChildNode(lightNode)
        }
        rootNode.addChildNode(floorNode)
        rootNode.addChildNode(timeAxis)
        rootNode.addChildNode(spaceXAxis)
        rootNode.addChildNode(spaceYAxis)
        rootNode.addChildNode(timeLabel)
        rootNode.addChildNode(spaceLabel)
        rootNode.addChildNode(rocketStilt)
    }
    
    func setRocketRotation(to rotation: CGFloat) {
        let rotAction = SCNAction.rotateTo(x: 0, y: 0, z: rotation, duration: 0.1)
        rocketStilt.runAction(rotAction)
    }
    
}
