
import UIKit
import PlaygroundSupport

public func instantiateViewController(for page: String) -> SimViewController {
    switch page {
    case "bouncingLight":
        return SimViewController(scene: BouncingLight())
    default:
        return SimViewController(scene: TestingGrounds())
    }
}
