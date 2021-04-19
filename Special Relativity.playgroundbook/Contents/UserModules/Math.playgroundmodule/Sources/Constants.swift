import UIKit

public let c: CGFloat = 1

let nativeBounds = UIScreen.main.nativeBounds
let mainBounds = UIScreen.main.bounds
public let superBounds = CGRect(x: 0, y: 0, width: nativeBounds.height / 2, height: nativeBounds.width)

public let graphWidth: CGFloat = superBounds.width > superBounds.height ? superBounds.width / 3 : superBounds.width / 2

public let meterRadius: CGFloat = graphWidth / 2.5

public let rotationTime: TimeInterval = 0.1

public let rotationFactor: CGFloat = 1.5508559501606356 / .pi * 2

public let defaultMirrorHeight: CGFloat = 30
