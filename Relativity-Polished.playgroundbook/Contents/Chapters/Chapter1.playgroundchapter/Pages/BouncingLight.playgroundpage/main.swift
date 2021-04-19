/*:

 # Special Relativity
 
 A theory developed primarily by Einstien often mentioned, and its effects known, but few people really understand why these things work.
 
 In this playground I'm not going to explain special relativity from a college course perspective, instead I will attempt to give you an intuitive understanding of the phenomena special relativity presents: *time dilation* and *length contraction*
 
 Special Relativity is built around the postulate that *the speed of light will always been measured the same,* (in a vaccum) regardless of whether you are on a planet travelling at thousands of miles per hour, or floating around space it is a universal constant. This means that terms like time, space, and energy are not actually constants, and instead bend to their speed.
 
 Hit "Run Code" if you haven't already.
 
 To start off with this page will show you a light particle, signifcantly slowed down so we can observe it. This particle will *always maintain the same speed,* though its direction will change. Feel free to drag your finger around that vector and move the light particle around.
 
 Once you are satisfied with this idea, please move on to the next page.
 
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
// While the speed of light remains a constant, we can change the rate at which everything, including light, is simulated!
simulation.simulationSpeed = 20
//#-end-editable-code
