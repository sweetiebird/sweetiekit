//
//  NUITableViewDropProposal.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDropProposal_h
#define NUITableViewDropProposal_h    

#include "NUIDropProposal.h"

#define js_value_UITableViewDropProposal(x) js_value_wrapper(x, UITableViewDropProposal)
#define to_value_UITableViewDropProposal(x) to_value_wrapper(x, UITableViewDropProposal)
#define is_value_UITableViewDropProposal(x) is_value_wrapper(x, UITableViewDropProposal)

JS_WRAP_CLASS(UITableViewDropProposal, UIDropProposal);
  JS_METHOD(initWithDropOperationIntent);
  JS_PROP_READONLY(intent);
JS_WRAP_CLASS_END(UITableViewDropProposal);

#endif /* NUITableViewDropProposal_h */
