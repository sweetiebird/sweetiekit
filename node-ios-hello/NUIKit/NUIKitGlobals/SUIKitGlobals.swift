//
//  SUIKitGlobals.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/23/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

@objc class SUIKitGlobals: NSObject {
 @objc static let shared = SUIKitGlobals()

  private override init() {
    super.init()
  }

  @objc static func uiImageWriteToSavedPhotosAlbum(image: UIImage, target: SUITarget?, selector: Selector?, contextInfo: UnsafeMutableRawPointer?) {
    UIImageWriteToSavedPhotosAlbum(image, target, selector, contextInfo)
  }
}
