//
//  NUITableViewCell.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUITableViewCell.h"
#include "NUILabel.h"

Nan::Persistent<FunctionTemplate> NUITableViewCell::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITableViewCell::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITableViewCell"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "textLabel", TextLabel);
  JS_SET_PROP_READONLY(proto, "detailTextLabel", DetailTextLabel);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITableViewCell::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUITableViewCell *ctrl = new NUITableViewCell();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UITableViewCell *)(info[0].As<External>()->Value()));
  } else {
#if 1
    @autoreleasepool {
      dispatch_async(dispatch_get_main_queue(), ^ {
        //auto cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
        auto cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
        //[cell initWithFrame:CGRectMake(0, 0, 300, 40)];
        ctrl->SetNSObject(cell);
      });
    }
#elif 1
    ctrl->SetNSObject([[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 300, 40)]);
#else
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          ctrl->SetNSObject([[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 300, 40)]);
      });
    }
#endif
  }
  ctrl->Wrap(ctrlObj);

  JS_SET_RETURN(ctrlObj);
}

NAN_GETTER(NUITableViewCell::TextLabelGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableViewCell, ui);
  
  __block UILabel* result = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      result = [ui textLabel];
    });
  }

  if (result != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)result)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(result, NUILabel::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      JS_SET_RETURN(value);
  }
}

NAN_GETTER(NUITableViewCell::DetailTextLabelGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableViewCell, ui);
  
  __block UILabel* result = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      result = [ui detailTextLabel];
    });
  }

  if (result != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)result)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(result, NUILabel::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      JS_SET_RETURN(value);
  }
}

NUITableViewCell::NUITableViewCell () {}
NUITableViewCell::~NUITableViewCell () {}
