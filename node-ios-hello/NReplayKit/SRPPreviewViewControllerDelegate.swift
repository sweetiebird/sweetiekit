//
//  SRPPreviewViewControllerDelegate.swift
//
//  Created by Emily Kolar on 5/26/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import ReplayKit

typealias SRPPreviewCtrlDel_DidFinish = (RPPreviewViewController) -> Void

@objc class SRPPreviewViewControllerDelegate: NSObject, RPPreviewViewControllerDelegate {
  var didFinishCallback: SRPPreviewCtrlDel_DidFinish?
}

@objc extension SRPPreviewViewControllerDelegate {
  @objc func setDidFinish(_ closure: @escaping SRPPreviewCtrlDel_DidFinish) {
    didFinishCallback = closure
  }
}
