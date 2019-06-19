//
//  NUIKeyCommand.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIKeyCommand.h"

#define instancetype UIKeyCommand
#define js_value_instancetype js_value_UIKeyCommand

NUIKeyCommand::NUIKeyCommand() {}
NUIKeyCommand::~NUIKeyCommand() {}

JS_INIT_CLASS(UIKeyCommand, NSObject);
  JS_ASSIGN_STATIC_METHOD(keyCommandWithInputModifierFlagsAction);
  JS_ASSIGN_STATIC_METHOD(keyCommandWithInputModifierFlagsActionDiscoverabilityTitle);
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_PROP_READONLY(input);
  JS_ASSIGN_PROTO_PROP_READONLY(modifierFlags);
  JS_ASSIGN_PROTO_PROP(discoverabilityTitle);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIKeyCommand, NSObject);
  // constant values (exports)

  //typedef NS_OPTIONS(NSInteger, UIKeyModifierFlags) {
    JS_ASSIGN_ENUM(UIKeyModifierAlphaShift, NSInteger); //      = 1 << 16,  
    JS_ASSIGN_ENUM(UIKeyModifierShift, NSInteger); //           = 1 << 17,
    JS_ASSIGN_ENUM(UIKeyModifierControl, NSInteger); //         = 1 << 18,
    JS_ASSIGN_ENUM(UIKeyModifierAlternate, NSInteger); //       = 1 << 19,
    JS_ASSIGN_ENUM(UIKeyModifierCommand, NSInteger); //         = 1 << 20,
    JS_ASSIGN_ENUM(UIKeyModifierNumericPad, NSInteger); //      = 1 << 21,
  //} NS_ENUM_AVAILABLE_IOS(7_0);

JS_INIT_CLASS_END(UIKeyCommand, NSObject);

NAN_METHOD(NUIKeyCommand::New) {
  JS_RECONSTRUCT(UIKeyCommand);
  @autoreleasepool {
    UIKeyCommand* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIKeyCommand *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIKeyCommand alloc] init];
    }
    if (self) {
      NUIKeyCommand *wrapper = new NUIKeyCommand();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIKeyCommand::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIKeyCommand::keyCommandWithInputModifierFlagsAction) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, input);
    declare_value(UIKeyModifierFlags, modifierFlags);
    __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[JS_ARGC++]);
    SUITarget* target = [[SUITarget alloc] init];
    [target setCallbackClosure:^(id _Nullable sender) {
      dispatch_main(^{
        if (fn) {
          (*fn)("NUIKeyCommand::keyCommandWithInputModifierFlagsAction");
        }
      });
    }];
    [target setDeinitClosure:^() {
      dispatch_main(^{
        if (fn) {
          delete fn; fn = nullptr;
          iOSLog0("NUIKeyCommand::keyCommandWithInputModifierFlagsAction::deinit");
        }
      });
    }];
    SEL action([target callbackSelector]);
    JS_SET_RETURN(js_value_UIKeyCommand([UIKeyCommand keyCommandWithInput: input modifierFlags: modifierFlags action: action]));
  }
}

NAN_METHOD(NUIKeyCommand::keyCommandWithInputModifierFlagsActionDiscoverabilityTitle) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, input);
    declare_value(UIKeyModifierFlags, modifierFlags);
    __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[JS_ARGC++]);
    SUITarget* target = [[SUITarget alloc] init];
    [target setCallbackClosure:^(id _Nullable sender) {
      dispatch_main(^{
        if (fn) {
          (*fn)("NUIKeyCommand::keyCommandWithInputModifierFlagsActionDiscoverabilityTitle");
        }
      });
    }];
    [target setDeinitClosure:^() {
      dispatch_main(^{
        if (fn) {
          delete fn; fn = nullptr;
          iOSLog0("NUIKeyCommand::keyCommandWithInputModifierFlagsActionDiscoverabilityTitle::deinit");
        }
      });
    }];
    SEL action([target callbackSelector]);
    declare_pointer(NSString, discoverabilityTitle);
    JS_SET_RETURN(js_value_UIKeyCommand([UIKeyCommand keyCommandWithInput: input modifierFlags: modifierFlags action: action discoverabilityTitle: discoverabilityTitle]));
  }
}

NAN_METHOD(NUIKeyCommand::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[UIKeyCommand alloc] init]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUIKeyCommand::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UIKeyCommand, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_GETTER(NUIKeyCommand::inputGetter) {
  JS_UNWRAP(UIKeyCommand, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self input]));
  }
}

NAN_GETTER(NUIKeyCommand::modifierFlagsGetter) {
  JS_UNWRAP(UIKeyCommand, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIKeyModifierFlags([self modifierFlags]));
  }
}

NAN_GETTER(NUIKeyCommand::discoverabilityTitleGetter) {
  JS_UNWRAP(UIKeyCommand, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self discoverabilityTitle]));
  }
}

NAN_SETTER(NUIKeyCommand::discoverabilityTitleSetter) {
  JS_UNWRAP(UIKeyCommand, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setDiscoverabilityTitle: input];
  }
}
