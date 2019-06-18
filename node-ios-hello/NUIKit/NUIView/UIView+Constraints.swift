/*
* Copyright (c) 2018, Applidium
* All rights reserved.
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of Applidium nor the names of its contributors may
*       be used to endorse or promote products derived from this software
*       without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE REGENTS AND CONTRIBUTORS BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
*/
//
//  UIView+Constraints.swift
//  OverlayContainer_Example
//
//  Created by Gaétan Zanella on 29/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

extension UIView {
    @objc func pinToSuperview(with insets: UIEdgeInsets = .zero, edges: UIRectEdge = .all) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        if edges.contains(.top) {
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        }
        if edges.contains(.bottom) {
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom).isActive = true
        }
        if edges.contains(.left) {
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left).isActive = true
        }
        if edges.contains(.right) {
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right).isActive = true
        }
    }
}
