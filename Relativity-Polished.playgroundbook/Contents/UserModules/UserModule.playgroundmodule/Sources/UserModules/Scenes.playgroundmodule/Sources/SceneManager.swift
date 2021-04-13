
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
    case "lightClock":
        return SimViewController(scene: LightClockScene())
    // Scene 3
    case "adjustableClock":
        return SimViewController(scene: AdjustableClock())
    // Scene 1
    default:
        return SimViewController(scene: BouncingLight())
    }
}
