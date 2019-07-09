//
//  SARSCNViewDelegate.swift
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import SceneKit
#if !targetEnvironment(UIKitForMac)
import ARKit

typealias SARSCNViewDelegate_NodeForAnchorClosure = (SCNSceneRenderer, ARAnchor) -> SCNNode?

@objc(SARSCNViewDelegate)
class SARSCNViewDelegate: NSObject, ARSCNViewDelegate {
  @objc var nodeForAnchorCallback: SARSCNViewDelegate_NodeForAnchorClosure!
  
  @objc convenience init(nodeForAnchor: SARSCNViewDelegate_NodeForAnchorClosure!) {
    self.init()
    nodeForAnchorCallback = nodeForAnchor
  }

  func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
    var node: SCNNode?
    DispatchQueue.main.sync {
      node = nodeForAnchorCallback(renderer, anchor)
    }
    return node;
  }
}
#endif
