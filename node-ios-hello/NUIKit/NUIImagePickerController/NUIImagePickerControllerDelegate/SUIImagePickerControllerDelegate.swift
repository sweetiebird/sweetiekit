//
//  SUIimagePickerControllerDelegate.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias UIImagePickerOnInfoClosure = (UIImagePickerController, [UIImagePickerController.InfoKey : Any]) -> (Bool)

class UIImagePickerOnInfoClosureWrapper: NSObject {
    let closure: UIImagePickerOnInfoClosure
    init(_ closure: @escaping UIImagePickerOnInfoClosure) {
        self.closure = closure
    }
}

class SUIImagePickerControllerDelegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  private struct AssociatedKeys {
      static var onInfoClosure = "onInfoClosure"
  }

  @objc private var onInfoClosure: UIImagePickerOnInfoClosure? {
      get {
          guard let OnInfoClosureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.onInfoClosure) as? UIImagePickerOnInfoClosureWrapper else { return nil }
          return OnInfoClosureWrapper.closure
      }
      set(newValue) {
          guard let newValue = newValue else { return }
          objc_setAssociatedObject(self, &AssociatedKeys.onInfoClosure, UIImagePickerOnInfoClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      }
  }

  @objc func setOnInfoClosure(closure: @escaping UIImagePickerOnInfoClosure) {
      onInfoClosure = closure
  }

  @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let onInfoClosure = onInfoClosure {
      onInfoClosure(picker, info)
    }
  }
  
  @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
   
  }
}
