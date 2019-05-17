//
//  SSKScene.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/15/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import SpriteKit

typealias SSKScene_TouchesBegan = (Set<UITouch>, UIEvent?) -> Void
typealias SSKScene_TouchesMoved = (Set<UITouch>, UIEvent?) -> Void
typealias SSKScene_TouchesEnded = (Set<UITouch>, UIEvent?) -> Void

@objc class SSKScene: SKScene {
  var touchesBeganCallback: SSKScene_TouchesBegan?
  var touchesMovedCallback: SSKScene_TouchesMoved?
  var touchesEndedCallback: SSKScene_TouchesEnded?
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    touchesBeganCallback?(touches, event)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    touchesMovedCallback?(touches, event)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    touchesEndedCallback?(touches, event)
  }
}

@objc extension SSKScene {
  @objc func setTouchesBegan(_ closure: @escaping SSKScene_TouchesBegan) {
    touchesBeganCallback = closure
  }
  @objc func setTouchesMoved(_ closure: @escaping SSKScene_TouchesMoved) {
    touchesMovedCallback = closure
  }
  @objc func setTouchesEnded(_ closure: @escaping SSKScene_TouchesEnded) {
    touchesEndedCallback = closure
  }
}
