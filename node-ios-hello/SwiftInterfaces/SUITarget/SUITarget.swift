//
//  SUITarget.swift
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation

typealias DeinitClosure = () -> Void
typealias TargetClosure = (Any?) -> Void

@objc class SUITargetBase: NSObject {
  @objc var deinitClosure: DeinitClosure?
  
  deinit {
    print("deinit")
    self.deinitClosure?()
  }
}
@objc class SUITarget: SUITargetBase {
  @objc var callbackClosure: TargetClosure?
  @objc var callbackSelector: Selector!
  
  override init() {
    super.init()
    callbackSelector = #selector(callback)
  }

  @objc func callback(_ sender: Any?) {
    self.callbackClosure?(sender)
  }
}
