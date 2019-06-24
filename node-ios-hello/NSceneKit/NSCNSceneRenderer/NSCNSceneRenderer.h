//
//  NSCNSceneRenderer.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNSceneRenderer_h
#define NSCNSceneRenderer_h    

#include "NNSObject.h"

#define js_value_SCNSceneRenderer(x) js_value_wrapper(x, SCNSceneRenderer)
#define to_value_SCNSceneRenderer(x) to_value_wrapper(x, SCNSceneRenderer)
#define is_value_SCNSceneRenderer(x) is_value_wrapper(x, SCNSceneRenderer)

#define js_value_SCNAntialiasingMode(x) JS_ENUM(SCNAntialiasingMode, NSUInteger, x)
#define to_value_SCNAntialiasingMode(x) TO_ENUM(SCNAntialiasingMode, NSUInteger, x)
#define is_value_SCNAntialiasingMode(x) IS_ENUM(SCNAntialiasingMode, NSUInteger, x)

#define js_value_SCNRenderingAPI(x) JS_ENUM(SCNRenderingAPI, NSUInteger, x)
#define to_value_SCNRenderingAPI(x) TO_ENUM(SCNRenderingAPI, NSUInteger, x)
#define is_value_SCNRenderingAPI(x) IS_ENUM(SCNRenderingAPI, NSUInteger, x)

#define js_value_SCNDebugOptions(x) JS_OPTS(SCNDebugOptions, NSUInteger, x)
#define to_value_SCNDebugOptions(x) TO_OPTS(SCNDebugOptions, NSUInteger, x)
#define is_value_SCNDebugOptions(x) IS_OPTS(SCNDebugOptions, NSUInteger, x)

JS_WRAP_PROTOCOL(SCNSceneRenderer, NSObject);
JS_WRAP_PROTOCOL_END(SCNSceneRenderer, NSObject);

#endif /* NSCNSceneRenderer_h */
