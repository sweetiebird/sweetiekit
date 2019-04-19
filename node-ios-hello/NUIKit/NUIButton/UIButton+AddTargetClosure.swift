//
//  UIButton+AddTargetClosure.swift
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import UIKit

typealias UIButtonTargetClosure = (UIButton) -> ()

class ClosureWrapper: NSObject {
    let closure: UIButtonTargetClosure
    init(_ closure: @escaping UIButtonTargetClosure) {
        self.closure = closure
    }
}

extension UIButton {
  
    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }
  
    @objc private var targetClosure: UIButtonTargetClosure? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? ClosureWrapper else { return nil }
            return closureWrapper.closure
        }
        set(newValue) {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, ClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
  
    @objc func addTargetClosure(closure: @escaping UIButtonTargetClosure, forEvent: UIControl.Event) {
        targetClosure = closure
        addTarget(self, action: #selector(UIButton.closureAction), for:forEvent)
    }
  
    @objc func addTargetClosure(closure: @escaping UIButtonTargetClosure) {
        return addTargetClosure(closure: closure, forEvent: .touchUpInside)
    }
    @objc func closureAction() {
        guard let targetClosure = targetClosure else { return }
        targetClosure(self)
    }
}
