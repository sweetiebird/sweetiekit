//
//  NWKNavigationDelegate.h
//
//  Created by Emily Kolar on 2019-6-7.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NWKNavigationDelegate_h
#define NWKNavigationDelegate_h    

#include "NNSObject.h"

#define js_value_WKNavigationDelegate(x) js_value_wrapper(x, WKNavigationDelegate)
#define to_value_WKNavigationDelegate(x) to_value_wrapper(x, WKNavigationDelegate)
#define is_value_WKNavigationDelegate(x) is_value_wrapper(x, WKNavigationDelegate)

JS_WRAP_CLASS(WKNavigationDelegate, NSObject);
  JS_PROP(webViewDecidePolicyForNavigationActionDecisionHandler);
  JS_PROP(webViewDecidePolicyForNavigationResponseDecisionHandler);
  JS_PROP(webViewDidStartProvisionalNavigation);
  JS_PROP(webViewDidReceiveServerRedirectForProvisionalNavigation);
  JS_PROP(webViewDidFailProvisionalNavigationWithError);
  JS_PROP(webViewDidCommitNavigation);
  JS_PROP(webViewDidFinishNavigation);
  JS_PROP(webViewDidFailNavigationWithError);
  JS_PROP(webViewDidReceiveAuthenticationChallengeCompletionHandler);
  JS_PROP(webViewWebContentProcessDidTerminate);
JS_WRAP_CLASS_END(WKNavigationDelegate);

#if __OBJC__
#import <WebKit/WKNavigationDelegate.h>
@interface WKNavigationDelegate : NSObject<WKNavigationDelegate>

#if TODO
/*! @abstract Decides whether to allow or cancel a navigation.
 @param webView The web view invoking the delegate method.
 @param navigationAction Descriptive information about the action
 triggering the navigation request.
 @param decisionHandler The decision handler to call to allow or cancel the
 navigation. The argument is one of the constants of the enumerated type WKNavigationActionPolicy.
 @discussion If you do not implement this method, the web view will load the request or, if appropriate, forward it to another application.
 */
- (void)webView:(WKWebView * _Nonnull)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler;

/*! @abstract Decides whether to allow or cancel a navigation after its
 response is known.
 @param webView The web view invoking the delegate method.
 @param navigationResponse Descriptive information about the navigation
 response.
 @param decisionHandler The decision handler to call to allow or cancel the
 navigation. The argument is one of the constants of the enumerated type WKNavigationResponsePolicy.
 @discussion If you do not implement this method, the web view will allow the response, if the web view can show it.
 */
- (void)webView:(WKWebView * _Nonnull)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler;
#endif

/*! @abstract Invoked when a main frame navigation starts.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView * _Nonnull)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation;

/*! @abstract Invoked when a server redirect is received for the main
 frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView * _Nonnull)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation;

/*! @abstract Invoked when an error occurs while starting to load data for
 the main frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 @param error The error that occurred.
 */
- (void)webView:(WKWebView * _Nonnull)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError * _Nullable)error;

/*! @abstract Invoked when content starts arriving for the main frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView * _Nonnull)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation;

/*! @abstract Invoked when a main frame navigation completes.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView * _Nonnull)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation;

/*! @abstract Invoked when an error occurs during a committed main frame
 navigation.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 @param error The error that occurred.
 */
- (void)webView:(WKWebView * _Nonnull)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError * _Nullable)error;

#if TODO
/*! @abstract Invoked when the web view needs to respond to an authentication challenge.
 @param webView The web view that received the authentication challenge.
 @param challenge The authentication challenge.
 @param completionHandler The completion handler you must invoke to respond to the challenge. The
 disposition argument is one of the constants of the enumerated type
 NSURLSessionAuthChallengeDisposition. When disposition is NSURLSessionAuthChallengeUseCredential,
 the credential argument is the credential to use, or nil to indicate continuing without a
 credential.
 @discussion If you do not implement this method, the web view will respond to the authentication challenge with the NSURLSessionAuthChallengeRejectProtectionSpace disposition.
 */
- (void)webView:(WKWebView * _Nonnull)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler;
#endif

/*! @abstract Invoked when the web view's web content process is terminated.
 @param webView The web view whose underlying web content process was terminated.
 */
- (void)webViewWebContentProcessDidTerminate:(WKWebView * _Nonnull)webView API_AVAILABLE(macosx(10.11), ios(9.0));

@end
#endif

#endif /* NWKNavigationDelegate_h */
