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

JS_INIT_GLOBALS(${name});
  // global values (exports)
JS_INIT_GLOBALS_END(${name});
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

JS_WRAP_GLOBALS(${name});
  // TODO: declare ${name} globals
JS_WRAP_GLOBALS_END(${name});

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
