
import UIKit
import PlaygroundSupport

public func instantiateViewController(for page: String) -> UIViewController {
    switch page {
    // Scene 2
    case "lightTunnel":
        return SimViewController(scene: LightTunnel())
    // Scene 4
    case "lengthContraction":
        return LCViewController()
    // Gonna rename/reuse these as something different
    case "movingClock":
        return SimViewController(scene: MovingClock())
    // Scene 3
    case "adjustableClock":
        return SimViewController(scene: AdjustableClock())
    // Probably won't use this
    case "clockScene":
        return SimViewController(scene: ClockScene())
    // Scene 1
    default:
        return SimViewController(scene: BouncingLight())
    }
}
