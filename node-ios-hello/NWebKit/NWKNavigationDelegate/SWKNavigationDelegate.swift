//
//  SWKNavigationDelegate.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 6/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import WebKit

typealias SWKNavigationDelegate_DidFinishNav = (WKWebView, WKNavigation) -> Void

class SWKNavigationDelegate: NSObject, WKNavigationDelegate {
  var didFinishNavCallback: SWKNavigationDelegate_DidFinishNav?
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print(webView.url)
    didFinishNavCallback?(webView, navigation)
  }
}

extension SWKNavigationDelegate {
  @objc func setDidFinishNavigation(_ closure: @escaping SWKNavigationDelegate_DidFinishNav) {
    didFinishNavCallback = closure
  }
}
