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
//  N${name}.mm
//
//  Created by ${me} on ${d.toLocaleDateString()}.
//  Copyright © ${d.getFullYear()} sweetiebird. All rights reserved.
//
#include "N${name}.h"

N${name}::N${name}() {}
N${name}::~N${name}() {}

JS_INIT_CLASS(${name}, ${superClass});
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(${name}, ${superClass});
JS_INIT_CLASS_END(${name}, ${superClass});

NAN_METHOD(N${name}::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function '${name}(...)', turn into construct call.
      JS_SET_RETURN_NEW(${name}, info);
      return;
    }

    ${name}* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge ${name} *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[${name} alloc] init];
    }
    if (self) {
      N${name} *wrapper = new N${name}();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("${name}::New: invalid arguments");
    }
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
#define is_value_${name}(x) is_value_wrapper(x, ${name})

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

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

if (args.length < 4) {
  console.log("  makeBindingSet <group> <name> [<superclass>] [<process.env.USER_FULL_NAME>]");
} else {
  const group = args[2];
  const name = args[3];
  const superClass = args[4] || 'NSObject';
  const me = args[5] !== undefined ? args[5] : process.env.USER_FULL_NAME;

  makeBindingSet(group, name, superClass, me);
}
