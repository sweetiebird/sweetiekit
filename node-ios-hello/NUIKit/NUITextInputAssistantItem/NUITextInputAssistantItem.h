//
//  NUITextInputAssistantItem.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextInputAssistantItem_h
#define NUITextInputAssistantItem_h    

#include "NNSObject.h"

#define js_value_UITextInputAssistantItem(x) js_value_wrapper(x, UITextInputAssistantItem)
#define to_value_UITextInputAssistantItem(x) to_value_wrapper(x, UITextInputAssistantItem)
#define is_value_UITextInputAssistantItem(x) is_value_wrapper(x, UITextInputAssistantItem)

JS_WRAP_CLASS(UITextInputAssistantItem, NSObject);
  // TODO: declare UITextInputAssistantItem methods and properties
JS_WRAP_CLASS_END(UITextInputAssistantItem);

#endif /* NUITextInputAssistantItem_h */