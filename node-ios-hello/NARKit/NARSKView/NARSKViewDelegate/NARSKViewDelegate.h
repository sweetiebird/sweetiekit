//
//  NARSKViewDelegate.h
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSKViewDelegate_h
#define NARSKViewDelegate_h

#include "NNSObject.h"

#define js_value_ARSKViewDelegate(x) js_value_wrapper(x, ARSKViewDelegate)
#define to_value_ARSKViewDelegate(x) to_value_wrapper(x, ARSKViewDelegate)
#define is_value_ARSKViewDelegate(x) is_value_wrapper(x, ARSKViewDelegate)

JS_WRAP_CLASS(ARSKViewDelegate, NSObject);
  JS_PROP(viewNodeForAnchor);
  JS_PROP(viewDidAddNodeForAnchor);
  JS_PROP(viewWillUpdateNodeForAnchor);
  JS_PROP(viewDidUpdateNodeForAnchor);
  JS_PROP(viewDidRemoveNodeForAnchor);
JS_WRAP_CLASS_END(ARSKViewDelegate);

#if __OBJC__
@interface ARSKViewDelegate : NSObject<ARSKViewDelegate>
/**
 Implement this to provide a custom node for the given anchor.
 
 @discussion This node will automatically be added to the scene graph.
 If this method is not implemented, a node will be automatically created.
 If nil is returned the anchor will be ignored.
 @param view The view that will render the scene.
 @param anchor The added anchor.
 @return Node that will be mapped to the anchor or nil.
 */
- (nullable SKNode *)view:(ARSKView *)view nodeForAnchor:(ARAnchor *)anchor;

/**
 Called when a new node has been mapped to the given anchor.
 
 @param view The view that will render the scene.
 @param node The node that maps to the anchor.
 @param anchor The added anchor.
 */
- (void)view:(ARSKView *)view didAddNode:(SKNode *)node forAnchor:(ARAnchor *)anchor;

/**
 Called when a node will be updated with data from the given anchor.
 
 @param view The view that will render the scene.
 @param node The node that will be updated.
 @param anchor The anchor that was updated.
 */
- (void)view:(ARSKView *)view willUpdateNode:(SKNode *)node forAnchor:(ARAnchor *)anchor;

/**
 Called when a node has been updated with data from the given anchor.
 
 @param view The view that will render the scene.
 @param node The node that was updated.
 @param anchor The anchor that was updated.
 */
- (void)view:(ARSKView *)view didUpdateNode:(SKNode *)node forAnchor:(ARAnchor *)anchor;

/**
 Called when a mapped node has been removed from the scene graph for the given anchor.
 
 @param view The view that will render the scene.
 @param node The node that was removed.
 @param anchor The anchor that was removed.
 */
- (void)view:(ARSKView *)view didRemoveNode:(SKNode *)node forAnchor:(ARAnchor *)anchor;
@end
#endif

#endif /* NARSKViewDelegate_h */
