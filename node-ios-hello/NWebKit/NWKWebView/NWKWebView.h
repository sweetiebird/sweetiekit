//
//  NWKWebView.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NWKWebView_h
#define NWKWebView_h    

#include "NUIView.h"

#define js_value_WKWebView(x) js_value_wrapper(x, WKWebView)
#define to_value_WKWebView(x) to_value_wrapper(x, WKWebView)
#define is_value_WKWebView(x) is_value_wrapper(x, WKWebView)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(WKWebView, UIView);
  JS_STATIC_METHOD(handlesURLScheme);
  JS_METHOD(initWithFrameConfiguration);
  JS_METHOD(initWithCoder);
  JS_METHOD(loadRequest);
  JS_METHOD(loadFileURLAllowingReadAccessToURL);
  JS_METHOD(loadHTMLStringBaseURL);
  JS_METHOD(loadData_MIMETypeCharacterEncodingNameBaseURL);
  JS_METHOD(goToBackForwardListItem);
  JS_METHOD(goBack);
  JS_METHOD(goForward);
  JS_METHOD(reload);
  JS_METHOD(reloadFromOrigin);
  JS_METHOD(stopLoading);
  JS_METHOD(evaluateJavaScriptCompletionHandler);
  JS_METHOD(takeSnapshotWithConfigurationCompletionHandler);
#if !TARGET_OS_IPHONE
  JS_METHOD(setMagnificationCenteredAtPoint);
#endif
  JS_PROP_READONLY(configuration);
  JS_PROP(navigationDelegate);
  JS_PROP(UIDelegate);
  JS_PROP_READONLY(backForwardList);
  JS_PROP_READONLY(title);
  JS_PROP_READONLY(URL);
  JS_PROP_READONLY(isLoading);
  JS_PROP_READONLY(estimatedProgress);
  JS_PROP_READONLY(hasOnlySecureContent);
  JS_PROP_READONLY(serverTrust);
  JS_PROP_READONLY(canGoBack);
  JS_PROP_READONLY(canGoForward);
  JS_PROP(allowsBackForwardNavigationGestures);
  JS_PROP(customUserAgent);
  JS_PROP(allowsLinkPreview);
  JS_PROP_READONLY(scrollView);
  JS_PROP(allowsMagnification);
  JS_PROP(magnification);
  JS_PROP_READONLY(certificateChain);

JS_WRAP_CLASS_END(WKWebView);

#endif /* NWKWebView_h */
