/*:
 One question that often gets asked is, "Why can't anything go faster than the speed of light?" I'd like to focus on one specific answer to this, its because all particles are always travelling at the speed of light through spacetime. This means that just like the meters we've been using to track velocity suggest, the faster you move through space, the slower you move through time, because they are both linked, and as mentioned before, not a constant.
 
 In this page I'll just quickly demonstrate that all clocks, be it biological, mechanical, light, or atomic clocks, they all slow down when they speed up.
 
 Go ahead and hit "Run My Code."
 
 In this page I simply place a clock on a rocket and watch as time dilation occurs as space speed changes.
 
 The rocket is the original work of me, but credit goes to !(turkkub)[https://www.flaticon.com/authors/turkkub] from !(flaticon.com)[https://www.flaticon.com] for the wonderful earth image.
 */

//#-hidden-code
import PlaygroundSupport
import CoreGraphics

let view = instantiateViewController(for: "rocketClock")
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
//#-end-hidden-code
//#-editable-code
// Rocket go VRROOMM
simulation.simulationSpeed = 30
//#-end-editable-code
