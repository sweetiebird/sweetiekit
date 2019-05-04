//
//  SUIPresentationController.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias FrameOfPresentedViewClosure = () -> CGRect
typealias TransitioningClosure = () -> Void
typealias SizeClosure = (UIContentContainer, CGSize) -> CGSize

@objc(SUIPresentationController)
class SUIPresentationController: UIPresentationController {
  var frameOfPresentedViewCallback: FrameOfPresentedViewClosure?
  var presentationTransitionWillBeginCallback: TransitioningClosure?
  var dismissalransitionWillBeginCallback: TransitioningClosure?
  var containerWillLayoutSubviewsCallback: TransitioningClosure?
  var sizeForChildContentContainerCallback: SizeClosure?

  override var frameOfPresentedViewInContainerView: CGRect {
    if let frameOfPresentedViewCallback = frameOfPresentedViewCallback {
      return frameOfPresentedViewCallback()
    }
    if let presentedView = presentedView {
      return presentedView.frame
    }
    return CGRect.zero
  }

  override func presentationTransitionWillBegin() {
    if let presentationTransitionWillBeginCallback = presentationTransitionWillBeginCallback {
      presentationTransitionWillBeginCallback()
    }
  }
  
  override func dismissalTransitionWillBegin() {
    if let dismissalransitionWillBeginCallback = dismissalransitionWillBeginCallback {
      dismissalransitionWillBeginCallback()
    }
  }
  
  override func containerViewWillLayoutSubviews() {
    if let containerWillLayoutSubviewsCallback = containerWillLayoutSubviewsCallback {
      containerWillLayoutSubviewsCallback()
    }
  }

  override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
    if let sizeForChildContentContainerCallback = sizeForChildContentContainerCallback {
      return sizeForChildContentContainerCallback(container, parentSize)
    }
    return container.preferredContentSize
  }
}

@objc extension SUIPresentationController {
  func setFrameOfPresentedViewCallback(_ closure: @escaping FrameOfPresentedViewClosure) {
    frameOfPresentedViewCallback = closure
  }
  
  func setPresentationTransitionWillBeginCallback(_ closure: @escaping TransitioningClosure) {
    presentationTransitionWillBeginCallback = closure
  }
  
  func setDismissalTransitionWillBeginCallback(_ closure: @escaping TransitioningClosure) {
    dismissalransitionWillBeginCallback = closure
  }
  
  func setContainerWillLayoutSubviewsCallback(_ closure: @escaping TransitioningClosure) {
    containerWillLayoutSubviewsCallback = closure
  }
  
  func setSizeForChildContentContainerCallback(_ closure: @escaping SizeClosure) {
    sizeForChildContentContainerCallback = closure
  }
}
