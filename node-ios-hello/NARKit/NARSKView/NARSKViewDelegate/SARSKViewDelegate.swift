//
//  SARSKViewDelegate.swift
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import SpriteKit
import ARKit

typealias NodeForAnchorClosure = (ARSKView, ARAnchor) -> SKNode?

@objc(SARSKViewDelegate)
class SARSKViewDelegate: NSObject, ARSKViewDelegate {
  @objc var nodeForAnchorCallback: NodeForAnchorClosure!
  
  @objc convenience init(nodeForAnchor: NodeForAnchorClosure!) {
    self.init()
    nodeForAnchorCallback = nodeForAnchor
  }
  
  func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
    return nodeForAnchorCallback(view, anchor)
  }
}
