
import UIKit
import PlaygroundSupport

public func instantiateViewController(for page: String) -> UIViewController {
    switch page {
    case "bouncingLight":
        return SimViewController(scene: BouncingLight())
    // Scene 2
    case "lightTunnel":
        return SimViewController(scene: LightTunnel())
    // Scene 3
    case "lightClock":
        return SimViewController(scene: LightClockScene())
    // Scene 4
    case "rocketClock":
        return SimViewController(scene: RocketClock())
    // Scene 5
    case "lengthContraction":
        return LCViewController()
    // Scene 6
    default:
        return SimViewController(scene: Conclusion())
    }
}
