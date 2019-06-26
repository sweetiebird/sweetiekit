//
//  NCALayerDelegate.h
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCALayerDelegate_h
#define NCALayerDelegate_h    

#include "NNSObject.h"

#define js_value_CALayerDelegate(x) js_protocol_wrapper(x, CALayerDelegate)
#define to_value_CALayerDelegate(x) to_protocol_wrapper(x, CALayerDelegate)
#define is_value_CALayerDelegate(x) is_protocol_wrapper(x, CALayerDelegate)

JS_WRAP_PROTOCOL(CALayerDelegate, NSObject);
  JS_PROP(displayLayer);
  JS_PROP(drawLayerInContext);
  JS_PROP(layerWillDraw);
  JS_PROP(layoutSublayersOfLayer);
  JS_PROP(actionForLayerForKey);
JS_WRAP_PROTOCOL_END(CALayerDelegate, NSObject);

#if __OBJC__
@interface CALayerDelegateType : NSObject<CALayerDelegate>

/* If defined, called by the default implementation of the -display
 * method, in which case it should implement the entire display
 * process (typically by setting the `contents' property). */

- (void)displayLayer:(CALayer *)layer;

/* If defined, called by the default implementation of -drawInContext: */

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;

/* If defined, called by the default implementation of the -display method.
 * Allows the delegate to configure any layer state affecting contents prior
 * to -drawLayer:InContext: such as `contentsFormat' and `opaque'. It will not
 * be called if the delegate implements -displayLayer. */

- (void)layerWillDraw:(CALayer *)layer
  API_AVAILABLE(macos(10.12), ios(10.0), watchos(3.0), tvos(10.0));

/* Called by the default -layoutSublayers implementation before the layout
 * manager is checked. Note that if the delegate method is invoked, the
 * layout manager will be ignored. */

- (void)layoutSublayersOfLayer:(CALayer *)layer;

/* If defined, called by the default implementation of the
 * -actionForKey: method. Should return an object implementing the
 * CAAction protocol. May return 'nil' if the delegate doesn't specify
 * a behavior for the current event. Returning the null object (i.e.
 * '[NSNull null]') explicitly forces no further search. (I.e. the
 * +defaultActionForKey: method will not be called.) */

- (nullable id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event;

@end
#endif

#endif /* NCALayerDelegate_h */
