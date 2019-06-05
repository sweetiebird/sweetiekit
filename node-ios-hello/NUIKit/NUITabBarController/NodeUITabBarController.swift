//
//  NodeUITabBarController.swift
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

class NodeUITabBarController: UITabBarController, UITextFieldDelegate {

  override func viewDidLoad() {
      super.viewDidLoad()
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }

  func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called")
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
