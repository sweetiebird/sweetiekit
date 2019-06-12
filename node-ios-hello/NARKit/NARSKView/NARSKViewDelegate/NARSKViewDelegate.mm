//
//  NARSKViewDelegate.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSKViewDelegate.h"
#include "NARSession.h"
#include "NARAnchor.h"
#include "NSKNode.h"
#include "NARSKView.h"

NARSKViewDelegate::NARSKViewDelegate () {}
NARSKViewDelegate::~NARSKViewDelegate () {}

JS_INIT_CLASS(ARSKViewDelegate, NSObject);
  // instance members (proto)
  
  // static members (ctor)
  JS_INIT_CTOR(ARSKViewDelegate, NSObject);
  
JS_INIT_CLASS_END(ARSKViewDelegate, NSObject);

NAN_METHOD(NARSKViewDelegate::New) {
  JS_RECONSTRUCT(ARSKViewDelegate);

  Local<Object> obj = info.This();

  NARSKViewDelegate *del = new NARSKViewDelegate();

  if (info[0]->IsExternal()) {
    del->SetNSObject((__bridge SARSKViewDelegate *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    del->_nodeForAnchor.Reset(Local<Function>::Cast(info[0]));

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          del->SetNSObject([[SARSKViewDelegate alloc] initWithNodeForAnchor: ^ SKNode * _Nullable (ARSKView * _Nonnull view, ARAnchor * _Nonnull anchor) {
            Nan::HandleScope scope;
            Local<Value> viewObj = sweetiekit::GetWrapperFor(view, NARSKView::type);
            Local<Value> anchorObj = sweetiekit::GetWrapperFor(anchor, NARAnchor::type);
            Local<Value> result = del->_nodeForAnchor("NARSKViewDelegate::New",
            viewObj, anchorObj);
            if (!result->IsNullOrUndefined()) {
              JS_UNWRAPPED(result, SKNode, node);
              return node;
            } else {
              return nullptr;
            }
          }]);
      });
    }
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        del->SetNSObject([[SARSKViewDelegate alloc] init]);
      });
    }
  }
  del->Wrap(obj);

  info.GetReturnValue().Set(obj);
}
