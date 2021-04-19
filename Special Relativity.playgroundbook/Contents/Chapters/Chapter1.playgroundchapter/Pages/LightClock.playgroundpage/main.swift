/*:
 In order to measure time dilation, we need to keep track of time. To do this we will use an special clock, a two mirror light clock. This keeps track of time by counting how many times the light beam bounces between the two mirrors.
 
 Go ahead and hit "Run My Code" to see what I mean. Don't forget to move the meter!
 
 In this page we use an almost identical setup, but we add in clocks to keep track of time. We keep the previous meter to track the photon's velocity, but we add in a second meter to track the clocks velocity through spacetime.
 
 Spacetime represents another dimension of our universe, not a spacial dimension, but a time dimension. We can observe that the faster the clock travels through space, the slower it travels through time. Thus, *the clock is always traveling through spacetime at the same speed.* The faster it travels through space, the slower it travels through time, just like how the faster light goes one way, the slower it goes in a different way.
 
 Please move on to the next page to review this idea.
 */
//#-hidden-code
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
//#-end-hidden-code
//#-editable-code
// You should know what this does!
simulation.simulationSpeed = 15
//#-end-editable-code