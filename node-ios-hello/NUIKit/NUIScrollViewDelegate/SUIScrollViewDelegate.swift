//
//  SUIScrollViewDelegate.swift
//
//  Created by Emily Kolar on 5/16/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias SUIScrollViewDelegate_CommonDidClosure = (UIScrollView) -> Void
typealias SUIScrollViewDelegate_CommonShouldClosure = (UIScrollView) -> Bool
typealias SUIScrollViewDelegate_DidEndDraggingClosure = (UIScrollView, Bool) -> Void

@objc class SUIScrollViewDelegate: NSObject, UIScrollViewDelegate {
  var didScrollCallback: SUIScrollViewDelegate_CommonDidClosure?
  var shouldScrollToTopCallback: SUIScrollViewDelegate_CommonShouldClosure?
  var didScrollToTopCallback: SUIScrollViewDelegate_CommonDidClosure?
  var willBeginDeceleratingCallback: SUIScrollViewDelegate_CommonDidClosure?
  var didEndDeceleratingCallback: SUIScrollViewDelegate_CommonDidClosure?
  var didEndDraggingCallback: SUIScrollViewDelegate_DidEndDraggingClosure?

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    didScrollCallback?(scrollView)
  }

  func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
    if let shouldScrollToTopCallback = shouldScrollToTopCallback {
      return shouldScrollToTopCallback(scrollView)
    }
    return true
  }
  
  func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
    didScrollCallback?(scrollView)
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    didEndDeceleratingCallback?(scrollView)
  }
  
  func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
    willBeginDeceleratingCallback?(scrollView)
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    didEndDraggingCallback?(scrollView, decelerate)
  }
}

@objc extension SUIScrollViewDelegate {
  func setDidScroll(_ closure: @escaping SUIScrollViewDelegate_CommonDidClosure) {
    didScrollCallback = closure
  }
  
  func setShouldScrollToTop(_ closure: @escaping SUIScrollViewDelegate_CommonShouldClosure) {
    shouldScrollToTopCallback = closure
  }
  
  func setDidScrollToTop(_ closure: @escaping SUIScrollViewDelegate_CommonDidClosure) {
    didScrollToTopCallback = closure
  }
  
  func setWillBeginDecelerating(_ closure: @escaping SUIScrollViewDelegate_CommonDidClosure) {
    willBeginDeceleratingCallback = closure
  }

  func setDidEndDecelerating(_ closure: @escaping SUIScrollViewDelegate_CommonDidClosure) {
    didEndDeceleratingCallback = closure
  }
  
  func setDidEndDragging(_ closure: @escaping SUIScrollViewDelegate_DidEndDraggingClosure) {
    didEndDraggingCallback = closure
  }
}
