//
//  SKAction.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NSKAction.h"

Nan::Persistent<FunctionTemplate> NSKAction::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKAction::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKAction"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "moveTo", moveTo);
  Nan::SetMethod(ctorFn, "removeFromParent", removeFromParent);
  Nan::SetMethod(ctorFn, "sequence", sequence);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKAction::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKAction *ui = new NSKAction();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKAction *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKAction alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NSKAction::NSKAction () {}
NSKAction::~NSKAction () {}

// creates an action that will move to a point over time
NAN_METHOD(NSKAction::moveTo) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NSKAction)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NSKAction *action = ObjectWrap::Unwrap<NSKAction>(obj);

  @autoreleasepool {
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
    double dur = TO_DOUBLE(info[1]);
    action->SetNSObject([SKAction moveTo:CGPointMake(x, y) duration:dur]);
  }

  JS_SET_RETURN(obj);
}

// creates an action that removes a node from its parent
NAN_METHOD(NSKAction::removeFromParent) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NSKAction)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NSKAction *action = ObjectWrap::Unwrap<NSKAction>(obj);

  @autoreleasepool {
    action->SetNSObject([SKAction removeFromParent]);
  }

  JS_SET_RETURN(obj);
}

// creates an action that runs a collection of actions sequentially
NAN_METHOD(NSKAction::sequence) {
  Nan::EscapableHandleScope scope;
  
  Local<Array> array = Local<Array>::Cast(info[0]);
  NSMutableArray *actions = [NSMutableArray array];

  for (unsigned int i = 0; i < array->Length(); i++ ) {
    if (Nan::Has(array, i).FromJust()) {
      NSKAction *action = ObjectWrap::Unwrap<NSKAction>(JS_OBJ(array->Get(i)));
      [actions addObject:action->As<SKAction>()];
    }
  }

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NSKAction)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NSKAction *action = ObjectWrap::Unwrap<NSKAction>(obj);

  @autoreleasepool {
    action->SetNSObject([SKAction sequence:actions]);
  }

  JS_SET_RETURN(obj);
}
