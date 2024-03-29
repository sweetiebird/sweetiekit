#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

function makeBindingSet(group, name, superClass, me) {
  const groupLoc = path.resolve(__dirname, '../../node-ios-hello', `N${group}`);
  const subLoc = path.resolve(groupLoc, `N${name}`);
  //console.log(groupLoc);
  try {
    fs.mkdirSync(groupLoc);
    //console.log(`made ${groupLoc}`);
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

#define instancetype ${name}
#define js_value_instancetype js_value_${name}

N${name}::N${name}() {}
N${name}::~N${name}() {}

JS_INIT_CLASS(${name}, ${superClass});
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(${name}, ${superClass});
  // constant values (exports)
JS_INIT_CLASS_END(${name}, ${superClass});

NAN_METHOD(N${name}::New) {
  JS_RECONSTRUCT(${name});
  @autoreleasepool {
    ${name}* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ${name} *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[${name} alloc] init];
    }
    if (self) {
      N${name} *wrapper = new N${name}();
      wrapper->set_self(self);
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

JS_WRAP_CLASS(${name}, ${superClass});
  // TODO: declare ${name} methods and properties
JS_WRAP_CLASS_END(${name});

#endif /* N${name}_h */`;

  const hPath = path.resolve(__dirname, '../../node-ios-hello', `N${group}`, `N${name}`, `N${name}.h`);
  const mPath = path.resolve(__dirname, '../../node-ios-hello', `N${group}`, `N${name}`, `N${name}.mm`);

  if (fs.existsSync(hPath)) {
    console.log(`file exists: ${hPath}`);
    process.exit(1);
    return;
  }

  if (fs.existsSync(mPath)) {
    console.log(`file exists: ${mPath}`);
    process.exit(1);
    return;
  }

  try {
    fs.writeFileSync(mPath, mData);
    fs.writeFileSync(hPath, hData);
    console.log(mPath);
    console.log(hPath);
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
