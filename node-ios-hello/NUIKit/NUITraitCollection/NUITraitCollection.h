//
//  NUITraitCollection.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITraitCollection_h
#define NUITraitCollection_h    

#include "NNSObject.h"

#define js_value_UITraitCollection(x) js_value_wrapper(x, UITraitCollection)
#define to_value_UITraitCollection(x) to_value_wrapper(x, UITraitCollection)
#define is_value_UITraitCollection(x) is_value_wrapper(x, UITraitCollection)

JS_WRAP_CLASS(UITraitCollection, NSObject);
JS_WRAP_CLASS_END(UITraitCollection);

#endif /* NUITraitCollection_h */
