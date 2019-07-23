//
//  NWKNavigationDelegate.mm
//
//  Created by Emily Kolar on 2019-6-7.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NWKNavigationDelegate.h"
#include "NWKWebView.h"

NWKNavigationDelegate::NWKNavigationDelegate() {}
NWKNavigationDelegate::~NWKNavigationDelegate() {}

JS_INIT_CLASS(WKNavigationDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(webViewDecidePolicyForNavigationActionDecisionHandler);
  JS_ASSIGN_PROTO_PROP(webViewDecidePolicyForNavigationResponseDecisionHandler);
  JS_ASSIGN_PROTO_PROP(webViewDidStartProvisionalNavigation);
  JS_ASSIGN_PROTO_PROP(webViewDidReceiveServerRedirectForProvisionalNavigation);
  JS_ASSIGN_PROTO_PROP(webViewDidFailProvisionalNavigationWithError);
  JS_ASSIGN_PROTO_PROP(webViewDidCommitNavigation);
  JS_ASSIGN_PROTO_PROP(webViewDidFinishNavigation);
  JS_ASSIGN_PROTO_PROP(webViewDidFailNavigationWithError);
  JS_ASSIGN_PROTO_PROP(webViewDidReceiveAuthenticationChallengeCompletionHandler);
  JS_ASSIGN_PROTO_PROP(webViewWebContentProcessDidTerminate);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(WKNavigationDelegate, NSObject);
JS_INIT_CLASS_END(WKNavigationDelegate, NSObject);

NAN_METHOD(NWKNavigationDelegate::New) {
  JS_RECONSTRUCT(WKNavigationDelegate);
  @autoreleasepool {
    WKNavigationDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge WKNavigationDelegate *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[WKNavigationDelegate alloc] init];
    }
    if (self) {
      NWKNavigationDelegate *wrapper = new NWKNavigationDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("WKNavigationDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(WKNavigationDelegate, webViewDecidePolicyForNavigationActionDecisionHandler);
DELEGATE_PROP(WKNavigationDelegate, webViewDecidePolicyForNavigationResponseDecisionHandler);
DELEGATE_PROP(WKNavigationDelegate, webViewDidStartProvisionalNavigation);
DELEGATE_PROP(WKNavigationDelegate, webViewDidReceiveServerRedirectForProvisionalNavigation);
DELEGATE_PROP(WKNavigationDelegate, webViewDidFailProvisionalNavigationWithError);
DELEGATE_PROP(WKNavigationDelegate, webViewDidCommitNavigation);
DELEGATE_PROP(WKNavigationDelegate, webViewDidFinishNavigation);
DELEGATE_PROP(WKNavigationDelegate, webViewDidFailNavigationWithError);
DELEGATE_PROP(WKNavigationDelegate, webViewDidReceiveAuthenticationChallengeCompletionHandler);
DELEGATE_PROP(WKNavigationDelegate, webViewWebContentProcessDidTerminate);

#include "NWKNavigation.h"
#include "NNSError.h"
#include "NNSURLAuthenticationChallenge.h"

@implementation WKNavigationDelegate

#if TODO
/*! @abstract Decides whether to allow or cancel a navigation.
 @param webView The web view invoking the delegate method.
 @param navigationAction Descriptive information about the action
 triggering the navigation request.
 @param decisionHandler The decision handler to call to allow or cancel the
 navigation. The argument is one of the constants of the enumerated type WKNavigationActionPolicy.
 @discussion If you do not implement this method, the web view will load the request or, if appropriate, forward it to another application.
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
}

/*! @abstract Decides whether to allow or cancel a navigation after its
 response is known.
 @param webView The web view invoking the delegate method.
 @param navigationResponse Descriptive information about the navigation
 response.
 @param decisionHandler The decision handler to call to allow or cancel the
 navigation. The argument is one of the constants of the enumerated type WKNavigationResponsePolicy.
 @discussion If you do not implement this method, the web view will allow the response, if the web view can show it.
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
}
#endif

/*! @abstract Invoked when a main frame navigation starts.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
  call_delegate_async(noop(), webViewDidStartProvisionalNavigation,
    js_value_WKWebView(webView),
    js_value_WKNavigation(navigation));
}

/*! @abstract Invoked when a server redirect is received for the main
 frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
  call_delegate_async(noop(), webViewDidReceiveServerRedirectForProvisionalNavigation,
    js_value_WKWebView(webView),
    js_value_WKNavigation(navigation));
}

/*! @abstract Invoked when an error occurs while starting to load data for
 the main frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 @param error The error that occurred.
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
  call_delegate_async(noop(), webViewDidFailProvisionalNavigationWithError,
    js_value_WKWebView(webView),
    js_value_WKNavigation(navigation),
    js_value_NSError(error));
}

/*! @abstract Invoked when content starts arriving for the main frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation
{
  call_delegate_async(noop(), webViewDidCommitNavigation,
    js_value_WKWebView(webView),
    js_value_WKNavigation(navigation));
}

/*! @abstract Invoked when a main frame navigation completes.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
  call_delegate_async(noop(), webViewDidFinishNavigation,
    js_value_WKWebView(webView),
    js_value_WKNavigation(navigation));
}

/*! @abstract Invoked when an error occurs during a committed main frame
 navigation.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 @param error The error that occurred.
 */
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
  call_delegate_async(noop(), webViewDidFailNavigationWithError,
    js_value_WKWebView(webView),
    js_value_WKNavigation(navigation),
    js_value_NSError(error));
}

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
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler
{
  call_delegate_async(noop(), webViewDidReceiveAuthenticationChallengeCompletionHandler,
    js_value_WKWebView(webView),
    js_value_NSURLAuthenticationChallenge(challenge)
    js_value_callback(completionHandler));
}
#endif

/*! @abstract Invoked when the web view's web content process is terminated.
 @param webView The web view whose underlying web content process was terminated.
 */
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView API_AVAILABLE(macosx(10.11), ios(9.0))
{
  call_delegate_async(noop(), webViewDidFinishNavigation,
    js_value_WKWebView(webView));
}
@end
