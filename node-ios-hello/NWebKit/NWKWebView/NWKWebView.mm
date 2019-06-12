//
//  NWKWebView.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NWKWebView.h"

#define instancetype WKWebView
#define js_value_instancetype js_value_WKWebView

NWKWebView::NWKWebView() {}
NWKWebView::~NWKWebView() {}

JS_INIT_CLASS(WKWebView, UIView);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(loadRequest);
  JS_ASSIGN_PROTO_METHOD(loadFileURLAllowingReadAccessToURL);
  JS_ASSIGN_PROTO_METHOD(loadHTMLStringBaseURL);
  JS_ASSIGN_PROTO_METHOD(loadData_MIMETypeCharacterEncodingNameBaseURL);
  JS_ASSIGN_PROTO_METHOD(goToBackForwardListItem);
  JS_ASSIGN_PROTO_METHOD(goBack);
  JS_ASSIGN_PROTO_METHOD(goForward);
  JS_ASSIGN_PROTO_METHOD(reload);
  JS_ASSIGN_PROTO_METHOD(reloadFromOrigin);
  JS_ASSIGN_PROTO_METHOD(stopLoading);
  JS_ASSIGN_PROTO_METHOD(evaluateJavaScriptCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(takeSnapshotWithConfigurationCompletionHandler);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_METHOD(setMagnificationCenteredAtPoint);
  JS_ASSIGN_PROTO_METHOD(goBack);
  JS_ASSIGN_PROTO_METHOD(goForward);
  JS_ASSIGN_PROTO_METHOD(reload);
  JS_ASSIGN_PROTO_METHOD(reloadFromOrigin);
  JS_ASSIGN_PROTO_METHOD(stopLoading);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(configuration);
  JS_ASSIGN_PROTO_PROP(navigationDelegate);
  JS_ASSIGN_PROTO_PROP(UIDelegate);
  JS_ASSIGN_PROTO_PROP_READONLY(backForwardList);
  JS_ASSIGN_PROTO_PROP_READONLY(title);
  JS_ASSIGN_PROTO_PROP_READONLY(URL);
  JS_ASSIGN_PROTO_PROP_READONLY(isLoading);
  JS_ASSIGN_PROTO_PROP_READONLY(estimatedProgress);
  JS_ASSIGN_PROTO_PROP_READONLY(hasOnlySecureContent);
  JS_ASSIGN_PROTO_PROP_READONLY(serverTrust);
  JS_ASSIGN_PROTO_PROP_READONLY(canGoBack);
  JS_ASSIGN_PROTO_PROP_READONLY(canGoForward);
  JS_ASSIGN_PROTO_PROP(allowsBackForwardNavigationGestures);
  JS_ASSIGN_PROTO_PROP(customUserAgent);
  JS_ASSIGN_PROTO_PROP(allowsLinkPreview);
  JS_ASSIGN_PROTO_PROP_READONLY(scrollView);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_PROP(allowsMagnification);
  JS_ASSIGN_PROTO_PROP(magnification);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(certificateChain);
  // static members (ctor)
  JS_INIT_CTOR(WKWebView, UIView);
  JS_ASSIGN_STATIC_METHOD(handlesURLScheme);
  JS_ASSIGN_STATIC_METHOD(initWithFrameConfiguration);
  JS_ASSIGN_STATIC_METHOD(initWithCoder);
JS_INIT_CLASS_END(WKWebView, UIView);

NAN_METHOD(NWKWebView::New) {
  JS_RECONSTRUCT(WKWebView);
  @autoreleasepool {
    WKWebView* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge WKWebView *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[WKWebView alloc] init];
    }
    if (self) {
      NWKWebView *wrapper = new NWKWebView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("WKWebView::New: invalid arguments");
    }
  }
}

NAN_METHOD(NWKWebView::handlesURLScheme) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, urlScheme);
    JS_SET_RETURN(js_value_BOOL([WKWebView handlesURLScheme: urlScheme]));
  }
}


#define js_value_WKWebViewConfiguration(x) js_value_wrapper_unknown(x, WKWebViewConfiguration)
#define to_value_WKWebViewConfiguration(x) to_value_wrapper_unknown(x, WKWebViewConfiguration)
#define is_value_WKWebViewConfiguration(x) is_value_wrapper_unknown(x, WKWebViewConfiguration)

NAN_METHOD(NWKWebView::initWithFrameConfiguration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    declare_pointer(WKWebViewConfiguration, configuration);
    JS_SET_RETURN(js_value_instancetype([[WKWebView alloc] initWithFrame: frame configuration: configuration]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NWKWebView::initWithCoder) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, coder);
    JS_SET_RETURN(js_value_instancetype([[WKWebView alloc] initWithCoder: coder]));
  }
}

#include "NNSURLRequest.h"

#define js_value_WKNavigation(x) js_value_wrapper_unknown(x, WKNavigation)
#define to_value_WKNavigation(x) to_value_wrapper_unknown(x, WKNavigation)
#define is_value_WKNavigation(x) is_value_wrapper_unknown(x, WKNavigation)

NAN_METHOD(NWKWebView::loadRequest) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURLRequest, request);
    JS_SET_RETURN(js_value_WKNavigation([self loadRequest: request]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NWKWebView::loadFileURLAllowingReadAccessToURL) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, URL);
    declare_pointer(NSURL, readAccessURL);
    JS_SET_RETURN(js_value_WKNavigation([self loadFileURL: URL allowingReadAccessToURL: readAccessURL]));
  }
}

NAN_METHOD(NWKWebView::loadHTMLStringBaseURL) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_WKNavigation([self loadHTMLString: string baseURL: baseURL]));
  }
}

NAN_METHOD(NWKWebView::loadData_MIMETypeCharacterEncodingNameBaseURL) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_pointer(NSString, MIMEType);
    declare_pointer(NSString, characterEncodingName);
    declare_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_WKNavigation([self loadData: data MIMEType: MIMEType characterEncodingName: characterEncodingName baseURL: baseURL]));
  }
}

#define js_value_WKBackForwardListItem(x) js_value_wrapper_unknown(x, WKBackForwardListItem)
#define to_value_WKBackForwardListItem(x) to_value_wrapper_unknown(x, WKBackForwardListItem)
#define is_value_WKBackForwardListItem(x) is_value_wrapper_unknown(x, WKBackForwardListItem)

NAN_METHOD(NWKWebView::goToBackForwardListItem) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(WKBackForwardListItem, item);
    JS_SET_RETURN(js_value_WKNavigation([self goToBackForwardListItem: item]));
  }
}

NAN_METHOD(NWKWebView::goBack) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_WKNavigation([self goBack]));
  }
}

NAN_METHOD(NWKWebView::goForward) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_WKNavigation([self goForward]));
  }
}

NAN_METHOD(NWKWebView::reload) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_WKNavigation([self reload]));
  }
}

NAN_METHOD(NWKWebView::reloadFromOrigin) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_WKNavigation([self reloadFromOrigin]));
  }
}

NAN_METHOD(NWKWebView::stopLoading) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    [self stopLoading];
  }
}

NAN_METHOD(NWKWebView::evaluateJavaScriptCompletionHandler) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, javaScriptString);
    sweetiekit::JSFunction completionHandler(info[JS_ARGC++]);
    [self evaluateJavaScript: javaScriptString completionHandler:^(id _Nullable result, NSError * _Nullable error) {
      dispatch_main(^{
        completionHandler("NWKWebView::evaluateJavaScriptCompletionHandler", js_value_id(result), js_value_id(error));
      });
    }];
  }
}

#include "NUIImage.h"

#define js_value_WKSnapshotConfiguration(x) js_value_wrapper_unknown(x, WKSnapshotConfiguration)
#define to_value_WKSnapshotConfiguration(x) to_value_wrapper_unknown(x, WKSnapshotConfiguration)
#define is_value_WKSnapshotConfiguration(x) is_value_wrapper_unknown(x, WKSnapshotConfiguration)

NAN_METHOD(NWKWebView::takeSnapshotWithConfigurationCompletionHandler) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(WKSnapshotConfiguration, snapshotConfiguration);
    sweetiekit::JSFunction completionHandler(info[JS_ARGC++]);
    [self takeSnapshotWithConfiguration: snapshotConfiguration completionHandler:^(UIImage * _Nullable snapshotImage, NSError * _Nullable error) {
      dispatch_main(^{
        completionHandler("NWKWebView::takeSnapshotWithConfigurationCompletionHandler", js_value_UIImage(snapshotImage), js_value_id(error));
      });
    }];
  }
}

#if !TARGET_OS_IPHONE
NAN_METHOD(NWKWebView::setMagnificationCenteredAtPoint) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, magnification);
    declare_value(CGPoint, point);
    [self setMagnification: magnification centeredAtPoint: point];
  }
}

NAN_METHOD(NWKWebView::goBack) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_IBAction([self goBack: sender]));
  }
}

NAN_METHOD(NWKWebView::goForward) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_IBAction([self goForward: sender]));
  }
}

NAN_METHOD(NWKWebView::reload) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_IBAction([self reload: sender]));
  }
}

NAN_METHOD(NWKWebView::reloadFromOrigin) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_IBAction([self reloadFromOrigin: sender]));
  }
}

NAN_METHOD(NWKWebView::stopLoading) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_IBAction([self stopLoading: sender]));
  }
}
#endif

NAN_GETTER(NWKWebView::configurationGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_WKWebViewConfiguration([self configuration]));
  }
}

NAN_GETTER(NWKWebView::navigationDelegateGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <WKNavigationDelegate>*/([self navigationDelegate]));
  }
}

NAN_SETTER(NWKWebView::navigationDelegateSetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <WKNavigationDelegate>*/, input);
    [self associateValue:input withKey:@"sweetiekit.NWKWebView.navigationDelegate"];
    [self setNavigationDelegate: input];
  }
}

NAN_GETTER(NWKWebView::UIDelegateGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <WKUIDelegate>*/([self UIDelegate]));
  }
}

NAN_SETTER(NWKWebView::UIDelegateSetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <WKUIDelegate>*/, input);
    [self associateValue:input withKey:@"sweetiekit.NWKWebView.UIDelegate"];
    [self setUIDelegate: input];
  }
}

#define js_value_WKBackForwardList(x) js_value_wrapper_unknown(x, WKBackForwardList)
#define to_value_WKBackForwardList(x) to_value_wrapper_unknown(x, WKBackForwardList)
#define is_value_WKBackForwardList(x) is_value_wrapper_unknown(x, WKBackForwardList)

NAN_GETTER(NWKWebView::backForwardListGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_WKBackForwardList([self backForwardList]));
  }
}

NAN_GETTER(NWKWebView::titleGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_GETTER(NWKWebView::URLGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URL]));
  }
}

NAN_GETTER(NWKWebView::isLoadingGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLoading]));
  }
}

NAN_GETTER(NWKWebView::estimatedProgressGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self estimatedProgress]));
  }
}

NAN_GETTER(NWKWebView::hasOnlySecureContentGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasOnlySecureContent]));
  }
}

#define js_value_SecTrustRef(x) js_value_wrapper_unknown((__bridge id)x, SecTrustRef)
#define to_value_SecTrustRef(x) to_value_wrapper_unknown(x, SecTrustRef)
#define is_value_SecTrustRef(x) is_value_wrapper_unknown(x, SecTrustRef)

NAN_GETTER(NWKWebView::serverTrustGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SecTrustRef([self serverTrust]));
  }
}

NAN_GETTER(NWKWebView::canGoBackGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canGoBack]));
  }
}

NAN_GETTER(NWKWebView::canGoForwardGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canGoForward]));
  }
}

NAN_GETTER(NWKWebView::allowsBackForwardNavigationGesturesGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsBackForwardNavigationGestures]));
  }
}

NAN_SETTER(NWKWebView::allowsBackForwardNavigationGesturesSetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsBackForwardNavigationGestures: input];
  }
}

NAN_GETTER(NWKWebView::customUserAgentGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self customUserAgent]));
  }
}

NAN_SETTER(NWKWebView::customUserAgentSetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setCustomUserAgent: input];
  }
}

NAN_GETTER(NWKWebView::allowsLinkPreviewGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsLinkPreview]));
  }
}

NAN_SETTER(NWKWebView::allowsLinkPreviewSetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsLinkPreview: input];
  }
}

#include "NUIScrollView.h"

NAN_GETTER(NWKWebView::scrollViewGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScrollView([self scrollView]));
  }
}

#if !TARGET_OS_IPHONE

NAN_GETTER(NWKWebView::allowsMagnificationGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsMagnification]));
  }
}

NAN_SETTER(NWKWebView::allowsMagnificationSetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsMagnification: input];
  }
}

NAN_GETTER(NWKWebView::magnificationGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self magnification]));
  }
}

NAN_SETTER(NWKWebView::magnificationSetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMagnification: input];
  }
}
#endif

NAN_GETTER(NWKWebView::certificateChainGetter) {
  JS_UNWRAP(WKWebView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray([self certificateChain]));
  }
}
