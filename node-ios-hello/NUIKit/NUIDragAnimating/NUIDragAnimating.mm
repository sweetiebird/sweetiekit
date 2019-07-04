//
//  NUIDragAnimating.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDragAnimating.h"

#define instancetype UIDragAnimating
#define js_value_instancetype js_value_UIDragAnimating

NUIDragAnimating::NUIDragAnimating() {}
NUIDragAnimating::~NUIDragAnimating() {}

JS_INIT_PROTOCOL(UIDragAnimating, NSObject);
  JS_ASSIGN_PROTO_PROP(addAnimations);
  JS_ASSIGN_PROTO_PROP(addCompletion);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDragAnimating, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(UIDragAnimating, NSObject);

NAN_METHOD(NUIDragAnimating::New) {
  JS_RECONSTRUCT_PROTOCOL(UIDragAnimating);
  @autoreleasepool {
    id<UIDragAnimating> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<UIDragAnimating>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<UIDragAnimating> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], UIDragAnimating, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[UIDragAnimatingType alloc] init];
    }
    if (self) {
      NUIDragAnimating *wrapper = new NUIDragAnimating();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDragAnimating::New: invalid arguments");
    }
  }
}

DELEGATE_PROTOCOL_PROP(UIDragAnimating, addAnimations);
DELEGATE_PROTOCOL_PROP(UIDragAnimating, addCompletion);

@implementation UIDragAnimatingType

/* Instances of UIDragAnimating provide you a way to animate your own changes
 * alongside the drag and drop system's animations.
 *
 * Animatable view properties that are set by the animation block will be
 * animated to their new values. 
 */
- (void)addAnimations:(void (^)(void))animations
{
  // TODO
}

- (void)addCompletion:(void (^)(UIViewAnimatingPosition finalPosition))completion
{
  // TODO
}

@end
