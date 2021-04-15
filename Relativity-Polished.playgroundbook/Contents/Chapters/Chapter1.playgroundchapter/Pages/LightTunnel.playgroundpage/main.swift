/*:
 First we will explore the first major phenomena: *time dilation.* many people have heard of this idea, that as you approach the speed of light, time slows down for you, and this is correct, but you won't notice it, because our perception of how we move through time is governed by the rate we move through time. Instead, a stationary observer (someone who is not moving), will notice our clocks are ticking slower, and our bodies not aging as quickly. 
 
 Go ahead and "Run My Code"
 
 Here we introduce a second light particle, one that maintains its simple bouncing motion, and a second one that you can interact with.
 
 Instead of having our velocity meter bounce all around, I've adjusted the program to have the y-axis represent speed (motion without direction), and keep the x-axis on velocity (speed with direction). The particle will now also loop once it passes through the endpoints.
 
 Once again, both particles are traveling at the same speed, all the time, no matter what you are doing.
 
 After you've explored this page, please move on
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
simulation.simulationSpeed = 15
//#-end-editable-code
