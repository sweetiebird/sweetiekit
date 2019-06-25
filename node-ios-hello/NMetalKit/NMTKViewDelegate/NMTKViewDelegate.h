//
//  NMTKViewDelegate.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTKViewDelegate_h
#define NMTKViewDelegate_h    

#include "NNSObject.h"

#define js_value_MTKViewDelegate(x) js_protocol_wrapper(x, MTKViewDelegate)
#define to_value_MTKViewDelegate(x) to_protocol_wrapper(x, MTKViewDelegate)
#define is_value_MTKViewDelegate(x) is_protocol_wrapper(x, MTKViewDelegate)

JS_WRAP_PROTOCOL(MTKViewDelegate, NSObject);
  JS_PROP(mtkViewDrawableSizeWillChange);
  JS_PROP(drawInMTKView);
JS_WRAP_PROTOCOL_END(MTKViewDelegate, NSObject);

#if __OBJC__
@interface MTKViewDelegateType : NSObject<MTKViewDelegate>

- (void)mtkView:(nonnull MTKView *)view drawableSizeWillChange:(CGSize)size;

- (void)drawInMTKView:(nonnull MTKView *)view;

@end
#endif

#endif /* NMTKViewDelegate_h */
