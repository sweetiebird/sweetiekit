//
//  SCoreGraphicsGlobals.swift
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
  
  @objc static func uiGraphicsGetCurrentContext() -> CGContext? {
    return UIGraphicsGetCurrentContext()
  }
  
  @objc static func uiGraphicsBeginImageContextWithOptions(size: CGSize, opaque: Bool, scale: CGFloat) {
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
  }
  
  @objc static func uiGraphicsGetImageFromCurrentImageContext() -> UIImage? {
    let img = UIGraphicsGetImageFromCurrentImageContext()
    return img
  }
  
  @objc static func uiGraphicsEndImageContext() {
    UIGraphicsEndImageContext()
  }
}
