import UIKit

public class RocketPath {
    public static var rocketPath: UIBezierPath {
        get {
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
            rocketPath.flatness = 0.01
            return rocketPath
        }
    }
}
