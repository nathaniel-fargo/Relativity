/*:
 
 # Putting it Together
 Now I've created one final (2D) scene where we can observe both time dilation and length contraction. Remember neither of these have much of an impact **unless** objects are traveling at a significant portion of the speed of light.
 
 For the last page, **"Run My Code"**
 
 - Callout(Review):
     Let's review the two phenomena we've looked over
     1. **Time Dilation:** when objects go super fast, they experience less time than a stationary object
     2. **Length Contraction:** when objects go fast, they are measured to be shrunk down
     Nether of these effects are observed by the object, e.g. the object will think time is normal and will not see itself squish down.
 
 ## Conclusion
 Thanks for making it all the way here! It means a lot that you are checking out something I spent so much time working on. Feel free to read more below, but it certainly isn't necessary.
 
 -----
 
 ## Extra Information:
 I spent countless hours learning about these concepts, and many more phenomena such as simultanity, simultunatity gaps, non-euclidian geometry, spacetime paradoxes, and much more. I had a hard time choosing which ideas to highlight, and in the end I just chose the most visual and well known aspects. I had to skip over quite a few fundamentals for the sake of time, even some of the key components such as inertial reference frames and simultunaity, 
 
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