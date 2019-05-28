#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

function makeBindingSet(group, name, superClass, me) {
  const groupLoc = path.resolve(__dirname, '../../node-ios-hello', `N${group}`);
  const subLoc = path.resolve(groupLoc, `N${name}`);
  console.log(groupLoc);
  try {
    fs.mkdirSync(groupLoc);
    console.log(`made ${groupLoc}`);
  } catch (e) {
    // nothin
  }

  try {
    fs.mkdirSync(subLoc);
  } catch (e) {
    // nothin
  }

  const d = new Date();

  const mData = `//
//  ${name}.mm
//
//  Created by ${me} on ${d.toLocaleDateString()}.
//  Copyright © ${d.getFullYear()} sweetiebird. All rights reserved.
//
    
#include "N${name}.h"

Nan::Persistent<FunctionTemplate> N${name}::type;

N${name}::N${name} () {}
N${name}::~N${name} () {}

std::pair<Local<Object>, Local<FunctionTemplate>> N${name}::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(N${superClass}::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("${name}"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(N${name}::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    N${name} *ui = new N${name}();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge ${name} *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[${name} alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}
`;

  const hData = `//
//  N${name}.h
//
//  Created by ${me} on ${d.toLocaleDateString()}.
//  Copyright © ${d.getFullYear()} sweetiebird. All rights reserved.
//

#ifndef N${name}_h
#define N${name}_h    

#include "N${superClass}.h"

#define js_value_${name}(x) js_value_wrapper(x, ${name})
#define to_value_${name}(x) to_value_wrapper(x, ${name})

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(${name}, ${superClass});
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(${name});

#endif /* N${name}_h */`;

  const hPath = path.resolve(__dirname, '../../node-ios-hello', `N${group}`, `N${name}`, `N${name}.h`);
  const mPath = path.resolve(__dirname, '../../node-ios-hello', `N${group}`, `N${name}`, `N${name}.mm`);

  try {
    fs.writeFileSync(hPath, hData);
    fs.writeFileSync(mPath, mData);
    console.log(hPath);
    console.log(mPath);
    process.exit(0);
  } catch (e) {
    console.log('cant write');
    process.exit(1);
  }
}

const args = process.argv;

const group = args[2];
const name = args[3];
const superClass = args[4] || 'NSObject';
const me = args[5] !== undefined ? args[5] : process.env.USER_FULL_NAME;

makeBindingSet(group, name, superClass, me);
