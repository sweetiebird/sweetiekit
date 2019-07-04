//
//  NUIDropProposal.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDropProposal_h
#define NUIDropProposal_h    

#include "NNSObject.h"

#define js_value_UIDropProposal(x) js_value_wrapper(x, UIDropProposal)
#define to_value_UIDropProposal(x) to_value_wrapper(x, UIDropProposal)
#define is_value_UIDropProposal(x) is_value_wrapper(x, UIDropProposal)

JS_WRAP_CLASS(UIDropProposal, NSObject);
  JS_METHOD(initWithDropOperation);
  JS_PROP_READONLY(operation);
  JS_PROP(isPrecise);
  JS_PROP(prefersFullSizePreview);
JS_WRAP_CLASS_END(UIDropProposal);

#endif /* NUIDropProposal_h */
