import PlaygroundSupport
import UIKit

// Create View
let view = instantiateViewController(for: "lightTunnel")
// Set View
PlaygroundPage.current.liveView = view
// Get Scene
let scene = (view as! SimViewController).getScene() as! SimScene

scene.simSpeed = 15
