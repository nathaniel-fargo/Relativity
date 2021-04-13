import SceneKit
import Math

public class LCSCNScene: SCNScene {
    
    let rocketStilt = SCNNode()
    
    public func sceneDidLoad() {
        
        let lightNodes = [SCNNode(), SCNNode(), SCNNode(), SCNNode()]
        let directionalLight = SCNLight()
        directionalLight.type = .spot
        directionalLight.castsShadow = true
        directionalLight.spotOuterAngle = 5
        lightNodes[0].light = directionalLight
        lightNodes[0].position =  SCNVector3(x: 0, y: 50, z: 0)
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
        timeLabelGeometry.flatness = 0.01
        let timeLabel = SCNNode(geometry: timeLabelGeometry)
        timeLabel.scale = SCNVector3Make(0.1, 0.1, 0.1)
        timeLabel.position = SCNVector3Make(-0.2, 1, 0)
        let spaceLabelGeometry = SCNText(string: "Space", extrusionDepth: 0.1)
        spaceLabelGeometry.font = UIFont(name: "Helvetica", size: 2)
        spaceLabelGeometry.flatness = 0.01
        let spaceLabel = SCNNode(geometry: spaceLabelGeometry)
        spaceLabel.scale = SCNVector3Make(0.1, 0.1, 0.1)
        spaceLabel.position = SCNVector3Make(0.7, 0, 0)
        
        let rocketPath = UIBezierPath(ovalIn: CGRect(x: -2, y: -2, width: 4, height: 4))
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
        
        let rocketGeometry = SCNShape(path: rocketPath, extrusionDepth: 0.05)
        let rocketNode = SCNNode(geometry: rocketGeometry)
        rocketNode.scale = SCNVector3Make(0.05, 0.05, 0.05)
        rocketNode.eulerAngles.x = .pi / 2
        rocketNode.eulerAngles.y = .pi
        rocketNode.position.y = 1
        
        let rocketVectorLineGeometry = SCNBox(width: 0.05, height: 1.55, length: 0.05, chamferRadius: 0.025)
        let rocketVectorLine = SCNNode(geometry: rocketVectorLineGeometry)
        rocketVectorLine.position.y = 0.75
        
        let rocketVectorTipGeometry = SCNCone(topRadius: 0.01, bottomRadius: 0.07, height: 0.2)
        let rocketVectorTip = SCNNode(geometry: rocketVectorTipGeometry)
        rocketVectorTip.position.y = 1.6
        
        rocketStilt.addChildNode(rocketNode)
        let rocketVector = SCNNode()
        rocketVector.addChildNode(rocketVectorLine)
        rocketVector.addChildNode(rocketVectorTip)
        rocketStilt.addChildNode(rocketVector)
        
        let floorMaterial = SCNMaterial()
        floorMaterial.diffuse.contents = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 1)
        floorGeometry.materials = [floorMaterial]
        
        let axisMaterial = SCNMaterial()
        axisMaterial.diffuse.contents = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.5)
        axisGeometry.materials = [axisMaterial]
        
        let textMaterial = SCNMaterial()
        textMaterial.diffuse.contents = UIColor.black
        spaceLabelGeometry.materials = [textMaterial]
        timeLabelGeometry.materials = [textMaterial]
        
        let rocketMaterial = SCNMaterial()
        rocketMaterial.diffuse.contents = #colorLiteral(red: 0.3967612087726593, green: -0.02950986661016941, blue: -0.024995913729071617, alpha: 1.0)
        rocketGeometry.materials = [rocketMaterial]
        
        let vectorMaterial = SCNMaterial()
        vectorMaterial.diffuse.contents = #colorLiteral(red: 0.0, green: 0.33725491166114807, blue: 0.8392156958580017, alpha: 1.0)
        rocketVectorTipGeometry.materials = [vectorMaterial]
        rocketVectorLineGeometry.materials = [vectorMaterial]
        
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
        let rotAction = SCNAction.rotateTo(x: 0, y: 0, z: rotation * rotationFactor, duration: rotationTime)
        rocketStilt.runAction(rotAction)
        print(rotation)
    }
    
}
