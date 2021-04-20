/*:

 # Time Dilation
 
 In order to measure something like **Time Dilation**, wee need to keep track of time. To do this we'll use our trusty photons to make a light clock. We'll use our photons from the last page, and just keep track of the rate they bounce for a unit of time.
 
 To see what I mean, hit **"Run My Code"**
 
 ## On This Page
 
 Here we have two clocks, and two meters, but both of these meters control the same clock. Why? I wanted to show that that the velocity of the **photon** through **space** is the same as the velocity of the **clock** through **spacetime.**

 - Important:
     Wait what, spacetime? That's right, time is so important to relativity, that we **add another dimension** that represents time passed, or *proper time.*
 
 Notice how the clock's ticks become slower the faster it goes? That's time dilation: "faster objects experience less time"
 
 After that sinks in go to the [next page](@next)
 
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