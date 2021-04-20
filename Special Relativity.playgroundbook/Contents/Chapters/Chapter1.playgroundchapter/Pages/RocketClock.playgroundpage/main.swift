/*:
 # Time Dilation
 I'll keep it short in this page, but turns out objects, just like light, have a constant velocity through our universe, as defined by the speed of light. Light generally travels primarily through space, while planets and ordinary objects travel quickly through time.
 
 You guessed it, run **"Run My Code"**
 
 ## On This Page
 We have replaced our *light clocks* with normal clocks, and put one on a rocket, where we can observe the very same effects! Just like the last page, I also add a descriptive tag to give you some reference of the speeds we are dealing with here
 
 - Callout(Credits):
     The rocket is the original work of me, but credit goes to [turkkub](https://www.flaticon.com/authors/turkkub) from [flaticon.com](https://www.flaticon.com) for the wonderful earth image.
  
  Move on to the [next page](@next)
  
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
simulation.simulationSpeed = 15
//#-end-editable-code
