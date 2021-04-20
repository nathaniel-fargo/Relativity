import UIKit

public let c: CGFloat = 1

let screenBounds = UIScreen.main.bounds
//  let screenBounds = UIScreen.main.nativeBounds
public let superBounds = CGRect(x: 0, y: 0, width: max(screenBounds.height, screenBounds.width) / 2, height: min(screenBounds.height, screenBounds.width))

public let graphWidth: CGFloat = superBounds.width > superBounds.height ? superBounds.width / 3 : superBounds.width / 2

public let meterRadius: CGFloat = graphWidth / 2.5

public let rotationTime: TimeInterval = 0.1

public let rotationFactor: CGFloat = 1.5508559501606356 / .pi * 2

public let defaultMirrorHeight: CGFloat = 15
