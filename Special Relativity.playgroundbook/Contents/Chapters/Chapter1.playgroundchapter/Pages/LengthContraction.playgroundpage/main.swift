/*:
 I hope you've learned something about time dilation, but now it is *time* to look at length contraction.
 
 - Important: Hello there\
 Isn't this something!
 
 - Example: Why cool\
 isn't this neat?
 
 - Callout(bud)
 buddy

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