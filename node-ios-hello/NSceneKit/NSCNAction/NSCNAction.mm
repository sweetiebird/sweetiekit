//
//  NSCNAction.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNAction.h"

#define instancetype SCNAction
#define js_value_instancetype js_value_SCNAction

NSCNAction::NSCNAction() {}
NSCNAction::~NSCNAction() {}

JS_INIT_CLASS(SCNAction, NSObject);
  JS_ASSIGN_STATIC_METHOD(moveByXYZDuration);
  JS_ASSIGN_STATIC_METHOD(moveByDuration);
  JS_ASSIGN_STATIC_METHOD(moveToDuration);
  JS_ASSIGN_STATIC_METHOD(rotateByXYZDuration);
  JS_ASSIGN_STATIC_METHOD(rotateToXYZDuration);
  JS_ASSIGN_STATIC_METHOD(rotateToXYZDurationShortestUnitArc);
  JS_ASSIGN_STATIC_METHOD(rotateByAngleAroundAxisDuration);
  JS_ASSIGN_STATIC_METHOD(rotateToAxisAngleDuration);
  JS_ASSIGN_STATIC_METHOD(scaleByDuration);
  JS_ASSIGN_STATIC_METHOD(scaleToDuration);
  JS_ASSIGN_STATIC_METHOD(sequence);
  JS_ASSIGN_STATIC_METHOD(group);
  JS_ASSIGN_STATIC_METHOD(repeatActionCount);
  JS_ASSIGN_STATIC_METHOD(repeatActionForever);
  JS_ASSIGN_STATIC_METHOD(fadeInWithDuration);
  JS_ASSIGN_STATIC_METHOD(fadeOutWithDuration);
  JS_ASSIGN_STATIC_METHOD(fadeOpacityByDuration);
  JS_ASSIGN_STATIC_METHOD(fadeOpacityToDuration);
  JS_ASSIGN_STATIC_METHOD(hide);
  JS_ASSIGN_STATIC_METHOD(unhide);
  JS_ASSIGN_STATIC_METHOD(waitForDuration);
  JS_ASSIGN_STATIC_METHOD(waitForDurationWithRange);
  JS_ASSIGN_STATIC_METHOD(removeFromParentNode);
  JS_ASSIGN_STATIC_METHOD(runBlock);
  JS_ASSIGN_STATIC_METHOD(runBlockQueue);
  JS_ASSIGN_STATIC_METHOD(javaScriptActionWithScriptDuration);
  JS_ASSIGN_STATIC_METHOD(customActionWithDurationActionBlock);
  JS_ASSIGN_STATIC_METHOD(playAudioSourceWaitForCompletion);
#if TODO
// SCNActionable
  JS_ASSIGN_PROTO_METHOD(runAction);
  JS_ASSIGN_PROTO_METHOD(runActionCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(runActionForKey);
  JS_ASSIGN_PROTO_METHOD(runActionForKeyCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(actionForKey);
  JS_ASSIGN_PROTO_METHOD(removeActionForKey);
  JS_ASSIGN_PROTO_METHOD(removeAllActions);
#endif
// SCNAction
  JS_ASSIGN_PROTO_METHOD(reversedAction);
#if TODO
// SCNActionable
  JS_ASSIGN_PROTO_PROP_READONLY(hasActions);
  JS_ASSIGN_PROTO_PROP_READONLY(actionKeys);
#endif
// SCNAction
  JS_ASSIGN_PROTO_PROP(duration);
  JS_ASSIGN_PROTO_PROP(timingMode);
  JS_ASSIGN_PROTO_PROP(timingFunction);
  JS_ASSIGN_PROTO_PROP(speed);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNAction, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNAction, NSObject);

NAN_METHOD(NSCNAction::New) {
  JS_RECONSTRUCT(SCNAction);
  @autoreleasepool {
    SCNAction* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNAction *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNAction alloc] init];
    }
    if (self) {
      NSCNAction *wrapper = new NSCNAction();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNAction::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSCNAction::moveByXYZDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, deltaX);
    declare_value(CGFloat, deltaY);
    declare_value(CGFloat, deltaZ);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SCNAction([SCNAction moveByX: deltaX y: deltaY z: deltaZ duration: duration]));
  }
}

NAN_METHOD(NSCNAction::moveByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, delta);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SCNAction([SCNAction moveBy: delta duration: duration]));
  }
}

NAN_METHOD(NSCNAction::moveToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector3, location);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SCNAction([SCNAction moveTo: location duration: duration]));
  }
}

NAN_METHOD(NSCNAction::rotateByXYZDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, xAngle);
    declare_value(CGFloat, yAngle);
    declare_value(CGFloat, zAngle);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SCNAction([SCNAction rotateByX: xAngle y: yAngle z: zAngle duration: duration]));
  }
}

NAN_METHOD(NSCNAction::rotateToXYZDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, xAngle);
    declare_value(CGFloat, yAngle);
    declare_value(CGFloat, zAngle);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SCNAction([SCNAction rotateToX: xAngle y: yAngle z: zAngle duration: duration]));
  }
}

NAN_METHOD(NSCNAction::rotateToXYZDurationShortestUnitArc) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, xAngle);
    declare_value(CGFloat, yAngle);
    declare_value(CGFloat, zAngle);
    declare_value(NSTimeInterval, duration);
    declare_value(BOOL, shortestUnitArc);
    JS_SET_RETURN(js_value_SCNAction([SCNAction rotateToX: xAngle y: yAngle z: zAngle duration: duration shortestUnitArc: shortestUnitArc]));
  }
}

NAN_METHOD(NSCNAction::rotateByAngleAroundAxisDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, angle);
    declare_value(SCNVector3, axis);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SCNAction([SCNAction rotateByAngle: angle aroundAxis: axis duration: duration]));
  }
}

NAN_METHOD(NSCNAction::rotateToAxisAngleDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNVector4, axisAngle);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SCNAction([SCNAction rotateToAxisAngle: axisAngle duration: duration]));
  }
}

NAN_METHOD(NSCNAction::scaleByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, scale);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SCNAction([SCNAction scaleBy: scale duration: sec]));
  }
}

NAN_METHOD(NSCNAction::scaleToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, scale);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SCNAction([SCNAction scaleTo: scale duration: sec]));
  }
}

NAN_METHOD(NSCNAction::sequence) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SCNAction*>, actions);
    JS_SET_RETURN(js_value_SCNAction([SCNAction sequence: actions]));
  }
}

NAN_METHOD(NSCNAction::group) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SCNAction*>, actions);
    JS_SET_RETURN(js_value_SCNAction([SCNAction group: actions]));
  }
}

NAN_METHOD(NSCNAction::repeatActionCount) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAction, action);
    declare_value(NSUInteger, count);
    JS_SET_RETURN(js_value_SCNAction([SCNAction repeatAction: action count: count]));
  }
}

NAN_METHOD(NSCNAction::repeatActionForever) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAction, action);
    JS_SET_RETURN(js_value_SCNAction([SCNAction repeatActionForever: action]));
  }
}

NAN_METHOD(NSCNAction::fadeInWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SCNAction([SCNAction fadeInWithDuration: sec]));
  }
}

NAN_METHOD(NSCNAction::fadeOutWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SCNAction([SCNAction fadeOutWithDuration: sec]));
  }
}

NAN_METHOD(NSCNAction::fadeOpacityByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, factor);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SCNAction([SCNAction fadeOpacityBy: factor duration: sec]));
  }
}

NAN_METHOD(NSCNAction::fadeOpacityToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, opacity);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SCNAction([SCNAction fadeOpacityTo: opacity duration: sec]));
  }
}

NAN_METHOD(NSCNAction::hide) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNAction([SCNAction hide]));
  }
}

NAN_METHOD(NSCNAction::unhide) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNAction([SCNAction unhide]));
  }
}

NAN_METHOD(NSCNAction::waitForDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SCNAction([SCNAction waitForDuration: sec]));
  }
}

NAN_METHOD(NSCNAction::waitForDurationWithRange) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, sec);
    declare_value(NSTimeInterval, durationRange);
    JS_SET_RETURN(js_value_SCNAction([SCNAction waitForDuration: sec withRange: durationRange]));
  }
}

NAN_METHOD(NSCNAction::removeFromParentNode) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNAction([SCNAction removeFromParentNode]));
  }
}

#include "NSCNNode.h"

NAN_METHOD(NSCNAction::runBlock) {
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    JS_SET_RETURN(js_value_SCNAction([SCNAction runBlock:^(SCNNode * _Nonnull node) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NSCNAction::runBlock",
            js_value_SCNNode(node));
        }
      });
    }]));
  }
}

#include "NDispatchQueue.h"

NAN_METHOD(NSCNAction::runBlockQueue) {
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    declare_value(dispatch_queue_t, queue);
    JS_SET_RETURN(js_value_SCNAction([SCNAction runBlock:^(SCNNode * _Nonnull node) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NSCNAction::runBlock",
            js_value_SCNNode(node));
        }
      });
    } queue: queue]));
  }
}

NAN_METHOD(NSCNAction::javaScriptActionWithScriptDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, script);
    declare_value(NSTimeInterval, seconds);
    JS_SET_RETURN(js_value_SCNAction([SCNAction javaScriptActionWithScript: script duration: seconds]));
  }
}

NAN_METHOD(NSCNAction::customActionWithDurationActionBlock) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, seconds);
    declare_callback(block);
    JS_SET_RETURN(js_value_SCNAction([SCNAction customActionWithDuration: seconds actionBlock:^(SCNNode * _Nonnull node, CGFloat elapsedTime) {
    }]));
  }
}

#include "NSCNAudioSource.h"

NAN_METHOD(NSCNAction::playAudioSourceWaitForCompletion) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAudioSource, source);
    declare_value(BOOL, wait);
    JS_SET_RETURN(js_value_SCNAction([SCNAction playAudioSource: source waitForCompletion: wait]));
  }
}

#if TODO
NAN_METHOD(NSCNActionable::runAction) {
  JS_UNWRAP(SCNActionable, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAction, action);
    [self runAction: action];
  }
}

NAN_METHOD(NSCNActionable::runActionCompletionHandler) {
  JS_UNWRAP(SCNActionable, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAction, action);
    declare_nullable_value(void-^-void, block);
    [self runAction: action completionHandler: block];
  }
}

NAN_METHOD(NSCNActionable::runActionForKey) {
  JS_UNWRAP(SCNActionable, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAction, action);
    declare_nullable_pointer(NSString, key);
    [self runAction: action forKey: key];
  }
}

NAN_METHOD(NSCNActionable::runActionForKeyCompletionHandler) {
  JS_UNWRAP(SCNActionable, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAction, action);
    declare_nullable_pointer(NSString, key);
    declare_nullable_value(void-^-void, block);
    [self runAction: action forKey: key completionHandler: block];
  }
}

NAN_METHOD(NSCNActionable::actionForKey) {
  JS_UNWRAP(SCNActionable, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_SCNAction([self actionForKey: key]));
  }
}

NAN_METHOD(NSCNActionable::removeActionForKey) {
  JS_UNWRAP(SCNActionable, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    [self removeActionForKey: key];
  }
}

NAN_METHOD(NSCNActionable::removeAllActions) {
  JS_UNWRAP(SCNActionable, self);
  declare_autoreleasepool {
    [self removeAllActions];
  }
}

NAN_GETTER(NSCNActionable::hasActionsGetter) {
  JS_UNWRAP(SCNActionable, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasActions]));
  }
}

NAN_GETTER(NSCNActionable::actionKeysGetter) {
  JS_UNWRAP(SCNActionable, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self actionKeys]));
  }
}
#endif

NAN_METHOD(NSCNAction::reversedAction) {
  JS_UNWRAP(SCNAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNAction([self reversedAction]));
  }
}

NAN_GETTER(NSCNAction::durationGetter) {
  JS_UNWRAP(SCNAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self duration]));
  }
}

NAN_SETTER(NSCNAction::durationSetter) {
  JS_UNWRAP(SCNAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setDuration: input];
  }
}

#include "NSceneKitTypes.h"

NAN_GETTER(NSCNAction::timingModeGetter) {
  JS_UNWRAP(SCNAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNActionTimingMode([self timingMode]));
  }
}

NAN_SETTER(NSCNAction::timingModeSetter) {
  JS_UNWRAP(SCNAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNActionTimingMode, input);
    [self setTimingMode: input];
  }
}

NAN_GETTER(NSCNAction::timingFunctionGetter) {
  JS_UNWRAP(SCNAction, self);
  declare_autoreleasepool {
    get_persistent_function(self, timingFunction, @"NSCNAction::timingFunction");
    if (timingFunction) {
      JS_SET_RETURN([timingFunction jsFunction]->Get());
    }
  }
}

NAN_SETTER(NSCNAction::timingFunctionSetter) {
  JS_UNWRAP(SCNAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(input, @"NSCNAction::timingFunction");
    [self setTimingFunction:^float(float time) {
      __block float result = 0.0f;
      dispatch_main(^{
        get_persistent_function(self, timingFunction, @"NSCNAction::timingFunction");
        if (timingFunction) {
          Local<Value> JS_RESULT([timingFunction jsFunction]->Call("NSCNAction::timingFunction",
            js_value_float(time)));
          if (is_value_float(JS_RESULT)) {
            result = to_value_float(JS_RESULT);
          } else {
            iOSLog0("Warning: Expected float result from NSCNAction::timingFunction callback");
          }
        }
      });
      return result;
    }];
  }
}

NAN_GETTER(NSCNAction::speedGetter) {
  JS_UNWRAP(SCNAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self speed]));
  }
}

NAN_SETTER(NSCNAction::speedSetter) {
  JS_UNWRAP(SCNAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpeed: input];
  }
}
