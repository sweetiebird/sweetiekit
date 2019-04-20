//
//  libs_main.swift
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation


class LibsMain : NSObject
{
  class func Method(env: napi_env, info: napi_callback_info) -> napi_value {
  var world: napi_value?;
  
   var status = napi_create_string_utf8(env, "swift", 5, &world);
  return world!;

  }

/*  class func Method(env: OpaquePointer?, info: OpaquePointer?) -> OpaquePointer? {
  }*/

  @objc class func Init(env: napi_env, exports: napi_value) -> napi_value
  {
  //let m: @convention(c) (OpaquePointer?, OpaquePointer?) -> OpaquePointer? = LibsMain.Method
  
    var status: napi_status;
    
    status = nan_SetMethod(env, exports, "add",             { (env, info) -> OpaquePointer? in
  var status: napi_status;

  var argc = 2;
  var v: [napi_value?] = []
  while (v.count < argc) {
    v.insert(nil, at: v.count - 1)
  }
  status = napi_get_cb_info(env, info, &argc, &v, nil, nil);
  assert(status == napi_ok);
  var argv = v;

//})

  if (argc < 2) {
    napi_throw_type_error(env, nil, "Wrong number of arguments");
    return nil;
  }
  /*
  let uint8Pointer = UnsafeMutablePointer<napi_value?>.allocate(capacity: argc)
  uint8Pointer.initialize(from: &args, count: argc)
  var argv = uint8Pointer;*/
  //var argv = args;

  var valuetype0: napi_valuetype = napi_undefined;
  status = napi_typeof(env, argv[0], &valuetype0);
  assert(status == napi_ok);

  var valuetype1: napi_valuetype = napi_undefined;
  status = napi_typeof(env, argv[1], &valuetype1);
  assert(status == napi_ok);

  if (valuetype0 != napi_number || valuetype1 != napi_number) {
    napi_throw_type_error(env, nil, "Wrong arguments");
    return nil;
  }

  var value0: Double = 0.0;
  status = napi_get_value_double(env, argv[0], &value0);
  assert(status == napi_ok);

  var value1: Double = 0.0;
  status = napi_get_value_double(env, argv[1], &value1);
  assert(status == napi_ok);

  var sum: napi_value?;
  status = napi_create_double(env, value0 + value1, &sum);
  assert(status == napi_ok);

  return sum;

    });
  
     status = nan_SetMethod(env, exports, "hello",             { (env, info) -> OpaquePointer? in
/*
                // Extract pointer to `self` from void pointer:
                let mySelf = Unmanaged<YourClass>.fromOpaque(
                        COpaquePointer(observer)).takeUnretainedValue()
                // Call instance method:
                mySelf.callback(name as String)*/
                //return LibsMain.Method(env: env!, info: info!)
                 var world: napi_value?;
                 var s: String = LibsMain.self.debugDescription();
                 var status = napi_create_string_utf8(env, s, s.count, &world);
                 return world!;
            });/*
    (__builtin_expect(!(status == napi_ok), 0) ? __assert_rtn(__func__, "../hello.cc", 19, "status == napi_ok") : (void)0);
    return exports;*/
    return exports
  }
}
