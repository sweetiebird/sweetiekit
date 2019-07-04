//
//  NUIDragAnimating.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDragAnimating_h
#define NUIDragAnimating_h    

#include "NNSObject.h"

#define js_value_UIDragAnimating(x) js_protocol_wrapper(x, UIDragAnimating)
#define to_value_UIDragAnimating(x) to_protocol_wrapper(x, UIDragAnimating)
#define is_value_UIDragAnimating(x) is_protocol_wrapper(x, UIDragAnimating)

JS_WRAP_PROTOCOL(UIDragAnimating, NSObject);
  JS_PROP(addAnimations);
  JS_PROP(addCompletion);
JS_WRAP_PROTOCOL_END(UIDragAnimating, NSObject);

#if __OBJC__
@interface UIDragAnimatingType : NSObject<UIDragAnimating>

/* Instances of UIDragAnimating provide you a way to animate your own changes
 * alongside the drag and drop system's animations.
 *
 * Animatable view properties that are set by the animation block will be
 * animated to their new values. 
 */
- (void)addAnimations:(void (^)(void))animations;
- (void)addCompletion:(void (^)(UIViewAnimatingPosition finalPosition))completion;

@end
#endif

#endif /* NUIDragAnimating_h */
