import CoreGraphics

extension CGVector {
    public static func random() -> CGVector {
        let theta = RandomDecimal() * .pi * 2
        return CGVector(sin(theta), cos(theta))
    }
    // init with CGFloat
    public init(_ dx: CGFloat, _ dy: CGFloat) {
        self.init()
        self.dx = dx
        self.dy = dy
    }
    // Returns magnitude
    public func magnitude () -> CGFloat {
        return CGFloat(sqrt(Double(dx * dx + dy * dy)))
    }
    // returns the magnitude, returns nil if value is zero and optional is selected
    public func magnitude(optional: Bool) -> CGFloat? {
        let mag = CGFloat(sqrt(Double(dx * dx + dy * dy)))
        return mag == 0 && optional ? nil : mag
    }
    // Returns vector with mag of 1
    public func normalized() -> CGVector {
        guard let mag = magnitude(optional: true) else { 
            return CGVector(0, 0)
        }
        return CGVector(dx/mag, dy/mag)
    }
    // Does same but optional for 0,0 vectors
    public func normalized(setZeroTo defaultVector: CGVector) -> CGVector {
        guard let mag = magnitude(optional: true) else { 
            return defaultVector.normalized()
        }
        return CGVector(dx/mag, dy/mag)
    }
    // Add Vectors
    public static func + (_ v1: CGVector, _ v2: CGVector) -> CGVector {
        return CGVector(v1.dx + v2.dx, v1.dy + v2.dy)
    }
    public static func += (_ v1: inout CGVector, _ v2: CGVector) {
        v1 = v1 + v2
    }
    // Subtract Vectors
    public static func - (_ v1: CGVector, _ v2: CGVector) -> CGVector {
        return CGVector(v1.dx - v2.dx, v1.dy - v2.dy)
    }
    public static func -= (_ v1: inout CGVector, _ v2: CGVector) {
        v1 = v1 - v2
    }
    // Multiply Vectors
    public static func * (_ v: CGVector, _ s: CGFloat) -> CGVector {
        return CGVector(v.dx * s, v.dy * s)
    }
    public static func *= (_ v: inout CGVector, _ s: CGFloat) {
        v = v * s
    }
    // Divide Vectors (I don't think I use this but I just wanted to complete the basic maths)
    public static func / (_ v: CGVector, _ s: CGFloat) -> CGVector {
        return CGVector(v.dx / s, v.dy / s)
    }
    public static func /= (_ v: inout CGVector, _ s: CGFloat) {
        v = v / s
    }
}

