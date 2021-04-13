import CoreGraphics

extension CGPoint {
    public init(_ x: CGFloat, _ y: CGFloat) {
        self.init()
        self.x = x
        self.y = y
    }
    static public func + (_ a: CGPoint, _ b: CGPoint) -> CGPoint {
        return CGPoint(x: a.x + b.x, y: a.y + b.y)
    }
    static public func += (_ a: inout CGPoint, _ b: CGPoint) {
        a = a + b
    }
    static public func + (_ p: CGPoint, _ v: CGVector) -> CGPoint {
        return p + CGPoint(v.dx, v.dy)
    }
    static public func += (_ p: inout CGPoint, _ v: CGVector) {
        p = p + v
    }
}
