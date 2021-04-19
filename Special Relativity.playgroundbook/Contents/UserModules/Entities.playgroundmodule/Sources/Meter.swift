import SpriteKit
import Math 

public protocol MeterDelegate {
    func recieveUpdatedMeterVector(vector: CGVector) -> Void
}

public class Meter: SKShapeNode {
    
    let radius: CGFloat
    var vector: CGVector = CGVector(0, 1)
    var arrow: SKShapeNode!
    public var degrees: [CGFloat] = [0, .pi / 2]
    
    public var delegate: MeterDelegate?
    
    public init(radius: CGFloat, vector: CGVector, degrees: [CGFloat], labelText: String?, xAxisLabelText: String?, yAxisLabelText: String?) {
        self.radius = radius
        self.vector = vector.normalized()
        
        super.init()
        
        self.degrees[0] = min(max(degrees[0],-.pi),0)
        self.degrees[1] = min(max(degrees[1],0),.pi)
        
        let doLeft = self.degrees[0] != 0
        let doRight = self.degrees[1] != 0
        let doBottom = self.degrees[0] < -.pi / 2 || self.degrees[1] > .pi / 2
        
        let arcPath = CGMutablePath()
        arcPath.addArc(center: CGPoint(0, 0), radius: radius, startAngle: .pi / 2 - self.degrees[1] - 0.15, endAngle: .pi / 2 - self.degrees[0] + 0.15, clockwise: false)
        arcPath.addLines(between: [CGPoint(-radius * (doLeft ? 1.1 : 0.1), 0), CGPoint(radius * (doRight ? 1.1 : 0.1), 0)])
        arcPath.addLines(between: [CGPoint(0, -radius * (doBottom ? 1.1 : 0.1)), CGPoint(0, radius * 1.1)])
        let arc = SKShapeNode(path: arcPath)
        arc.lineWidth = radius / 20
        
        let arrowWidth = radius / 12
        let arrowPath = CGMutablePath()
        arrowPath.addLines(between: [CGPoint.zero, CGPoint(0, radius)])
        arrowPath.addEllipse(in: CGRect(x: -arrowWidth / 2, y: -arrowWidth / 2, width: arrowWidth, height: arrowWidth))
        arrowPath.addLines(between: [CGPoint(0, radius + arrowWidth * 2), CGPoint(-arrowWidth, radius), CGPoint(arrowWidth, radius), CGPoint(0, radius + arrowWidth * 2)])
        arrow = SKShapeNode(path: arrowPath)
        arrow.strokeColor = #colorLiteral(red: 0.22745099663734436, green: 0.529411792755127, blue: 0.9960784316062927, alpha: 1.0)
        arrow.fillColor = arrow.strokeColor
        arrow.lineWidth = arrowWidth * 0.8
        arrow.lineCap = .round
        
        if labelText != nil {
            let label = SKLabelNode(text: labelText!)
            label.verticalAlignmentMode = .bottom
            label.position = CGPoint(0, radius * 1.5)
            label.fontSize = radius / 4
            if doLeft && doRight {
                label.fontSize = radius / 3
            } else if doLeft {
                label.position = CGPoint(-radius / 2, radius * 1.5)
            } else if doRight {
                label.position = CGPoint(radius / 2, radius * 1.5)
            }
            label.fontName = "Avenir-Book"
            addChild(label)
        }
        
        let xAxisLabel = SKLabelNode(text: xAxisLabelText ?? "X-Speed")
        xAxisLabel.position = CGPoint(radius * 0.9, radius / 15)
        xAxisLabel.verticalAlignmentMode = .bottom
        xAxisLabel.horizontalAlignmentMode = .right
        xAxisLabel.fontName = "AppleSDGothicNeo"
        xAxisLabel.fontSize = radius * 0.19
        addChild(xAxisLabel)
        
        let yAxisLabel = SKLabelNode(text: yAxisLabelText ?? "Y-Speed")
        yAxisLabel.position = CGPoint(0, radius * 1.2)
        yAxisLabel.verticalAlignmentMode = .bottom
        yAxisLabel.fontName = "AppleSDGothicNeo"
        yAxisLabel.fontSize = radius * 0.19
        addChild(yAxisLabel)
        
        addChild(arc)
        addChild(arrow)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func touched(touchPos: CGPoint) {
        let deltaTouch = CGVector(touchPos.x, touchPos.y) - CGVector(position.x, position.y)
        if deltaTouch.magnitude() < radius * 1.5 {
            var theta = atan2(deltaTouch.dx, deltaTouch.dy)
            if !(theta > degrees[0] && theta < degrees[1]) {
                if theta > 0 {
                    theta = theta - degrees[1] < degrees[0] + .pi * 2 - theta ? degrees[1] : degrees[0]
                } else {
                    theta = theta - degrees[1] + .pi * 2 < degrees[0] - theta ? degrees[1] : degrees[0]
                }
            }
            vector.dx = sin(theta)
            vector.dy = cos(theta)
            delegate?.recieveUpdatedMeterVector(vector: vector)
            updateArrow()
        }
    }
    
    public func setVector(to vec: CGVector) {
        vector = vec.normalized()
        updateArrow()
    }
    
    func updateArrow() {
        let action = SKAction.rotate(toAngle: atan2(-vector.dx, vector.dy), duration: 0.08)
        arrow.run(action)
    }
}
