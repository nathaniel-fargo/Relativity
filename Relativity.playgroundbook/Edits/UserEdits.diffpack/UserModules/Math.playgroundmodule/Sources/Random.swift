import CoreGraphics

var randomizer = SystemRandomNumberGenerator()
public func Random() -> CGFloat {
    return CGFloat(randomizer.next())
}
public func RandomDecimal() -> CGFloat {
    return CGFloat(randomizer.next()) / CGFloat(Int64.max) / 2
}
public func Random(min: CGFloat, max: CGFloat) -> CGFloat {
    return CGFloat(randomizer.next()) / CGFloat(Int64.max) / 2 * (max - min) + min
}
public func Random(min: Int, max: Int) -> Int {
    return Int(randomizer.next(upperBound: UInt(max - min))) + min
}
