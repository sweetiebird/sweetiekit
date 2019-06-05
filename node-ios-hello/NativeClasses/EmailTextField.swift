//
//  EmailTextField.swift
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import UIKit

class EmailTextField: UITextField {
  // best way for creating instances programatically (not an official thing at all though)
  // the ideal would be the ability to define this is JS somehow
  class func instanceFromNib(frame: CGRect) -> EmailTextField {
    let me = UINib(nibName: "EmailTextField", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! EmailTextField
    me.stringTag = "txtEmail"
    me.layer.cornerRadius = 6
    me.layer.borderColor = UIColor(red: 111/255, green: 174/255, blue: 175/255, alpha: 1).cgColor
    me.layer.borderWidth = 1

    // need this line to use interface builder constraints with programmatically created views
    me.translatesAutoresizingMaskIntoConstraints = false

    return me
  }
  
  // most common way to alter xib views on create (official)
  override func awakeFromNib() {
    layer.cornerRadius = 6
    layer.borderColor = UIColor(red: 111/255, green: 174/255, blue: 175/255, alpha: 1).cgColor
    layer.borderWidth = 1
  }
}
