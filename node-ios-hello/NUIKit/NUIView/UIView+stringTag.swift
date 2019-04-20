//
//  UIView+stringTag.swift
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import UIKit

private var stringTagHandle: UInt8 = 0

extension UIView {
  
  //use Objective C Associated Object API to add this property to UIView
  @IBInspectable @objc public var stringTag:String? {
    get {
      if let object = objc_getAssociatedObject(self, &stringTagHandle) as? String {
        return object
      }
      return nil
    }
    set {
      objc_setAssociatedObject(self, &stringTagHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  //this should work in a similar way to viewWithTag:
  @objc public func viewWithStringTag(strTag:String) -> UIView? {
    
    if stringTag == strTag {
      return self
    }
    
    for view in subviews {
      if let matchingSubview = view.viewWithStringTag(strTag: strTag) {
        return matchingSubview
      }
    }
    
    return nil
  }
}
