//
//  SCoreGraphicsGlobals.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/23/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import CoreGraphics

@objc class SCoreGraphicsGlobals: NSObject {
  @objc static let shared = SCoreGraphicsGlobals()

  private override init() {
    super.init()
  }
  
  @objc func uiGraphicsGetCurrentContext() -> CGContext? {
    return UIGraphicsGetCurrentContext()
  }
  
  @objc func uiGraphicsBeginImageContextWithOptions(size: CGSize, opaque: Bool, scale: CGFloat) {
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
  }
  
  @objc func uiGraphicsGetImageFromCurrentImageContext() -> UIImage? {
    let img = UIGraphicsGetImageFromCurrentImageContext()
    return img
  }
  
  @objc func uiGraphicsEndImageContext() {
    UIGraphicsEndImageContext()
  }
}
