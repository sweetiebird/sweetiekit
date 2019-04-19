//
//  UIViewController+TextFieldDelegate.swift
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  private struct AssociatedKeys {
      static var targetClosure = "targetClosure"
  }

  @objc private var targetClosure: UITextFieldTargetClosure? {
      get {
          guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? UITextFieldClosureWrapper else { return nil }
          return closureWrapper.closure
      }
      set(newValue) {
          guard let newValue = newValue else { return }
          objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, UITextFieldClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      }
  }

  @objc func addTargetClosure(closure: @escaping UITextFieldTargetClosure) {
      targetClosure = closure
  }
  @objc func closureAction(_ field: UITextField) {
      guard let targetClosure = targetClosure else { return }
      targetClosure(field)
  }
}

class NodeUIViewController: UIViewController, UITextFieldDelegate {
  
  override func viewDidLoad() {
      super.viewDidLoad()
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }

  func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called")
        textField.closureAction();
        //self.closureAction(textField);
    }

  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }

  func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }

  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("TextField should snd editing method called")
        return true;
    }

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }


}
