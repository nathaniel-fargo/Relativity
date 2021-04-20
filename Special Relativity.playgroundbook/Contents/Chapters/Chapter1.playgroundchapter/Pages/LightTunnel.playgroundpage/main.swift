/*:
 # Time Dilation
 
 The first, and more well know, phenomena we shall explore today. To start with, just imagine two photons, bouncing around, always at the same speed
 
 Now stop imagining and just **"Run My Code"** to see what I mean
 
 ## On this Page

 Now our velocity meter only has control over one photon, the other photon will remain a *reference point.* This meter won't bounce around like the last one did, to simplify the experiment
 
 - Note:
     Drag your finger around the blue meter to change the lower photon's *velocity*

 Play around with our friendly two photons, and remember that they always travel at identical speeds
 
 [Move on](@next)
 
 */
//#-hidden-code
import PlaygroundSupport
import UIKit

// Create View
let view = instantiateViewController(for: "lightTunnel")
// Set View
PlaygroundPage.current.liveView = view
// Get Scene
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
//#-end-hidden-code
//#-editable-code
// Feel free to speed things up, or slow them down
simulation.simulationSpeed = 10
//#-end-editable-code
