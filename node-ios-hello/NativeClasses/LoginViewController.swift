//
//  LoginViewController.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var container: UIView!
  weak var emailField: EmailTextField!
  weak var passwordField: PasswordTextField!
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
      // using instance from nib
      emailField = EmailTextField.instanceFromNib(frame: CGRect(x: 8, y: 32, width: container.frame.size.width - 16, height: 40))
      passwordField = PasswordTextField.instanceFromNib(frame: CGRect(x: 8, y: 32, width: container.frame.size.width - 16, height: 40))

      emailField.delegate = self
      passwordField.delegate = self

      container.addSubview(emailField)
      container.addSubview(passwordField)

      // constraint definition MUST follow addSubview call,
      // or enjoy view hierarchy errors (this is the dev's responsibility)
      setFieldConstraints(emailField, frameY: 32)
      setFieldConstraints(passwordField, frameY: 112)

      setTapToDismissKeyboard()
  }

  func setFieldConstraints(_ field: UITextField, frameY y: CGFloat) {
    // constraint definition MUST follow addSubview call,
    // or enjoy view hierarchy errors (this is the dev's responsibility)
    field.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8).isActive = true
    field.topAnchor.constraint(equalTo: container.topAnchor, constant: y).isActive = true
    field.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8).isActive = true
    field.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
  
  func setTapToDismissKeyboard() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleViewTap))
    view.addGestureRecognizer(tap)
  }
  
  @objc func handleViewTap() {
    view.endEditing(true)
  }
}
