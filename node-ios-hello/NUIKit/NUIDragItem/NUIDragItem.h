//
//  NUIDragItem.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDragItem_h
#define NUIDragItem_h    

#include "NNSObject.h"

#define js_value_UIDragItem(x) js_value_wrapper(x, UIDragItem)
#define to_value_UIDragItem(x) to_value_wrapper(x, UIDragItem)
#define is_value_UIDragItem(x) is_value_wrapper(x, UIDragItem)

JS_WRAP_CLASS(UIDragItem, NSObject);
  JS_METHOD(initWithItemProvider);
  JS_PROP_READONLY(itemProvider);
  JS_PROP(localObject);
  JS_PROP(previewProvider);
JS_WRAP_CLASS_END(UIDragItem);

#endif /* NUIDragItem_h */
