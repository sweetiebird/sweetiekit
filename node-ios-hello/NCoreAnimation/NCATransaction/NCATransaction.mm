//
//  NCATransaction.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCATransaction.h"

#define instancetype CATransaction
#define js_value_instancetype js_value_CATransaction

NCATransaction::NCATransaction() {}
NCATransaction::~NCATransaction() {}

JS_INIT_CLASS(CATransaction, NSObject);
  JS_ASSIGN_STATIC_METHOD(begin);
  JS_ASSIGN_STATIC_METHOD(commit);
  JS_ASSIGN_STATIC_METHOD(flush);
  JS_ASSIGN_STATIC_METHOD(lock);
  JS_ASSIGN_STATIC_METHOD(unlock);
  JS_ASSIGN_STATIC_METHOD(animationDuration);
  JS_ASSIGN_STATIC_METHOD(setAnimationDuration);
  JS_ASSIGN_STATIC_METHOD(animationTimingFunction);
  JS_ASSIGN_STATIC_METHOD(setAnimationTimingFunction);
  JS_ASSIGN_STATIC_METHOD(disableActions);
  JS_ASSIGN_STATIC_METHOD(setDisableActions);
  JS_ASSIGN_STATIC_METHOD(completionBlock);
  JS_ASSIGN_STATIC_METHOD(setCompletionBlock);
  JS_ASSIGN_STATIC_METHOD(valueForKey);
  JS_ASSIGN_STATIC_METHOD(setValueForKey);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CATransaction, NSObject);
  // constant values (exports)

  JS_ASSIGN_ENUM(kCATransactionAnimationDuration, NSString);
  JS_ASSIGN_ENUM(kCATransactionDisableActions, NSString);
  JS_ASSIGN_ENUM(kCATransactionAnimationTimingFunction, NSString);
  JS_ASSIGN_ENUM(kCATransactionCompletionBlock, NSString);

JS_INIT_CLASS_END(CATransaction, NSObject);

NAN_METHOD(NCATransaction::New) {
  JS_RECONSTRUCT(CATransaction);
  @autoreleasepool {
    CATransaction* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CATransaction *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CATransaction alloc] init];
    }
    if (self) {
      NCATransaction *wrapper = new NCATransaction();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CATransaction::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCATransaction::begin) {
  declare_autoreleasepool {
    [CATransaction begin];
  }
}

NAN_METHOD(NCATransaction::commit) {
  declare_autoreleasepool {
    [CATransaction commit];
  }
}

NAN_METHOD(NCATransaction::flush) {
  declare_autoreleasepool {
    [CATransaction flush];
  }
}

NAN_METHOD(NCATransaction::lock) {
  declare_autoreleasepool {
    [CATransaction lock];
  }
}

NAN_METHOD(NCATransaction::unlock) {
  declare_autoreleasepool {
    [CATransaction unlock];
  }
}

NAN_METHOD(NCATransaction::animationDuration) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([CATransaction animationDuration]));
  }
}

NAN_METHOD(NCATransaction::setAnimationDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CFTimeInterval, dur);
    [CATransaction setAnimationDuration: dur];
  }
}

#include "NCAMediaTimingFunction.h"

NAN_METHOD(NCATransaction::animationTimingFunction) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAMediaTimingFunction([CATransaction animationTimingFunction]));
  }
}

NAN_METHOD(NCATransaction::setAnimationTimingFunction) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(CAMediaTimingFunction, function);
    [CATransaction setAnimationTimingFunction: function];
  }
}

NAN_METHOD(NCATransaction::disableActions) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([CATransaction disableActions]));
  }
}

NAN_METHOD(NCATransaction::setDisableActions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, flag);
    [CATransaction setDisableActions: flag];
  }
}

NAN_METHOD(NCATransaction::completionBlock) {
  __weak id self = [CATransaction class];
  declare_autoreleasepool {
    get_persistent_function(self, block, @"NCATransaction::setCompletionBlock");
    if (block) {
      JS_SET_RETURN([block jsFunction]->Get());
    }
  }
}

NAN_METHOD(NCATransaction::setCompletionBlock) {
  __weak id self = [CATransaction class];
  declare_autoreleasepool {
    declare_args();
    declare_persistent_function(block, @"NCATransaction::setCompletionBlock");
    [CATransaction setCompletionBlock: ^{
      dispatch_main(^{
        get_persistent_function(self, block, @"NCATransaction::setCompletionBlock");
        if (block) {
          [block jsFunction]->Call("NCATransaction::setCompletionBlock");
        }
      });
    }];
  }
}

NAN_METHOD(NCATransaction::valueForKey) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([CATransaction valueForKey: key]));
  }
}

NAN_METHOD(NCATransaction::setValueForKey) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, anObject);
    declare_pointer(NSString, key);
    [CATransaction setValue: anObject forKey: key];
  }
}

