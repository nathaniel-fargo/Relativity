
import UIKit
import PlaygroundSupport

public func instantiateViewController(for page: String) -> UIViewController {
    switch page {
    case "bouncingLight":
        return SimViewController(scene: BouncingLight())
    case "clockScene":
        return SimViewController(scene: ClockScene())
    case "movingClock":
        return SimViewController(scene: MovingClock())
    case "adjustableClock":
        return SimViewController(scene: AdjustableClock())
    case "lengthContraction":
        return Sim3DViewController(scene: LengthContraction())
    default:
        return SimViewController(scene: TestingGrounds())
    }
}
