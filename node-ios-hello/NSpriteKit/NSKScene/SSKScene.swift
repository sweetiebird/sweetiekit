//
//  SSKScene.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/15/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import SpriteKit

typealias SSKScene_TouchesEnded = (Set<UITouch>, UIEvent?) -> Void

@objc class SSKScene: SKScene {
  var touchesEndedCallback: SSKScene_TouchesEnded?
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    touchesEndedCallback?(touches, event)
  }
}

@objc extension SSKScene {
  @objc func setTouchesEnded(_ closure: @escaping SSKScene_TouchesEnded) {
    touchesEndedCallback = closure
  }
}
