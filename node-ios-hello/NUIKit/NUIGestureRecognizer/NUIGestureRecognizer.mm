//
//  UIGestureRecognizer.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIGestureRecognizer.h"

NUIGestureRecognizer::NUIGestureRecognizer() {}
NUIGestureRecognizer::~NUIGestureRecognizer() {}

JS_INIT_CLASS(UIGestureRecognizer, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, addTarget);
  JS_ASSIGN_METHOD(proto, addTargetAction);
  JS_ASSIGN_METHOD(proto, removeTargetAction);
  JS_ASSIGN_METHOD(proto, requireGestureRecognizerToFail);
  JS_ASSIGN_METHOD(proto, locationInView);
  JS_ASSIGN_METHOD(proto, locationOfTouchInView);
//  // UIGestureRecognizerDelegate
//  JS_ASSIGN_METHOD(proto, gestureRecognizerShouldBegin);
//  JS_ASSIGN_METHOD(proto, gestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizer);
//  JS_ASSIGN_METHOD(proto, gestureRecognizerShouldRequireFailureOfGestureRecognizer);
//  JS_ASSIGN_METHOD(proto, gestureRecognizerShouldBeRequiredToFailByGestureRecognizer);
//  JS_ASSIGN_METHOD(proto, gestureRecognizerShouldReceiveTouch);
//  JS_ASSIGN_METHOD(proto, gestureRecognizerShouldReceivePress);
  // UIGestureRecognizer
  JS_ASSIGN_PROP_READONLY(proto, state);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, enabled);
  JS_ASSIGN_PROP_READONLY(proto, view);
  JS_ASSIGN_PROP(proto, cancelsTouchesInView);
  JS_ASSIGN_PROP(proto, delaysTouchesBegan);
  JS_ASSIGN_PROP(proto, delaysTouchesEnded);
  JS_ASSIGN_PROP(proto, allowedTouchTypes);
  JS_ASSIGN_PROP(proto, allowedPressTypes);
  JS_ASSIGN_PROP(proto, requiresExclusiveTouchType);
  JS_ASSIGN_PROP_READONLY(proto, numberOfTouches);
  JS_ASSIGN_PROP(proto, name);
  // static members (ctor)
  JS_INIT_CTOR(UIGestureRecognizer, NSObject);
  JS_ASSIGN_METHOD(ctor, initWithTargetAction);
  // constants (exports)

  //typedef NS_ENUM(NSInteger, UIGestureRecognizerState) {
    JS_ASSIGN_ENUM(UIGestureRecognizerStatePossible, NSInteger);
    
    JS_ASSIGN_ENUM(UIGestureRecognizerStateBegan, NSInteger);
    JS_ASSIGN_ENUM(UIGestureRecognizerStateChanged, NSInteger);
    JS_ASSIGN_ENUM(UIGestureRecognizerStateEnded, NSInteger);
    JS_ASSIGN_ENUM(UIGestureRecognizerStateCancelled, NSInteger);
    
    JS_ASSIGN_ENUM(UIGestureRecognizerStateFailed, NSInteger);
    
    JS_ASSIGN_ENUM(UIGestureRecognizerStateRecognized, NSInteger); //  = UIGestureRecognizerStateEnded 
  //};

JS_INIT_CLASS_END(UIGestureRecognizer, NSObject);

NAN_METHOD(NUIGestureRecognizer::New) {
  JS_RECONSTRUCT(UIGestureRecognizer);

  Local<Object> obj = info.This();

  NUIGestureRecognizer *ui = new NUIGestureRecognizer();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIGestureRecognizer *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIGestureRecognizer alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIGestureRecognizer::addTarget) {
  Nan::EscapableHandleScope scope;

  NUIGestureRecognizer *ui = ObjectWrap::Unwrap<NUIGestureRecognizer>(Local<Object>::Cast(info.This()));

  __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[0]);

  SUITarget* target = [[SUITarget alloc] init];
  
  [target setCallbackClosure:^(id _Nullable) {
    Nan::HandleScope scope;
    (*fn)("NUIGestureRecognizer::addTarget");
  }];

  [target setDeinitClosure:^() {
    Nan::HandleScope scope;
    delete fn; fn = nullptr;
    iOSLog0("NUIGestureRecognizer fn deleted");
  }];

  UIGestureRecognizer *rec = ui->As<UIGestureRecognizer>();
  
  [rec addTarget:target action:[target callbackSelector]];
  
  [rec associateValue:target withKey:@"sweetiekit.nuigesturerecognizer.target"];

  ui->SetNSObject(rec);
}

NAN_METHOD(NUIGestureRecognizer::initWithTargetAction) {
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSObject, target);
    declare_pointer(NSString, selectorName);
    SEL action = NSSelectorFromString(selectorName);
    if (!action) {
      JS_PANIC("NSSelectorFromString returned nil for name %s", [selectorName UTF8String]);
    }
    JS_SET_RETURN(js_value_UIGestureRecognizer([[UIGestureRecognizer alloc] initWithTarget: target action: action]));
  }
}

NAN_METHOD(NUIGestureRecognizer::addTargetAction) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    declare_args();
        __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[JS_ARGC++]);
    SUITarget* target = [[SUITarget alloc] init];
    [target setCallbackClosure:^(id _Nullable sender) {
      dispatch_main(^{
        if (fn) {
          (*fn)("NUIGestureRecognizer::addTargetAction");
        }
      });
    }];
    [target setDeinitClosure:^() {
      dispatch_main(^{
        if (fn) {
          delete fn; fn = nullptr;
          iOSLog0("NUIGestureRecognizer::addTargetAction");
        }
      });
    }];
    SEL action([target callbackSelector]);
    [self addTarget: target action: action];
    JS_SET_RETURN(js_value_id(target));
  }
}

NAN_METHOD(NUIGestureRecognizer::removeTargetAction) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    declare_args();
        declare_value(id, target_);
    if (![target_ isKindOfClass:[SUITarget class]]) {
      js_panic_noreturn("expected SUITarget");
      return;
    }
    SUITarget* target = (SUITarget*)target_;
    SEL action([target callbackSelector]);
    [self removeTarget: target action: action];
    [target deinitClosure]();
  }
}

NAN_METHOD(NUIGestureRecognizer::requireGestureRecognizerToFail) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIGestureRecognizer, otherGestureRecognizer);
    JS_SET_RETURN(js_value_void([self requireGestureRecognizerToFail: otherGestureRecognizer]));
  }
}

#include "NUIView.h"

NAN_METHOD(NUIGestureRecognizer::locationInView) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self locationInView: view]));
  }
}

NAN_METHOD(NUIGestureRecognizer::locationOfTouchInView) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSUInteger, touchIndex);
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self locationOfTouch: touchIndex inView: view]));
  }
}
/*
NAN_METHOD(NUIGestureRecognizerDelegate::gestureRecognizerShouldBegin) {
  JS_UNWRAP(UIGestureRecognizerDelegate, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self gestureRecognizerShouldBegin: gestureRecognizer]));
  }
}

NAN_METHOD(NUIGestureRecognizerDelegate::gestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizer) {
  JS_UNWRAP(UIGestureRecognizerDelegate, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self gestureRecognizer: gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer: otherGestureRecognizer]));
  }
}

NAN_METHOD(NUIGestureRecognizerDelegate::gestureRecognizerShouldRequireFailureOfGestureRecognizer) {
  JS_UNWRAP(UIGestureRecognizerDelegate, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self gestureRecognizer: gestureRecognizer shouldRequireFailureOfGestureRecognizer: otherGestureRecognizer]));
  }
}

NAN_METHOD(NUIGestureRecognizerDelegate::gestureRecognizerShouldBeRequiredToFailByGestureRecognizer) {
  JS_UNWRAP(UIGestureRecognizerDelegate, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self gestureRecognizer: gestureRecognizer shouldBeRequiredToFailByGestureRecognizer: otherGestureRecognizer]));
  }
}

NAN_METHOD(NUIGestureRecognizerDelegate::gestureRecognizerShouldReceiveTouch) {
  JS_UNWRAP(UIGestureRecognizerDelegate, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self gestureRecognizer: gestureRecognizer shouldReceiveTouch: touch]));
  }
}

NAN_METHOD(NUIGestureRecognizerDelegate::gestureRecognizerShouldReceivePress) {
  JS_UNWRAP(UIGestureRecognizerDelegate, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self gestureRecognizer: gestureRecognizer shouldReceivePress: press]));
  }
}
*/

NAN_GETTER(NUIGestureRecognizer::stateGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIGestureRecognizerState([self state]));
  }
}

NAN_GETTER(NUIGestureRecognizer::delegateGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id/* <UIGestureRecognizerDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUIGestureRecognizer::delegateSetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    [self setDelegate: to_value_id/* <UIGestureRecognizerDelegate>*/(value)];
  }
}

NAN_GETTER(NUIGestureRecognizer::enabledGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NUIGestureRecognizer::enabledSetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    [self setEnabled: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIGestureRecognizer::viewGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIView([self view]));
  }
}

NAN_GETTER(NUIGestureRecognizer::cancelsTouchesInViewGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self cancelsTouchesInView]));
  }
}

NAN_SETTER(NUIGestureRecognizer::cancelsTouchesInViewSetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    [self setCancelsTouchesInView: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIGestureRecognizer::delaysTouchesBeganGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self delaysTouchesBegan]));
  }
}

NAN_SETTER(NUIGestureRecognizer::delaysTouchesBeganSetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    [self setDelaysTouchesBegan: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIGestureRecognizer::delaysTouchesEndedGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self delaysTouchesEnded]));
  }
}

NAN_SETTER(NUIGestureRecognizer::delaysTouchesEndedSetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    [self setDelaysTouchesEnded: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIGestureRecognizer::allowedTouchTypesGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self allowedTouchTypes]));
  }
}

NAN_SETTER(NUIGestureRecognizer::allowedTouchTypesSetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    [self setAllowedTouchTypes: to_value_NSArray<NSNumber*>(value)];
  }
}

NAN_GETTER(NUIGestureRecognizer::allowedPressTypesGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self allowedPressTypes]));
  }
}

NAN_SETTER(NUIGestureRecognizer::allowedPressTypesSetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    [self setAllowedPressTypes: to_value_NSArray<NSNumber*>(value)];
  }
}

NAN_GETTER(NUIGestureRecognizer::requiresExclusiveTouchTypeGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self requiresExclusiveTouchType]));
  }
}

NAN_SETTER(NUIGestureRecognizer::requiresExclusiveTouchTypeSetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    [self setRequiresExclusiveTouchType: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIGestureRecognizer::numberOfTouchesGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self numberOfTouches]));
  }
}

NAN_GETTER(NUIGestureRecognizer::nameGetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NUIGestureRecognizer::nameSetter) {
  JS_UNWRAP(UIGestureRecognizer, self);
  @autoreleasepool
  {
    [self setName: to_value_NSString(value)];
  }
}

