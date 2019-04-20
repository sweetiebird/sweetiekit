//
//  libs_main.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef libs_main_h
#define libs_main_h

#import <UIKit/UIKit.h>

#include <node_api.h>

static napi_status nan_SetMethod(napi_env env, napi_value exports, const char* name, napi_callback method)
{
  napi_property_descriptor desc = { name, 0, method, 0, 0, 0, napi_default, 0 };
  return napi_define_properties(env, exports, 1, &desc);
}

#endif /* libs_main_h */
