//
//  NARSKView.mm
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSKView.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define instancetype ARSKView
#define js_value_instancetype js_value_ARSKView

NARSKView::NARSKView() {}
NARSKView::~NARSKView() {}

JS_INIT_CLASS(ARSKView, SKView);
  JS_ASSIGN_PROTO_METHOD(anchorForNode);
  JS_ASSIGN_PROTO_METHOD(nodeForAnchor);
  JS_ASSIGN_PROTO_METHOD(hitTestTypes);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(session);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARSKView, SKView);
  
JS_INIT_CLASS_END(ARSKView, SKView);

NAN_METHOD(NARSKView::New) {
  JS_RECONSTRUCT(ARSKView);
  @autoreleasepool {
    ARSKView* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge ARSKView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[ARSKView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[ARSKView alloc] init];
    }
    if (self) {
      NARSKView *wrapper = new NARSKView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARSKView::New: invalid arguments");
    }
  }
}

#include "NARAnchor.h"
#include "NSKNode.h"

NAN_METHOD(NARSKView::anchorForNode) {
  JS_UNWRAP(ARSKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    JS_SET_RETURN(js_value_ARAnchor([self anchorForNode: node]));
  }
}

NAN_METHOD(NARSKView::nodeForAnchor) {
  JS_UNWRAP(ARSKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(ARAnchor, anchor);
    JS_SET_RETURN(js_value_SKNode([self nodeForAnchor: anchor]));
  }
}

#include "NARHitTestResult.h"

NAN_METHOD(NARSKView::hitTestTypes) {
  JS_UNWRAP(ARSKView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_value(ARHitTestResultType, types);
    JS_SET_RETURN(js_value_NSArray<ARHitTestResult*>([self hitTest: point types: types]));
  }
}

NAN_GETTER(NARSKView::delegateGetter) {
  JS_UNWRAP(ARSKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <ARSKViewDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NARSKView::delegateSetter) {
  JS_UNWRAP(ARSKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_nullable_value(id/* <ARSKViewDelegate>*/, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NARSKView::delegate"];
  }
}

#include "NARSession.h"

NAN_GETTER(NARSKView::sessionGetter) {
  JS_UNWRAP(ARSKView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARSession([self session]));
  }
}

NAN_SETTER(NARSKView::sessionSetter) {
  JS_UNWRAP(ARSKView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(ARSession, input);
    [self setSession: input];
  }
}

#endif
