//
//  NGCController.mm
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGCController.h"

@import GameController;

#define instancetype GCController
#define js_value_instancetype js_value_GCController

NGCController::NGCController() {}
NGCController::~NGCController() {}

JS_INIT_CLASS(GCController, NSObject);
  JS_ASSIGN_STATIC_METHOD(controllers);
  JS_ASSIGN_STATIC_METHOD(startWirelessControllerDiscoveryWithCompletionHandler);
  JS_ASSIGN_STATIC_METHOD(stopWirelessControllerDiscovery);
  JS_ASSIGN_STATIC_METHOD(controllerWithMicroGamepad);
  JS_ASSIGN_STATIC_METHOD(controllerWithExtendedGamepad);
  JS_ASSIGN_PROTO_METHOD(capture);
  JS_ASSIGN_PROTO_PROP(controllerPausedHandler);
  JS_ASSIGN_PROTO_PROP(handlerQueue);
  JS_ASSIGN_PROTO_PROP_READONLY(vendorName);
  JS_ASSIGN_PROTO_PROP_READONLY(productCategory);
  JS_ASSIGN_PROTO_PROP_READONLY(isAttachedToDevice);
  JS_ASSIGN_PROTO_PROP_READONLY(isSnapshot);
  JS_ASSIGN_PROTO_PROP(playerIndex);
  JS_ASSIGN_PROTO_PROP_READONLY(gamepad);
  JS_ASSIGN_PROTO_PROP_READONLY(microGamepad);
  JS_ASSIGN_PROTO_PROP_READONLY(extendedGamepad);
  JS_ASSIGN_PROTO_PROP_READONLY(motion);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GCController, NSObject);
  // constant values (exports)

  /**
   Use these constants with NSNotificationCenter to listen to connection and disconnection events.
   
   Use GCControllerDidConnectNotification for observing connections of controllers.
   Use GCControllerDidDisconnectNotification for observing disconnections of controllers.
   
   Connections and disconnections of controllers will also be reflected in the controllers array
   of the GCController class.
   
   The 'object' property of the notification will contain the GCController that was connected or disconnected.
   For example:
   
   - (void)controllerDidConnect:(NSNotification *)note {
   
   GCController *controller = note.object;
   
   ....
   }
   
   @see NSNotificationCenter
   @see GCController.controllers
   */
  JS_ASSIGN_ENUM(GCControllerDidConnectNotification, NSString);
  JS_ASSIGN_ENUM(GCControllerDidDisconnectNotification, NSString);

  /**
   This is the player index that a connected controller will have if it has never been assigned a player index on the current system.
   Controllers retain the player index they have been assigned between game sessions, so if you wish to unset the player index of a
   controller set it back to this value.
   */
  //typedef NS_ENUM(NSInteger, GCControllerPlayerIndex) {
    JS_ASSIGN_ENUM(GCControllerPlayerIndexUnset, NSInteger); //  = -1,
    JS_ASSIGN_ENUM(GCControllerPlayerIndex1, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(GCControllerPlayerIndex2, NSInteger);
    JS_ASSIGN_ENUM(GCControllerPlayerIndex3, NSInteger);
    JS_ASSIGN_ENUM(GCControllerPlayerIndex4, NSInteger);
  //};

JS_INIT_CLASS_END(GCController, NSObject);

NAN_METHOD(NGCController::New) {
  JS_RECONSTRUCT(GCController);
  @autoreleasepool {
    GCController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge GCController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[GCController alloc] init];
    }
    if (self) {
      NGCController *wrapper = new NGCController();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GCController::New: invalid arguments");
    }
  }
}

NAN_METHOD(NGCController::controllers) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<GCController*>([GCController controllers]));
  }
}

NAN_METHOD(NGCController::startWirelessControllerDiscoveryWithCompletionHandler) {
  __weak id self = [GCController class];
  declare_autoreleasepool {
    declare_args();
    declare_persistent_function(completionHandler, @"NGCController::startWirelessControllerDiscoveryWithCompletionHandler");
    [GCController startWirelessControllerDiscoveryWithCompletionHandler: ^{
      dispatch_main(^{
        get_persistent_function(self, completionHandler, @"NGCController::startWirelessControllerDiscoveryWithCompletionHandler");
        if (completionHandler && [completionHandler jsFunction]) {
          [completionHandler jsFunction]->Call("NGCController::startWirelessControllerDiscoveryWithCompletionHandler");
        }
      });
    }];
  }
}

NAN_METHOD(NGCController::stopWirelessControllerDiscovery) {
  declare_autoreleasepool {
    [GCController stopWirelessControllerDiscovery];
  }
}

NAN_METHOD(NGCController::controllerWithMicroGamepad) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCController([GCController controllerWithMicroGamepad]));
  }
}

NAN_METHOD(NGCController::controllerWithExtendedGamepad) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCController([GCController controllerWithExtendedGamepad]));
  }
}

NAN_METHOD(NGCController::capture) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCController([self capture]));
  }
}

NAN_GETTER(NGCController::controllerPausedHandlerGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    get_persistent_function(self, handler, @"NGCController::controllerPausedHandler");
    if (handler && [handler jsFunction]) {
      JS_SET_RETURN([handler jsFunction]->Get());
    }
  }
}

NAN_SETTER(NGCController::controllerPausedHandlerSetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(input, @"NGCController::controllerPausedHandler");
    [self setControllerPausedHandler: ^(GCController* controller){
      dispatch_main(^{
        get_persistent_function(self, input, @"NGCController::controllerPausedHandler");
        if (input && [input jsFunction]) {
          [input jsFunction]->Call("NGCController::controllerPausedHandler",
            js_value_GCController(controller));
        }
      });
    }];
  }
}

#include "NDispatchQueue.h"

NAN_GETTER(NGCController::handlerQueueGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_dispatch_queue_t([self handlerQueue]));
  }
}

NAN_SETTER(NGCController::handlerQueueSetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(dispatch_queue_t, input);
    [self setHandlerQueue: input];
  }
}

NAN_GETTER(NGCController::vendorNameGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self vendorName]));
  }
}

NAN_GETTER(NGCController::productCategoryGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self productCategory]));
  }
}

NAN_GETTER(NGCController::isAttachedToDeviceGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAttachedToDevice]));
  }
}

NAN_GETTER(NGCController::isSnapshotGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSnapshot]));
  }
}

NAN_GETTER(NGCController::playerIndexGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCControllerPlayerIndex([self playerIndex]));
  }
}

NAN_SETTER(NGCController::playerIndexSetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(GCControllerPlayerIndex, input);
    [self setPlayerIndex: input];
  }
}

#define js_value_GCGamepad(x) js_value_wrapper_unknown(x, GCGamepad)
#define to_value_GCGamepad(x) to_value_wrapper_unknown(x, GCGamepad)
#define is_value_GCGamepad(x) is_value_wrapper_unknown(x, GCGamepad)

NAN_GETTER(NGCController::gamepadGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCGamepad([self gamepad]));
  }
}

#define js_value_GCMicroGamepad(x) js_value_wrapper_unknown(x, GCMicroGamepad)
#define to_value_GCMicroGamepad(x) to_value_wrapper_unknown(x, GCMicroGamepad)
#define is_value_GCMicroGamepad(x) is_value_wrapper_unknown(x, GCMicroGamepad)

NAN_GETTER(NGCController::microGamepadGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCMicroGamepad([self microGamepad]));
  }
}

#define js_value_GCExtendedGamepad(x) js_value_wrapper_unknown(x, GCExtendedGamepad)
#define to_value_GCExtendedGamepad(x) to_value_wrapper_unknown(x, GCExtendedGamepad)
#define is_value_GCExtendedGamepad(x) is_value_wrapper_unknown(x, GCExtendedGamepad)

NAN_GETTER(NGCController::extendedGamepadGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCExtendedGamepad([self extendedGamepad]));
  }
}

#define js_value_GCMotion(x) js_value_wrapper_unknown(x, GCMotion)
#define to_value_GCMotion(x) to_value_wrapper_unknown(x, GCMotion)
#define is_value_GCMotion(x) is_value_wrapper_unknown(x, GCMotion)

NAN_GETTER(NGCController::motionGetter) {
  JS_UNWRAP(GCController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GCMotion([self motion]));
  }
}
