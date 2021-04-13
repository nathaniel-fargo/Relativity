import PlaygroundSupport
import UIKit

// Create View
let view = instantiateViewController(for: "default")
// Set View
PlaygroundPage.current.liveView = view
// Get Scene
let scene = (view as! SimViewController).getScene() as! BouncingLight

struct Interaction {
    var simulationSpeed: CGFloat {
        get {
            return scene.simSpeed
        }
        set (speed) {
            scene.simSpeed = speed
        }
    }
}
var simulation = Interaction()

simulation.simulationSpeed = 10

