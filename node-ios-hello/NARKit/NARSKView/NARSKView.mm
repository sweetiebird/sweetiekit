//
//  NARSKView.mm
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSKView.h"

NARSKView::NARSKView () {}
NARSKView::~NARSKView () {}

JS_INIT_CLASS(ARSKView, SKView);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, session);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_METHOD(proto, presentScene);
  JS_ASSIGN_METHOD(proto, nodeForAnchor);
  JS_ASSIGN_METHOD(proto, anchorForNode);
  JS_ASSIGN_METHOD(proto, hitTest);
  
  // static members (ctor)
  JS_INIT_CTOR(ARSKView, SKView);
  
JS_INIT_CLASS_END(ARSKView, SKView);


NAN_METHOD(NARSKView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARSKView *view = new NARSKView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge ARSKView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      dispatch_sync(dispatch_get_main_queue(), ^ {
          view->SetNSObject([[ARSKView alloc] initWithFrame:frame]);
      });
    }
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        view->SetNSObject([[ARSKView alloc] init]);
      });
    }
  }
  view->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

#include "NARSession.h"

NAN_GETTER(NARSKView::sessionGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSKView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui session], NARSession::type));
}

#include "NARSKViewDelegate.h"

NAN_GETTER(NARSKView::delegateGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSKView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui delegate], NARSKViewDelegate::type));
}

NAN_SETTER(NARSKView::delegateSetter) {
  Nan::HandleScope scope;
  
  NARSKView *view = ObjectWrap::Unwrap<NARSKView>(info.This());
  NARSKViewDelegate *del = ObjectWrap::Unwrap<NARSKViewDelegate>(Local<Object>::Cast(value));
  auto delegate = del->As<SARSKViewDelegate>();
  view->_delegate.Reset(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      JS_UNWRAP(ARSKView, ui);
      [ui associateValue:delegate withKey:@"sweetiekit.delegate"];
      [ui setDelegate:delegate];
    });
  }
}

#include "NSKScene.h"

NAN_METHOD(NARSKView::presentScene) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSKView, ui);

  NSKScene *scene = ObjectWrap::Unwrap<NSKScene>(Local<Object>::Cast(info[0]));
  
  [ui presentScene:scene->As<SKScene>()];
}

#include "NSKNode.h"
#include "NARAnchor.h"

NAN_METHOD(NARSKView::anchorForNode) {
  JS_UNWRAP(ARSKView, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_ARAnchor([self anchorForNode:to_value_SKNode(info[0])]));
  }
}

NAN_METHOD(NARSKView::nodeForAnchor) {
  JS_UNWRAP(ARSKView, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_SKNode([self nodeForAnchor:to_value_ARAnchor(info[0])]));
  }
}

#include "NARHitTestResult.h"

NAN_METHOD(NARSKView::hitTest) {
  JS_UNWRAP(ARSKView, self);
  @autoreleasepool {
    if (is_value_CGPoint(info[0]) && is_value_ARHitTestResultType(info[1])) {
      CGPoint point(to_value_CGPoint(info[0]));
      ARHitTestResultType types(to_value_ARHitTestResultType(info[1]));
      NSArray<ARHitTestResult*>* results = [self hitTest:point types:types];
      JS_SET_RETURN(js_value_NSArray<ARHitTestResult*>(results));
    } else {
      JS_SET_RETURN(js_value_NSArray<SKNode*>([[self scene] nodesAtPoint:to_value_CGPoint(info[0])]));
    }
  }
}
