//
//  NSKLabelNode.h
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKLabelNode_h
#define NSKLabelNode_h

#include "NSKNode.h"

#define js_value_SKLabelNode(x) js_value_wrapper(x, SKLabelNode)
#define to_value_SKLabelNode(x) to_value_wrapper(x, SKLabelNode)
#define is_value_SKLabelNode(x) is_value_wrapper(x, SKLabelNode)

JS_WRAP_CLASS(SKLabelNode, SKNode);
  JS_PROP(text);
  JS_PROP(attributedText);
  JS_PROP(preferredMaxLayoutWidth);
  JS_PROP(numberOfLines);
  JS_PROP(fontName);
JS_WRAP_CLASS_END(SKLabelNode);


#endif /* NSKLabelNode_h */
