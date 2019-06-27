//
//  NSCNView.mk
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNView.h"

NSCNView::NSCNView () {}
NSCNView::~NSCNView () {}

JS_INIT_CLASS(SCNView, UIView);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(hitTest);
  JS_ASSIGN_PROTO_METHOD(projectPoint);
  JS_ASSIGN_PROTO_METHOD(unprojectPoint);
  JS_ASSIGN_PROP(proto, rendersContinuously);
  JS_ASSIGN_PROP(proto, allowsCameraControl);
  JS_ASSIGN_PROP_READONLY(proto, cameraControlConfiguration);
  JS_ASSIGN_PROP_READONLY(proto, defaultCameraController);
  JS_ASSIGN_PROP(proto, preferredFramesPerSecond);
  JS_ASSIGN_PROP(proto, eaglContext);
  JS_ASSIGN_PROP(proto, antialiasingMode);
  // SCNRenderer
  JS_ASSIGN_PROP(proto, scene);
  JS_ASSIGN_PROP(proto, sceneTime);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, playing);
  JS_ASSIGN_PROP(proto, loops);
  JS_ASSIGN_PROP(proto, pointOfView);
  JS_ASSIGN_PROP(proto, autoenablesDefaultLighting);
  JS_ASSIGN_PROP(proto, jitteringEnabled);
  JS_ASSIGN_PROP(proto, showsStatistics);
  JS_ASSIGN_PROP(proto, debugOptions);
  JS_ASSIGN_PROP(proto, overlaySKScene);
  JS_ASSIGN_PROP_READONLY(proto, renderingAPI);
  JS_ASSIGN_PROP_READONLY(proto, context);
  JS_ASSIGN_PROP_READONLY(proto, currentRenderCommandEncoder);
  JS_ASSIGN_PROP_READONLY(proto, device);
  JS_ASSIGN_PROP_READONLY(proto, colorPixelFormat);
  JS_ASSIGN_PROP_READONLY(proto, depthPixelFormat);
  JS_ASSIGN_PROP_READONLY(proto, stencilPixelFormat);
  JS_ASSIGN_PROP_READONLY(proto, commandQueue);
  JS_ASSIGN_PROP_READONLY(proto, audioEngine);
  JS_ASSIGN_PROP_READONLY(proto, audioEnvironmentNode);
  JS_ASSIGN_PROP(proto, audioListener);

  // static members (ctor)
  JS_INIT_CTOR(SCNView, UIView);
JS_INIT_CLASS_END(SCNView, UIView);

NAN_METHOD(NSCNView::New) {
  JS_RECONSTRUCT(SCNView);

  Local<Object> obj = info.This();

  NSCNView *view = new NSCNView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge SCNView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      view->SetNSObject([[SCNView alloc] initWithFrame:frame]);
    }
  } else {
    @autoreleasepool {
      view->SetNSObject([[SCNView alloc] init]);
    }
  }
  view->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NSCNView::hitTest) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool {
    CGPoint point(to_value_CGPoint(info[0]));
    NSArray<SCNHitTestResult*>* results = [self hitTest:point options:nil];
    JS_SET_RETURN(js_value_NSArray<SCNHitTestResult*>(results)); // TODO: options
  }
}

NAN_METHOD(NSCNView::projectPoint) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool {
    SCNVector3 point(to_value_SCNVector3(info[0]));
    SCNVector3 result([self projectPoint:point]);
    JS_SET_RETURN(js_value_SCNVector3(result)); 
  }
}

NAN_METHOD(NSCNView::unprojectPoint) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool {
    SCNVector3 point(to_value_SCNVector3(info[0]));
    SCNVector3 result([self unprojectPoint:point]);
    JS_SET_RETURN(js_value_SCNVector3(result)); 
  }
}

NAN_GETTER(NSCNView::rendersContinuouslyGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self rendersContinuously]));
    return;
  }
}

NAN_SETTER(NSCNView::rendersContinuouslySetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setRendersContinuously: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNView::allowsCameraControlGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self allowsCameraControl]));
    return;
  }
}

NAN_SETTER(NSCNView::allowsCameraControlSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setAllowsCameraControl: TO_BOOL(value)];
  }
}

typedef NSObject SCNCameraControlConfiguration;

NAN_GETTER(NSCNView::cameraControlConfigurationGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id <SCNCameraControlConfiguration>([self cameraControlConfiguration]));
    return;
  }
}

#include "NSCNCameraController.h"

NAN_GETTER(NSCNView::defaultCameraControllerGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNCameraController([self defaultCameraController]));
    return;
  }
}

NAN_GETTER(NSCNView::preferredFramesPerSecondGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self preferredFramesPerSecond]));
    return;
  }
}

NAN_SETTER(NSCNView::preferredFramesPerSecondSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setPreferredFramesPerSecond: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNView::eaglContextGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_EAGLContext([self eaglContext]));
    return;
  }
}

NAN_SETTER(NSCNView::eaglContextSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setEaglContext: to_value_EAGLContext(value)];
  }
}

#include "NSCNSceneRenderer.h"

NAN_GETTER(NSCNView::antialiasingModeGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNAntialiasingMode([self antialiasingMode]));
    return;
  }
}

NAN_SETTER(NSCNView::antialiasingModeSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setAntialiasingMode: to_value_SCNAntialiasingMode(value)];
  }
}

#include "NSCNScene.h"

NAN_GETTER(NSCNView::sceneGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNScene([self scene]));
    return;
  }
}

NAN_SETTER(NSCNView::sceneSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setScene: to_value_SCNScene(value)];
  }
}

NAN_GETTER(NSCNView::sceneTimeGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSTimeInterval([self sceneTime]));
    return;
  }
}

NAN_SETTER(NSCNView::sceneTimeSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setSceneTime: to_value_NSTimeInterval(value)];
  }
}

typedef NSObject SCNSceneRendererDelegate;

NAN_GETTER(NSCNView::delegateGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id <SCNSceneRendererDelegate>([self delegate]));
    return;
  }
}

NAN_SETTER(NSCNView::delegateSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setDelegate: to_value_id <SCNSceneRendererDelegate>(value)];
  }
}

NAN_GETTER(NSCNView::playingGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isPlaying]));
    return;
  }
}

NAN_SETTER(NSCNView::playingSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setPlaying: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNView::loopsGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self loops]));
    return;
  }
}

NAN_SETTER(NSCNView::loopsSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setLoops: TO_BOOL(value)];
  }
}

#include "NSCNNode.h"

NAN_GETTER(NSCNView::pointOfViewGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNNode([self pointOfView]));
    return;
  }
}

NAN_SETTER(NSCNView::pointOfViewSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setPointOfView: to_value_SCNNode(value)];
  }
}

NAN_GETTER(NSCNView::autoenablesDefaultLightingGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self autoenablesDefaultLighting]));
    return;
  }
}

NAN_SETTER(NSCNView::autoenablesDefaultLightingSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setAutoenablesDefaultLighting: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNView::jitteringEnabledGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isJitteringEnabled]));
    return;
  }
}

NAN_SETTER(NSCNView::jitteringEnabledSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setJitteringEnabled: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNView::showsStatisticsGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self showsStatistics]));
    return;
  }
}

NAN_SETTER(NSCNView::showsStatisticsSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setShowsStatistics: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNView::debugOptionsGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNDebugOptions([self debugOptions]));
    return;
  }
}

NAN_SETTER(NSCNView::debugOptionsSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setDebugOptions: to_value_SCNDebugOptions(value)];
  }
}

#include "NSKScene.h"

NAN_GETTER(NSCNView::overlaySKSceneGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKScene([self overlaySKScene]));
    return;
  }
}

NAN_SETTER(NSCNView::overlaySKSceneSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setOverlaySKScene: to_value_SKScene(value)];
  }
}

NAN_GETTER(NSCNView::renderingAPIGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNRenderingAPI([self renderingAPI]));
    return;
  }
}

NAN_GETTER(NSCNView::contextGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void_pointer([self context]));
    return;
  }
}

typedef NSObject MTLRenderCommandEncoder;

NAN_GETTER(NSCNView::currentRenderCommandEncoderGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
#if SCN_ENABLE_METAL
    JS_SET_RETURN(js_value_id <MTLRenderCommandEncoder>([self currentRenderCommandEncoder]));
#endif
    return;
  }
}

typedef id MTLDevice;

NAN_GETTER(NSCNView::deviceGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
#if SCN_ENABLE_METAL
    JS_SET_RETURN(js_value_id_ <MTLDevice>([self device]));
#endif
    return;
  }
}

#include "NMTLPixelFormat.h"

NAN_GETTER(NSCNView::colorPixelFormatGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
#if SCN_ENABLE_METAL
    JS_SET_RETURN(js_value_MTLPixelFormat([self colorPixelFormat]));
#endif
    return;
  }
}

NAN_GETTER(NSCNView::depthPixelFormatGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
#if SCN_ENABLE_METAL
    JS_SET_RETURN(js_value_MTLPixelFormat([self depthPixelFormat]));
#endif
    return;
  }
}

NAN_GETTER(NSCNView::stencilPixelFormatGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
#if SCN_ENABLE_METAL
    JS_SET_RETURN(js_value_MTLPixelFormat([self stencilPixelFormat]));
#endif
    return;
  }
}

typedef id MTLCommandQueue;

NAN_GETTER(NSCNView::commandQueueGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
#if SCN_ENABLE_METAL
    JS_SET_RETURN(js_value_id_ <MTLCommandQueue>([self commandQueue]));
#endif
    return;
  }
}

#define js_value_AVAudioEngine(x) js_value_wrapper_unknown(x, AVAudioEngine)
#define to_value_AVAudioEngine(x) to_value_wrapper_unknown(x, AVAudioEngine)
#define is_value_AVAudioEngine(x) is_value_wrapper_unknown(x, AVAudioEngine)

NAN_GETTER(NSCNView::audioEngineGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_AVAudioEngine([self audioEngine]));
    return;
  }
}

#define js_value_AVAudioEnvironmentNode(x) js_value_wrapper_unknown(x, AVAudioEnvironmentNode)
#define to_value_AVAudioEnvironmentNode(x) to_value_wrapper_unknown(x, AVAudioEnvironmentNode)
#define is_value_AVAudioEnvironmentNode(x) is_value_wrapper_unknown(x, AVAudioEnvironmentNode)

NAN_GETTER(NSCNView::audioEnvironmentNodeGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_AVAudioEnvironmentNode([self audioEnvironmentNode]));
    return;
  }
}

NAN_GETTER(NSCNView::audioListenerGetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNNode([self audioListener]));
    return;
  }
}

NAN_SETTER(NSCNView::audioListenerSetter) {
  JS_UNWRAP(SCNView, self);
  @autoreleasepool
  {
    [self setAudioListener: to_value_SCNNode(value)];
  }
}
