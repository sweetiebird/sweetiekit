//
//  NIOSurfaceRef.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NIOSurfaceRef_h
#define NIOSurfaceRef_h

#if !TARGET_OS_SIMULATOR

#include "NNSObject.h"

#if __OBJC__
#import <IOSurface/IOSurfaceRef.h>
#endif

Local<Value> js_value_IOSurfaceRef(IOSurfaceRef _Nullable value);
IOSurfaceRef _Nullable to_value_IOSurfaceRef(const Local<Value>& value, bool * _Nullable failed = nullptr);
bool is_value_IOSurfaceRef(const Local<Value>& value);

#endif

#endif /* NIOSurfaceRef_h */
