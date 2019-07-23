//
//  NARSessionProviding.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSessionProviding_h
#define NARSessionProviding_h    

#include "NNSObject.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define js_value_ARSessionProviding(x) js_protocol_wrapper(x, ARSessionProviding)
#define to_value_ARSessionProviding(x) to_protocol_wrapper(x, ARSessionProviding)
#define is_value_ARSessionProviding(x) is_protocol_wrapper(x, ARSessionProviding)

JS_WRAP_PROTOCOL(ARSessionProviding, NSObject);
  JS_PROP_READONLY(session);
JS_WRAP_PROTOCOL_END(ARSessionProviding, NSObject);

#if __OBJC__
@interface ARSessionProvidingType : NSObject<ARSessionProviding>

@property (readonly) ARSession *session;

@end
#endif

#endif

#endif /* NARSessionProviding_h */
