//
//  SUIViewControllerTransitioningDelegate.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias PresentationControllerForClosure = (UIViewController, UIViewController?, UIViewController) -> SUIPresentationController?

@objc (SUIViewControllerTransitioningDelegate)
class SUIViewControllerTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
  var presentationControllerForCallback: PresentationControllerForClosure?

  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    return presentationControllerForCallback?(presented, presenting, source)
  }
}


@objc extension SUIViewControllerTransitioningDelegate {
  @objc func setPresentationControllerForCallback(_ closure: PresentationControllerForClosure?) {
    presentationControllerForCallback = closure
  }
}
