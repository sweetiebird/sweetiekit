//
//  SUITarget.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation

typealias TargetClosure = (Any?) -> Void
typealias DeinitClosure = () -> Void

@objc class SUITarget: NSObject {
  @objc var callbackClosure: TargetClosure?
  @objc var deinitClosure: DeinitClosure?
  @objc var callbackSelector = #selector(callback)

  @objc func callback(_ sender: Any?) {
    self.callbackClosure?(sender)
  }
  
  deinit {
    print("deinit")
    self.deinitClosure?()
  }
}
