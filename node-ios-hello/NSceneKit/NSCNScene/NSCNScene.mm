//
//  NSCNScene.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNScene.h"

#define instancetype SCNScene
#define js_value_instancetype js_value_SCNScene

NSCNScene::NSCNScene () {}
NSCNScene::~NSCNScene () {}

JS_INIT_CLASS(SCNScene, NSObject);
  JS_ASSIGN_STATIC_METHOD(scene);
  JS_ASSIGN_STATIC_METHOD(sceneNamed);
  JS_ASSIGN_STATIC_METHOD(sceneNamedInDirectoryOptions);
  JS_ASSIGN_STATIC_METHOD(sceneWithURLOptionsError);
  JS_ASSIGN_PROTO_METHOD(attributeForKey);
  JS_ASSIGN_PROTO_METHOD(setAttributeForKey);
  JS_ASSIGN_PROTO_METHOD(writeToURLOptionsDelegateProgressHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(rootNode);
  JS_ASSIGN_PROTO_PROP_READONLY(physicsWorld);
  JS_ASSIGN_PROTO_PROP_READONLY(background);
  JS_ASSIGN_PROTO_PROP_READONLY(lightingEnvironment);
  JS_ASSIGN_PROTO_PROP(fogStartDistance);
  JS_ASSIGN_PROTO_PROP(fogEndDistance);
  JS_ASSIGN_PROTO_PROP(fogDensityExponent);
  JS_ASSIGN_PROTO_PROP(fogColor);
  JS_ASSIGN_PROTO_PROP(isPaused);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNScene, NSObject);

  JS_ASSIGN_STATIC_METHOD(sceneWithMDLAsset);
JS_INIT_CLASS_END(SCNScene, NSObject);

NAN_METHOD(NSCNScene::New) {
  JS_RECONSTRUCT(SCNScene);
  @autoreleasepool {
    SCNScene* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNScene *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNScene alloc] init];
    }
    if (self) {
      NSCNScene *wrapper = new NSCNScene();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNScene::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSCNScene::scene) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([SCNScene scene]));
  }
}

NAN_METHOD(NSCNScene::sceneNamed) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_instancetype([SCNScene sceneNamed: name]));
  }
}

NAN_METHOD(NSCNScene::sceneNamedInDirectoryOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_pointer(NSString, directory);
    declare_nullable_pointer(NSDictionary/* <SCNSceneSourceLoadingOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([SCNScene sceneNamed: name inDirectory: directory options: options]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NSCNScene::sceneWithURLOptionsError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_nullable_pointer(NSDictionary/* <SCNSceneSourceLoadingOption, id>*/, options);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([SCNScene sceneWithURL: url options: options error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NSCNScene::attributeForKey) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self attributeForKey: key]));
  }
}

NAN_METHOD(NSCNScene::setAttributeForKey) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, attribute);
    declare_pointer(NSString, key);
    [self setAttribute: attribute forKey: key];
  }
}

#include "NNSError.h"

// TODO: Add a `stop` parameter to the following callback.

NAN_METHOD(NSCNScene::writeToURLOptionsDelegateProgressHandler) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_nullable_pointer(NSDictionary/* <NSString*, id>*/, options);
    declare_nullable_value(id/* <SCNSceneExportDelegate>*/, delegate);
    declare_callback(progressHandler);
    JS_SET_RETURN(js_value_BOOL([self writeToURL: url options: options delegate: delegate progressHandler:^(float totalProgress, NSError * _Nullable error, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (progressHandler) {
          [progressHandler jsFunction]->Call("NSCNScene::writeToURLOptionsDelegateProgressHandler",
            js_value_float(totalProgress),
            js_value_NSError(error));
        }
      });
    }]));
  }
}

#include "NSCNNode.h"

NAN_GETTER(NSCNScene::rootNodeGetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNNode([self rootNode]));
  }
}

#include "NSCNPhysicsWorld.h"

NAN_GETTER(NSCNScene::physicsWorldGetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsWorld([self physicsWorld]));
  }
}

#include "NSCNMaterialProperty.h"

NAN_GETTER(NSCNScene::backgroundGetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self background]));
  }
}

NAN_GETTER(NSCNScene::lightingEnvironmentGetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMaterialProperty([self lightingEnvironment]));
  }
}

NAN_GETTER(NSCNScene::fogStartDistanceGetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self fogStartDistance]));
  }
}

NAN_SETTER(NSCNScene::fogStartDistanceSetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setFogStartDistance: input];
  }
}

NAN_GETTER(NSCNScene::fogEndDistanceGetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self fogEndDistance]));
  }
}

NAN_SETTER(NSCNScene::fogEndDistanceSetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setFogEndDistance: input];
  }
}

NAN_GETTER(NSCNScene::fogDensityExponentGetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self fogDensityExponent]));
  }
}

NAN_SETTER(NSCNScene::fogDensityExponentSetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setFogDensityExponent: input];
  }
}

NAN_GETTER(NSCNScene::fogColorGetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self fogColor]));
  }
}

NAN_SETTER(NSCNScene::fogColorSetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setFogColor: input];
  }
}

NAN_GETTER(NSCNScene::isPausedGetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPaused]));
  }
}

NAN_SETTER(NSCNScene::isPausedSetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPaused: input];
  }
}

#include "NMDLAsset.h"

NAN_METHOD(NSCNScene::sceneWithMDLAsset) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLAsset, mdlAsset);
    JS_SET_RETURN(js_value_instancetype([SCNScene sceneWithMDLAsset: mdlAsset]));
  }
}
