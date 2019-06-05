//
//  SSKPhysicsContactDelegate.swift
//
//  Created by Emily Kolar on 5/15/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import SpriteKit

typealias SSKPhysicsContactDelegate_Contact = (SKPhysicsContact) -> Void

@objc class SSKPhysicsContactDelegate: NSObject, SKPhysicsContactDelegate {
  var didBeginCallback: SSKPhysicsContactDelegate_Contact?
  var didEndCallback: SSKPhysicsContactDelegate_Contact?

  func didBegin(_ contact: SKPhysicsContact) {
    didBeginCallback?(contact)
  }
  
  func didEnd(_ contact: SKPhysicsContact) {
    didEndCallback?(contact)
  }
}

@objc extension SSKPhysicsContactDelegate {
  func setDidBegin(_ closure: @escaping SSKPhysicsContactDelegate_Contact) {
    didBeginCallback = closure
  }
  
  func setDidEnd(_ closure: @escaping SSKPhysicsContactDelegate_Contact) {
    didEndCallback = closure
  }
}
