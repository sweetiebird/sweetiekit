//
//  NARSCNViewDelegate.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARSCNViewDelegate.h"

#ifdef __IPHONEOS__

#include "NARSession.h"
#include "NARAnchor.h"
#include "NSCNView.h"
#include "NSCNNode.h"

NARSCNViewDelegate::NARSCNViewDelegate () {}
NARSCNViewDelegate::~NARSCNViewDelegate () {}

#include "NSCNSceneRenderer.h"

JS_INIT_CLASS(ARSCNViewDelegate, NSObject);
  // instance members (proto)
  
  // static members (ctor)
  JS_INIT_CTOR(ARSCNViewDelegate, NSObject);
  
  // constants (exports)

  //typedef SCNDebugOptions ARSCNDebugOptions API_AVAILABLE(ios(11.0));

  /** Show the world origin in the scene. */
  // API_AVAILABLE(ios(11.0))
  JS_ASSIGN_ENUM(ARSCNDebugOptionShowWorldOrigin, SCNDebugOptions); // NS_SWIFT_NAME(ARSCNDebugOptions.showWorldOrigin);

  /** Show detected 3D feature points in the world. */
  // API_AVAILABLE(ios(11.0))
  JS_ASSIGN_ENUM(ARSCNDebugOptionShowFeaturePoints, SCNDebugOptions); // NS_SWIFT_NAME(ARSCNDebugOptions.showFeaturePoints);
  
JS_INIT_CLASS_END(ARSCNViewDelegate, NSObject);

NAN_METHOD(NARSCNViewDelegate::New) {
  JS_RECONSTRUCT(ARSCNViewDelegate);

  Local<Object> obj = info.This();

  NARSCNViewDelegate *del = new NARSCNViewDelegate();

  if (info[0]->IsExternal()) {
    del->SetNSObject((__bridge SARSCNViewDelegate *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    del->_nodeForAnchor.Reset(Local<Function>::Cast(info[0]));

    @autoreleasepool {
      del->SetNSObject([[SARSCNViewDelegate alloc] initWithNodeForAnchor: ^ SCNNode * _Nullable (id<SCNSceneRenderer> _Nonnull renderer, ARAnchor * _Nonnull anchor) {
        __block SCNNode* result = nil;
        dispatch_main(^{
          Local<Value> anchorObj = sweetiekit::GetWrapperFor(anchor, NARAnchor::type);
          Local<Value> resultVal = del->_nodeForAnchor("NARSCNViewDelegate::New _nodeForAnchor", Nan::Null(), anchorObj);
          JS_UNWRAPPED(JS_OBJ(resultVal), SCNNode, node);
          result = node;
        });
        return result;
      }]);
    }
  } else {
    @autoreleasepool {
      del->SetNSObject([[SARSCNViewDelegate alloc] init]);
    }
  }
  del->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

#endif
