//
//  NSKScene.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKScene.h"

NSKScene::NSKScene() {}
NSKScene::~NSKScene() {}

JS_INIT_CLASS(SKScene, SKNode);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(convertPointFromView);
  JS_ASSIGN_PROTO_METHOD(convertPointToView);
  JS_ASSIGN_PROP(proto, touchesBeganWithEvent);
  JS_ASSIGN_PROP(proto, touchesMovedWithEvent);
  JS_ASSIGN_PROP(proto, touchesEndedWithEvent);
  JS_ASSIGN_PROP(proto, update);
  JS_ASSIGN_PROP(proto, size);
  JS_ASSIGN_PROP(proto, scaleMode);
  JS_ASSIGN_PROP(proto, camera);
  JS_ASSIGN_PROP(proto, listener);
  JS_ASSIGN_PROP_READONLY(proto, audioEngine);
  JS_ASSIGN_PROP(proto, backgroundColor);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, anchorPoint);
  JS_ASSIGN_PROP_READONLY(proto, physicsWorld);
  JS_ASSIGN_PROP_READONLY(proto, view);
  // static members (ctor)
  JS_INIT_CTOR(SKScene, SKNode);
  JS_ASSIGN_METHOD(ctor, sceneWithSize);
  // constants (exports)

  //typedef NS_ENUM(NSInteger, SKSceneScaleMode) {
    JS_ASSIGN_ENUM(SKSceneScaleModeFill, NSInteger); //             /* Scale the SKScene to fill the entire SKView. */
    JS_ASSIGN_ENUM(SKSceneScaleModeAspectFill, NSInteger); //       /* Scale the SKScene to fill the SKView while preserving the scene's aspect ratio. Some cropping may occur if the view has a different aspect ratio. */
    JS_ASSIGN_ENUM(SKSceneScaleModeAspectFit, NSInteger); //        /* Scale the SKScene to fit within the SKView while preserving the scene's aspect ratio. Some letterboxing may occur if the view has a different aspect ratio. */
    JS_ASSIGN_ENUM(SKSceneScaleModeResizeFill, NSInteger); //       /* Modify the SKScene's actual size to exactly match the SKView. */
  //} NS_ENUM_AVAILABLE(10_9, 7_0);

JS_INIT_CLASS_END(SKScene, SKNode);

NAN_METHOD(NSKScene::New) {
  JS_RECONSTRUCT(SKScene);

  Local<Object> obj = info.This();

  NSKScene *scene = new NSKScene();

  if (info[0]->IsExternal()) {
    scene->SetNSObject((__bridge SKScene *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    std::string file;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      file = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
      delete scene;
      return;
    }
    @autoreleasepool {
      NSString *fileName = [NSString stringWithUTF8String:file.c_str()];
      scene->SetNSObject([SKScene nodeWithFileNamed:fileName]);
    }
  } else {
    @autoreleasepool {
      scene->SetNSObject([[SKScene alloc] init]);
    }
  }
  scene->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NSKScene::sceneWithSize) {
  @autoreleasepool {
    JS_SET_RETURN_EXTERNAL(SKScene,
      [SKScene sceneWithSize:to_value_CGSize(info[0])]);
  }
}

NAN_METHOD(NSKScene::convertPointFromView) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool {
    CGPoint converted([self convertPointFromView:to_value_CGPoint(info[0])]);
    JS_SET_RETURN(js_value_CGPoint(converted));
  }
}

NAN_METHOD(NSKScene::convertPointToView) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool {
    CGPoint converted([self convertPointToView:to_value_CGPoint(info[0])]);
    JS_SET_RETURN(js_value_CGPoint(converted));
  }
}

NAN_GETTER(NSKScene::scaleModeGetter) {
  JS_UNWRAP(SKScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKSceneScaleMode([self scaleMode]));
  }
}

NAN_SETTER(NSKScene::scaleModeSetter) {
  JS_UNWRAP(SKScene, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SKSceneScaleMode, input);
    [self setScaleMode: input];
  }
}

NAN_GETTER(NSKScene::touchesBeganWithEventGetter) {
  Nan::EscapableHandleScope scope;
  
  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    id fn = [sk associatedValueForKey:@"sweetiekit_touchesBeganWithEvent"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NSKScene::touchesBeganWithEventSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [sk associateValue:func withKey:@"sweetiekit_touchesBeganWithEvent"];
  }
}

NAN_GETTER(NSKScene::touchesMovedWithEventGetter) {
  Nan::EscapableHandleScope scope;
  
  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    id fn = [sk associatedValueForKey:@"sweetiekit_touchesMovedWithEvent"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NSKScene::touchesMovedWithEventSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [sk associateValue:func withKey:@"sweetiekit_touchesMovedWithEvent"];
  }
}

NAN_GETTER(NSKScene::touchesEndedWithEventGetter) {
  Nan::EscapableHandleScope scope;
  
  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    id fn = [sk associatedValueForKey:@"sweetiekit_touchesEndedWithEvent"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NSKScene::touchesEndedWithEventSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [sk associateValue:func withKey:@"sweetiekit_touchesEndedWithEvent"];
  }
}

NAN_GETTER(NSKScene::sizeGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGSize([self size]));
    return;
  }
}

NAN_SETTER(NSKScene::sizeSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setSize: to_value_CGSize(value)];
  }
}

/*
NAN_GETTER(NSKScene::scaleModeGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKSceneScaleMode([self scaleMode]));
    return;
  }
}

NAN_SETTER(NSKScene::scaleModeSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setScaleMode: to_value_SKSceneScaleMode(value)];
  }
}*/

#include "NSKCameraNode.h"

NAN_GETTER(NSKScene::cameraGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKCameraNode([self camera]));
    return;
  }
}

NAN_SETTER(NSKScene::cameraSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setCamera: to_value_SKCameraNode(value)];
  }
}

NAN_GETTER(NSKScene::listenerGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKNode([self listener]));
    return;
  }
}

NAN_SETTER(NSKScene::listenerSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setListener: to_value_SKNode(value)];
  }
}

#define js_value_AVAudioEngine(x) js_value_wrapper_unknown(x, AVAudioEngine)
#define to_value_AVAudioEngine(x) to_value_wrapper_unknown(x, AVAudioEngine)
#define is_value_AVAudioEngine(x) is_value_wrapper_unknown(x, AVAudioEngine)

NAN_GETTER(NSKScene::audioEngineGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_AVAudioEngine([self audioEngine]));
    return;
  }
}

NAN_GETTER(NSKScene::backgroundColorGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKColor([self backgroundColor]));
    return;
  }
}

NAN_SETTER(NSKScene::backgroundColorSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setBackgroundColor: to_value_SKColor(value)];
  }
}

#define js_value_SKSceneDelegate(x) js_value_wrapper_unknown(x, SKSceneDelegate)
#define to_value_SKSceneDelegate(x) to_value_wrapper_unknown(x, SKSceneDelegate)
#define is_value_SKSceneDelegate(x) is_value_wrapper_unknown(x, SKSceneDelegate)

NAN_GETTER(NSKScene::delegateGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id/*<SKSceneDelegate>*/([self delegate]));
    return;
  }
}

NAN_SETTER(NSKScene::delegateSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setDelegate: to_value_id/*<SKSceneDelegate>*/(value)];
  }
}

NAN_GETTER(NSKScene::anchorPointGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGPoint([self anchorPoint]));
    return;
  }
}

NAN_SETTER(NSKScene::anchorPointSetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    [self setAnchorPoint: to_value_CGPoint(value)];
  }
}

#include "NSKPhysicsWorld.h"

NAN_GETTER(NSKScene::physicsWorldGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKPhysicsWorld([self physicsWorld]));
    return;
  }
}

#include "NSKView.h"

NAN_GETTER(NSKScene::viewGetter) {
  JS_UNWRAP(SKScene, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKView([self view]));
    return;
  }
}

NAN_GETTER(NSKScene::updateGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    id fn = [sk associatedValueForKey:@"sweetiekit_update"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NSKScene::updateSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(SKScene, sk);

  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [sk associateValue:func withKey:@"sweetiekit_update"];
  }
}
