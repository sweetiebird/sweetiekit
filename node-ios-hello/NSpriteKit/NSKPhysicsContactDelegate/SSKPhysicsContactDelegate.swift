//
//  SSKPhysicsContactDelegate.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/15/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import SpriteKit

typealias SSKPhysicsContactDelegate_DidBegin = (SKPhysicsContact) -> Void

@objc class SSKPhysicsContactDelegate: NSObject, SKPhysicsContactDelegate {
  var didBeginCallback: SSKPhysicsContactDelegate_DidBegin?

  func didBegin(_ contact: SKPhysicsContact) {
    didBeginCallback?(contact)
  }
}

@objc extension SSKPhysicsContactDelegate {
  func setDidBegin(_ closure: @escaping SSKPhysicsContactDelegate_DidBegin) {
    didBeginCallback = closure
  }
}
