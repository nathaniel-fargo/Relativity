/*:
 # Length Contraction
 
 After time dilation we move on to length contraction. Remember that extra dimension **spacetime?** We can't ever see it, but it does impact how we see our world. In fact the shadow the higher dimensional version casts is what we see and measure.
 
 Objects also rotate perpendicular to their velocity through **spacetime,** which warps their shadow cast onto spacial dimensions. As you increase the velocity through space, this shadow warps more and more, squishing into nothigness as it approaches the speed of light. This is length contraction.
 
 ## On this Page
 **Wait!** don't "Run My Code" quite yet. On this page I will extend our meter to a *third dimension,* (two space dimensions, one time dimension). This way it will cast a two dimensional shadow which represents what can be seen and measured.
 
 Now **"Run My Code"** and come back here if you get confused
 
 Or go on to the [next page](@next)

*/
//#-hidden-code
import PlaygroundSupport
import CoreGraphics
let view = instantiateViewController(for: "lengthContraction")
PlaygroundPage.current.wantsFullScreenLiveView = true
PlaygroundPage.current.liveView = view
let scene = (view as! LCViewController).getScene()
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
PlaygroundPage.current.assessmentStatus = .pass(message: "Feel free to interact with this scene to see what I mean, if you want, [click here](Length%20Contraction) to go back to explanations")
//#-end-hidden-code
//#-editable-code
simulation.simulationSpeed = 15
//#-end-editable-code