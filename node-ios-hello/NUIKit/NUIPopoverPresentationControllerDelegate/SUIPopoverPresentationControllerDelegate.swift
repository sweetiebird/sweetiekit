//
//  SUIPopoverPresentationControllerDelegate.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/23/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias SUIPopover_AdaptivePresStyle = (UIPresentationController) -> UIModalPresentationStyle

class SUIPopoverPresentationControllerDelegate: NSObject, UIPopoverPresentationControllerDelegate {
  var adaptivePresentationStyleCallback: SUIPopover_AdaptivePresStyle?

  @objc func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
    if let adaptivePresentationStyleCallback = adaptivePresentationStyleCallback {
      return adaptivePresentationStyleCallback(controller)
    }
    return UIModalPresentationStyle.none
  }
}

@objc extension SUIPopoverPresentationControllerDelegate {
  @objc func setAdaptivePresentationStyle(_ closure: @escaping SUIPopover_AdaptivePresStyle) {
    adaptivePresentationStyleCallback = closure
  }
}
