//
//  SUIimagePickerControllerDelegate.swift
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias UIImagePickerOnInfoClosure = (UIImagePickerController, [UIImagePickerController.InfoKey : Any]) -> (Bool)
typealias UIImagePickerOnCancelClosure = (UIImagePickerController) -> (Bool)

class UIImagePickerOnInfoClosureWrapper: NSObject {
    let closure: UIImagePickerOnInfoClosure
    var info: [UIImagePickerController.InfoKey : Any]?
    var image: UIImage?
    init(_ closure: @escaping UIImagePickerOnInfoClosure) {
        self.closure = closure
        self.info = nil
        self.image = nil
    }
}

class UIImagePickerOnCancelClosureWrapper: NSObject {
    let closure: UIImagePickerOnCancelClosure
    init(_ closure: @escaping UIImagePickerOnCancelClosure) {
        self.closure = closure
    }
}

class SUIImagePickerControllerDelegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  private struct AssociatedKeys {
      static var onInfoClosure = "onInfoClosure"
      static var onCancelClosure = "onCancelClosure"
  }

  @objc private var onInfoResult: UIImage? {
      get {
          guard let OnInfoClosureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.onInfoClosure) as? UIImagePickerOnInfoClosureWrapper else { return nil }
          return OnInfoClosureWrapper.image
      }
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

  @objc private var onCancelClosure: UIImagePickerOnCancelClosure? {
      get {
          guard let OnCancelClosureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.onCancelClosure) as? UIImagePickerOnCancelClosureWrapper else { return nil }
          return OnCancelClosureWrapper.closure
      }
      set(newValue) {
          guard let newValue = newValue else { return }
          objc_setAssociatedObject(self, &AssociatedKeys.onCancelClosure, UIImagePickerOnCancelClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      }
  }


  @objc func infoResult() -> UIImage? {
      return onInfoResult
  }
  
  @objc func setOnInfoClosure(closure: @escaping UIImagePickerOnInfoClosure) {
      onInfoClosure = closure
  }

  @objc func setOnCancelClosure(closure: @escaping UIImagePickerOnCancelClosure) {
      onCancelClosure = closure
  }

  @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
  
    if let onInfoClosure = onInfoClosure {
      guard let OnInfoClosureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.onInfoClosure) as? UIImagePickerOnInfoClosureWrapper else { return }
      OnInfoClosureWrapper.image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
      onInfoClosure(picker, info)
    }
    picker.dismiss(animated: true, completion: nil)
  }

  @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    if let onCancelClosure = onCancelClosure {
      onCancelClosure(picker)
    }
    picker.dismiss(animated: true, completion: nil)
  }
}
