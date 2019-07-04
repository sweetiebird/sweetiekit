//
//  NUIContextualAction.mm
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIContextualAction.h"

#define instancetype UIContextualAction
#define js_value_instancetype js_value_UIContextualAction

NUIContextualAction::NUIContextualAction() {}
NUIContextualAction::~NUIContextualAction() {}

JS_INIT_CLASS(UIContextualAction, NSObject);
  JS_ASSIGN_STATIC_METHOD(contextualActionWithStyleTitleHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(style);
  JS_ASSIGN_PROTO_PROP_READONLY(handler);
  JS_ASSIGN_PROTO_PROP(title);
  JS_ASSIGN_PROTO_PROP(backgroundColor);
  JS_ASSIGN_PROTO_PROP(image);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIContextualAction, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, UIContextualActionStyle) {
    JS_ASSIGN_ENUM(UIContextualActionStyleNormal, NSInteger);
    JS_ASSIGN_ENUM(UIContextualActionStyleDestructive, NSInteger);
  //} NS_SWIFT_NAME(UIContextualAction.Style) API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos);

JS_INIT_CLASS_END(UIContextualAction, NSObject);

NAN_METHOD(NUIContextualAction::New) {
  JS_RECONSTRUCT(UIContextualAction);
  @autoreleasepool {
    UIContextualAction* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIContextualAction *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIContextualAction alloc] init];
    }
    if (self) {
      NUIContextualAction *wrapper = new NUIContextualAction();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIContextualAction::New: invalid arguments");
    }
  }
}

#include "NUIView.h"

NAN_METHOD(NUIContextualAction::contextualActionWithStyleTitleHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIContextualActionStyle, style);
    declare_nullable_pointer(NSString, title);
    declare_callback(handler);
    JS_SET_RETURN(js_value_instancetype([UIContextualAction contextualActionWithStyle: style title: title handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
      dispatch_main(^{
        if (handler) {
          Local<Value> jsCompletionHandler(sweetiekit::FromBlock("NUIContextualAction::contextualActionWithStyleTitleHandler::completionHandler", ^(JSInfo info) {
            declare_args();
            declare_value(BOOL, wasActionPerformed);
            completionHandler(wasActionPerformed);
          }));
          [handler jsFunction]->Call("NUIContextualAction::contextualActionWithStyleTitleHandler",
            js_value_UIContextualAction(action),
            js_value_UIView(sourceView),
            jsCompletionHandler);
        }
      });
    }]));
  }
}

NAN_GETTER(NUIContextualAction::styleGetter) {
  JS_UNWRAP(UIContextualAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIContextualActionStyle([self style]));
  }
}

NAN_GETTER(NUIContextualAction::handlerGetter) {
  JS_UNWRAP(UIContextualAction, self);
  declare_autoreleasepool {
    JS_TODO();
#if TODO
    JS_SET_RETURN(js_value_UIContextualActionHandler([self handler]));
#endif
  }
}

NAN_GETTER(NUIContextualAction::titleGetter) {
  JS_UNWRAP(UIContextualAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_SETTER(NUIContextualAction::titleSetter) {
  JS_UNWRAP(UIContextualAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setTitle: input];
  }
}

NAN_GETTER(NUIContextualAction::backgroundColorGetter) {
  JS_UNWRAP(UIContextualAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self backgroundColor]));
  }
}

NAN_SETTER(NUIContextualAction::backgroundColorSetter) {
  JS_UNWRAP(UIContextualAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setBackgroundColor: input];
  }
}

#include "NUIImage.h"

NAN_GETTER(NUIContextualAction::imageGetter) {
  JS_UNWRAP(UIContextualAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self image]));
  }
}

NAN_SETTER(NUIContextualAction::imageSetter) {
  JS_UNWRAP(UIContextualAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setImage: input];
  }
}
