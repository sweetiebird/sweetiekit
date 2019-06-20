//
//  NSNotificationCenter.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSNotificationCenter.h"
#include "NNSNotification.h"

NNSNotificationCenter::NNSNotificationCenter () {}
NNSNotificationCenter::~NNSNotificationCenter () {}

JS_INIT_CLASS(NSNotificationCenter, NSObject);
  JS_ASSIGN_PROTO_METHOD(addObserverSelectorNameObject);
  JS_ASSIGN_PROTO_METHOD(postNotification);
  JS_ASSIGN_PROTO_METHOD(postNotificationNameObject);
  JS_ASSIGN_PROTO_METHOD(postNotificationNameObjectUserInfo);
  JS_ASSIGN_PROTO_METHOD(removeObserver);
  JS_ASSIGN_PROTO_METHOD(removeObserverNameObject);
  JS_ASSIGN_PROTO_METHOD(addObserverForNameObjectQueueUsingBlock);
  JS_ASSIGN_STATIC_PROP_READONLY(defaultCenter);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSNotificationCenter, NSObject);
JS_INIT_CLASS_END(NSNotificationCenter, NSObject);

NAN_METHOD(NNSNotificationCenter::New) {
  JS_RECONSTRUCT(NSNotificationCenter);
  @autoreleasepool {
    NSNotificationCenter* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSNotificationCenter *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSNotificationCenter alloc] init];
    }
    if (self) {
      NNSNotificationCenter *wrapper = new NNSNotificationCenter();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSNotificationCenter::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSNotificationCenter::addObserverSelectorNameObject) {
  JS_UNWRAP(NSNotificationCenter, self);
  declare_autoreleasepool {
    declare_args();
    __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[JS_ARGC++]);
    SUITarget* target = [[SUITarget alloc] init];
    [target setCallbackClosure:^(id _Nullable sender) {
      dispatch_main(^{
        if (fn) {
          (*fn)("NNSNotificationCenter::addObserverSelectorNameObject");
        }
      });
    }];
    [target setDeinitClosure:^() {
      dispatch_main(^{
        if (fn) {
          delete fn; fn = nullptr;
          iOSLog0("NNSNotificationCenter::addObserverSelectorNameObject");
        }
      });
    }];
    SEL action([target callbackSelector]);
    declare_nullable_value(NSNotificationName, aName);
    declare_nullable_value(id, anObject);
    [self addObserver: target selector: action name: aName object: anObject];
    JS_SET_RETURN(js_value_id(target));
  }
}

NAN_METHOD(NNSNotificationCenter::postNotification) {
  JS_UNWRAP(NSNotificationCenter, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSNotification, notification);
    [self postNotification: notification];
  }
}

NAN_METHOD(NNSNotificationCenter::postNotificationNameObject) {
  JS_UNWRAP(NSNotificationCenter, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSNotificationName, aName);
    declare_nullable_value(id, anObject);
    [self postNotificationName: aName object: anObject];
  }
}

NAN_METHOD(NNSNotificationCenter::postNotificationNameObjectUserInfo) {
  JS_UNWRAP(NSNotificationCenter, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSNotificationName, aName);
    declare_nullable_value(id, anObject);
    declare_nullable_pointer(NSDictionary, aUserInfo);
    [self postNotificationName: aName object: anObject userInfo: aUserInfo];
  }
}

NAN_METHOD(NNSNotificationCenter::removeObserver) {
  JS_UNWRAP(NSNotificationCenter, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, observer);
    [self removeObserver: observer];
  }
}

NAN_METHOD(NNSNotificationCenter::removeObserverNameObject) {
  JS_UNWRAP(NSNotificationCenter, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, observer);
    declare_nullable_value(NSNotificationName, aName);
    declare_nullable_value(id, anObject);
    [self removeObserver: observer name: aName object: anObject];
  }
}

#include "NNSOperationQueue.h"

NAN_METHOD(NNSNotificationCenter::addObserverForNameObjectQueueUsingBlock) {
  JS_UNWRAP(NSNotificationCenter, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(NSNotificationName, name);
    declare_nullable_value(id, obj);
    declare_nullable_pointer(NSOperationQueue, queue);
    declare_callback(block);
    JS_SET_RETURN(js_value_id([self addObserverForName: name object: obj queue: queue usingBlock:^(NSNotification * _Nonnull note) {
      dispatch_main(^{
        
      });
    }]));
  }
}

NAN_GETTER(NNSNotificationCenter::defaultCenterGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNotificationCenter([NSNotificationCenter defaultCenter]));
  }
}
