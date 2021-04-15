/*:

 # Special Relativity
 
 A theory developed primarily by Einstien often mentioned, and its effects known, but few people really understand why these things work.
 
 In this playground I'm not going to explain special relativity from a college course perspective, instead I will attempt to give you an intuitive instead of superficial understanding of the phenomena special relativity presents: time dilation and length contraction
 
 ** add to final page
 Building up to this project, using the internet I tauht myself the principles of special relativity, and if you enjoy this project and are interested in physics, I encourage you to do the same.
 
 */
//#-hidden-code
import PlaygroundSupport
import UIKit
let view = instantiateViewController(for: "bouncingLight")
PlaygroundPage.current.liveView = view
let scene = (view as! SimViewController).getScene() as! SimSpeed
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
simulation.simulationSpeed = 15
//#-end-editable-code
