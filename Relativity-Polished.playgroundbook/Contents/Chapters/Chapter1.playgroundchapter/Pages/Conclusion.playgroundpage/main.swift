import PlaygroundSupport
import CoreGraphics

let view = instantiateViewController(for: "conclusion")
PlaygroundPage.current.liveView = view
let scene = (view as! SimViewController).getScene() as! SimScene
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

simulation.simulationSpeed = 30