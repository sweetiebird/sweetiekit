//
//  NSKCameraNode.h
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKCameraNode_h
#define NSKCameraNode_h  

#include "NSKNode.h"

#define js_value_SKCameraNode(x) js_value_wrapper(x, SKCameraNode)
#define to_value_SKCameraNode(x) to_value_wrapper(x, SKCameraNode)
#define is_value_SKCameraNode(x) is_value_wrapper(x, SKCameraNode)

JS_WRAP_CLASS(SKCameraNode, SKNode);
JS_WRAP_CLASS_END(SKCameraNode);

#endif /* NSKCameraNode_h */
