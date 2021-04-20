/*:

 # Special Relativity
 
 My favorite theory in physics, it describes the behaviour and effects of moving at hyperspeeds, such as future spaceships and light particles.
 
 ## Core Concepts
 
 Although special relativity has a broad range of phenomena, I'll be exploring the two most interesting
 - **Time Dilation**
 - **Length Contraction**
 
  - Important:
     While I hope I can explain everything through visuals, it is helpful to understand the following
     - **Speed of Light is a Constant:** Meaning light will always travel away at the same speed, even if you chase after it
     - **Velocity:** a value representing motion, in single or multiple dimensions. In this program all velocities will be at a constant speed (the speed of light), but change direction.
 
 Hit **"Run My Code"** if you haven't already.
 
 ## On This Page
 
 On this page (and the rest) we have slowed down the speed of light so you can watch photons move around. We also give you control of the *velocity* of the photon, which will attempt to bounce out of control.
 
  - Note:
     Make sure you drag your finger around the meter shown to the right to move the photon around. It won't stop for you though!
 
 I hope you enjoy! 
 
 Move on to the [next page](@next)
 
 */
//#-hidden-code
import PlaygroundSupport
import UIKit
let view = instantiateViewController(for: "bouncingLight")
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
// While the speed of light remains a constant, we can change the rate at which everything, including light, is simulated!
simulation.simulationSpeed = 20
//#-end-editable-code
