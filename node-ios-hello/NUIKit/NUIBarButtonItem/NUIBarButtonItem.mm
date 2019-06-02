//
//  NUIToolbar.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUIBarButtonItem.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIBarButtonItem::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIBarButtonItem::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIBarButtonItem"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, title);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIBarButtonItem::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIBarButtonItem *ui = new NUIBarButtonItem();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIBarButtonItem *)(info[0].As<External>()->Value()));
  } else if (info[0]->IsString() && info.Length() == 1) {
    @autoreleasepool {
      NSString *title = NJSStringToNSString(info[0]);
      // whatever[action]
      ui->SetNSObject([[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:nullptr action:nullptr]);
    }
  } else if (info[0]->IsString() && info.Length() >= 2) {
    @autoreleasepool {
      NSString *title = NJSStringToNSString(info[0]);
      
      __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[1]);

      SUITarget* target = [[SUITarget alloc] init];
      
      [target setCallbackClosure:^(id _Nullable) {
        Nan::HandleScope scope;
        (*fn)("NUIBarButtonItem::New");
      }];
      [target setDeinitClosure:^() {
        Nan::HandleScope scope;
        delete fn; fn = nullptr;
        iOSLog0("fn deleted");
      }];

      UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:[target callbackSelector]];
      
      [item associateValue:target withKey:@"sweetiekit.uibarbutton.target"];
      
      ui->SetNSObject(item);
    }
  } else if (info.Length() == 0) {
    @autoreleasepool {
      ui->SetNSObject([[UIBarButtonItem alloc] init]);
    }
  } else {
    Nan::ThrowError("Invalid args: UIBarButtonItem init");
  }

  ui->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NUIBarButtonItem::NUIBarButtonItem () {}
NUIBarButtonItem::~NUIBarButtonItem () {}

NAN_GETTER(NUIBarButtonItem::titleGetter) {
  Nan::HandleScope scope;

  NUIBarButtonItem *view = ObjectWrap::Unwrap<NUIBarButtonItem>(info.This());
  __block NSString* str = nullptr;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      str = [view->As<UIBarButtonItem>() title];
    });
  }

  if (str != nullptr) {
    auto result = JS_STR([str UTF8String]);
    info.GetReturnValue().Set(result);
  }
  
}

NAN_SETTER(NUIBarButtonItem::titleSetter) {
  Nan::HandleScope scope;

  NUIBarButtonItem *btn = ObjectWrap::Unwrap<NUIBarButtonItem>(info.This());

  std::string title;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    title = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [btn->As<UIBarButtonItem>() setTitle:[NSString stringWithUTF8String:title.c_str()]];
    });
  }
}
