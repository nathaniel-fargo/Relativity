import PlaygroundSupport
import CoreGraphics

// Create View
let view = instantiateViewController(for: "lightClock")
// Set View
PlaygroundPage.current.liveView = view
// Get Scene
let scene = (view as! SimViewController).getScene() as! LightClockScene

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

simulation.simulationSpeed = 15

