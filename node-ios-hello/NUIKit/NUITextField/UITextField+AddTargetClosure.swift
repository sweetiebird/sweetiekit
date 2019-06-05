//
//  UITextField+AddTargetClosure.swift
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import UIKit

typealias UITextFieldTargetClosure = (UITextField) -> (Bool)

class UITextFieldClosureWrapper: NSObject {
    let closure: UITextFieldTargetClosure
    init(_ closure: @escaping UITextFieldTargetClosure) {
        self.closure = closure
    }
}

extension UITextField {
  
    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }
  
    @objc private var targetClosure: UITextFieldTargetClosure? {
        get {
            guard let UITextFieldClosureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? UITextFieldClosureWrapper else { return nil }
            return UITextFieldClosureWrapper.closure
        }
        set(newValue) {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, UITextFieldClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
  
    @objc func setTargetClosure(closure: @escaping UITextFieldTargetClosure) {
        targetClosure = closure
    }
  /*
    @objc func addTargetClosure(closure: @escaping UITextFieldTargetClosure, forEvent: UIControl.Event) {
        targetClosure = closure
        addTarget(self, action: #selector(UITextField.closureAction), for:forEvent)
    }
  
    @objc func addTargetClosure(closure: @escaping UITextFieldTargetClosure) {
        return addTargetClosure(closure: closure, forEvent: .touchUpInside)
    }*/
    @objc func closureAction() {
        guard let targetClosure = targetClosure else { return }
        targetClosure(self)
    }
}
