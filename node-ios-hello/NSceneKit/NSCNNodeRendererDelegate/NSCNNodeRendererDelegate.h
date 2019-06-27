//
//  NSCNNodeRendererDelegate.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNNodeRendererDelegate_h
#define NSCNNodeRendererDelegate_h    

#include "NNSObject.h"

#define js_value_SCNNodeRendererDelegate(x) js_protocol_wrapper(x, SCNNodeRendererDelegate)
#define to_value_SCNNodeRendererDelegate(x) to_protocol_wrapper(x, SCNNodeRendererDelegate)
#define is_value_SCNNodeRendererDelegate(x) is_protocol_wrapper(x, SCNNodeRendererDelegate)

JS_WRAP_PROTOCOL(SCNNodeRendererDelegate, NSObject);
  JS_PROP(renderNodeRendererArguments);
JS_WRAP_PROTOCOL_END(SCNNodeRendererDelegate, NSObject);

#if __OBJC__
@interface SCNNodeRendererDelegateType : NSObject<SCNNodeRendererDelegate>

/*! 
 @method renderNode:renderer:arguments:
 @abstract Invoked when a node is rendered.
 @discussion The preferred way to customize the rendering is to tweak the material properties of the different materials of the node's geometry. SCNMaterial conforms to the SCNShadable protocol and allows for more advanced rendering using GLSL.
             You would typically use a renderer delegate with a node that has no geometry and only serves as a location in space. An example would be attaching a particle system to that node and render it with custom OpenGL code.
             Only drawing calls and the means to achieve them are supposed to be performed during the renderer delegate callback, any changes in the model (nodes, geometry...) would involve unexpected results.
 @param node The node to render.
 @param renderer The scene renderer to render into.
 @param arguments A dictionary whose values are SCNMatrix4 matrices wrapped in NSValue objects.
 */
- (void)renderNode:(SCNNode *)node renderer:(SCNRenderer *)renderer arguments:(NSDictionary<NSString *, id> *)arguments;

@end
#endif

#endif /* NSCNNodeRendererDelegate_h */
