//
//  SUIKitGlobals.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/23/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias UIImageWriteToSavedPhotosAlbumClosure = (UIImage, NSError?, UnsafeMutableRawPointer?) -> Void 

@objc class SUITargetUIImageWriteToSavedPhotosAlbum: SUITargetBase {
  @objc var callbackClosure: UIImageWriteToSavedPhotosAlbumClosure?
  @objc var callbackSelector: Selector!
  
  override init() {
    super.init()
    callbackSelector = #selector(callback)
  }

  @objc func callback(image: UIImage, didFinishSavingWithError: NSError?, contextInfo: UnsafeMutableRawPointer?) {
    self.callbackClosure?(image, didFinishSavingWithError, contextInfo)
  }
}

@objc class SUIKitGlobals: NSObject {
 @objc static let shared = SUIKitGlobals()

  private override init() {
    super.init()
  }

  @objc static func uiImageWriteToSavedPhotosAlbum(image: UIImage, target: SUITargetUIImageWriteToSavedPhotosAlbum?, selector: Selector?, contextInfo: UnsafeMutableRawPointer?) {
    UIImageWriteToSavedPhotosAlbum(image, target, selector, contextInfo)
  }
}
