//
//  NARSKView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARSKView.h"
#include "NSKView.h"
#include "NARSession.h"
#include "NARSKViewDelegate.h"
#include "NSKScene.h"
#include "NARAnchor.h"
#import "node_ios_hello-Swift.h"

NARSKView::NARSKView () {}
NARSKView::~NARSKView () {}

JS_INIT_CLASS(ARSKView, SKView);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, session);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_METHOD(proto, presentScene);
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

NAN_GETTER(NARSKView::sessionGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSKView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui session], NARSession::type));
}

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

NAN_METHOD(NARSKView::presentScene) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSKView, ui);

  NSKScene *scene = ObjectWrap::Unwrap<NSKScene>(Local<Object>::Cast(info[0]));
  
  [ui presentScene:scene->As<SKScene>()];
}

NAN_METHOD(NARSKView::hitTest) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(ARSKView, ui);
  
  if (!info[0]->IsObject() 
        || !JS_OBJ(info[0])->Get(JS_STR("x"))->IsNumber()
        || !JS_OBJ(info[0])->Get(JS_STR("y"))->IsNumber())
  {
    Nan::ThrowError("NARSKView::hitTest: expected 1st arg to be a CGPoint");
    return;
  }
  
  CGPoint point;
  point.x = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("x")));
  point.y = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("y")));
  
  ARHitTestResultType types = info[1]->IsInt32() ? TO_UINT32(info[1]) : ARHitTestResultTypeFeaturePoint;
  
  @autoreleasepool {
    NSArray<ARHitTestResult *> *result = [ui hitTest:point types:types];
    if (result != nullptr) {
      Local<Array> resultObj(Nan::New<Array>());
      
      uint32_t i = 0;
      for (ARHitTestResult* hit : result) {
        Local<Object> value(Nan::New<Object>());
                
        /**
         The type of the hit-test result.
         */
        //@property (nonatomic, readonly) ARHitTestResultType type;
        value->Set(JS_STR("type"), JS_INT((int)[hit type]));

        /**
         The distance from the camera to the intersection in meters.
         */
        //@property (nonatomic, readonly) CGFloat distance;
        value->Set(JS_STR("distance"), JS_NUM([hit distance]));

        /**
         The transformation matrix that defines the intersection’s rotation, translation and scale
         relative to the anchor or nearest feature point.
         */
        //@property (nonatomic, readonly) simd_float4x4 localTransform;
        auto localTransform([hit localTransform]);
        value->Set(JS_STR("localTransform"), createTypedArray<Float32Array>(16, (const float*)&localTransform));
        

        /**
         The transformation matrix that defines the intersection’s rotation, translation and scale
         relative to the world.
         */
        //@property (nonatomic, readonly) simd_float4x4 worldTransform;
        auto worldTransform([hit worldTransform]);
        value->Set(JS_STR("worldTransform"), createTypedArray<Float32Array>(16, (const float*)&worldTransform));

        /**
         The anchor that the hit-test intersected.
         
         @discussion An anchor will only be provided for existing plane result types.
         */
        //@property (nonatomic, strong, nullable, readonly) ARAnchor *anchor;
        ARAnchor* anchor = [hit anchor];
        if (anchor != nullptr) {
          value->Set(JS_STR("anchor"), sweetiekit::GetWrapperFor([hit anchor], NARAnchor::type));
        }
                
        resultObj->Set(i++, value);
      }
      
      JS_SET_RETURN(scope.Escape(resultObj));
    }
  }
}
