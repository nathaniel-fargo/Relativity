/*:
 
 Thanks so much for checking out my playground, these concepts can be hard to understand, and without sitting through various college lectures working out the math, it can be hard to get a solid understanding.
 
 To put it all together I've created one final scene where we can view both the effects of time dilation and length contraction, hope you enjoy!
 
 For the last time, please hit "Run My Code"
 
 One final thing to consider is that the speeds we are playing with are, quite literally, astronomical, and are pretty much uncomparable to anything we, or even NASA, deals with. This is why we never observe speeding cars shrinking down, or astraunauts living "longer," so these effects appear applified because we've slowed down the speed of light, which is the basis of the scale of these effects.
 
 Extra info:
 I spent countless hours learning about the concepts, and many more phenomena such as simultanity, simultunatity gaps, non-euclidian geometry, spacetime paradoxes, and much more. I had a hard time choosing which ideas to highlight, and in the end I just chose the most visual and well known aspects. I had to skip over quite a few fundamentals for the sake of time, even some of the key components such as inertial reference frames and simultunaity, 
 
 Once again thanks so much for being here, your time means a lot to me. If you enjoy this kind of physics, please please please check out some videos, read some articles, and listen to lectures on it, I for one know my mind has been blown over and over again researching this topic.
 
 
 
 */
//#-hidden-code
import PlaygroundSupport
import CoreGraphics

let view = instantiateViewController(for: "conclusion")
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
// VVVRRRROOOOOMMMMM
simulation.simulationSpeed = 30
//#-end-editable-code