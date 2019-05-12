//
//  FirstViewController.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 4/9/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import UIKit
import SpriteKit

class FirstViewController: NodeUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

@objc
extension UIViewController {
    @objc func setRandomBackgroundColor() {
        let hue = CGFloat( arc4random() % 256) / 256.0;  //  0.0 to 1.0
        let saturation = CGFloat( arc4random() % 128) / 256.0 + 0.5;  //  0.5 to 1.0, away from white
        let brightness = CGFloat( arc4random() % 128) / 256.0 + 0.5;  //  0.5 to 1.0, away from black
        self.view.backgroundColor = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}
/*
extension FirstViewController: UITextFieldDelegate {

  private func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }

  private func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called")
    }

  private func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }

  private func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }

  private func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("TextField should snd editing method called")
        return true;
    }

  private func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }

  private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }

}
*/
