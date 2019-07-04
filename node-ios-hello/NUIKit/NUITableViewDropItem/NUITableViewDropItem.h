//
//  NUITableViewDropItem.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDropItem_h
#define NUITableViewDropItem_h    

#include "NNSObject.h"

#define js_value_UITableViewDropItem(x) js_protocol_wrapper(x, UITableViewDropItem)
#define to_value_UITableViewDropItem(x) to_protocol_wrapper(x, UITableViewDropItem)
#define is_value_UITableViewDropItem(x) is_protocol_wrapper(x, UITableViewDropItem)

JS_WRAP_PROTOCOL(UITableViewDropItem, NSObject);
  JS_PROP_READONLY(dragItem);
  JS_PROP_READONLY(sourceIndexPath);
  JS_PROP_READONLY(previewSize);
JS_WRAP_PROTOCOL_END(UITableViewDropItem, NSObject);

#if __OBJC__
@interface UITableViewDropItemType : NSObject<UITableViewDropItem>
@end
#endif

#endif /* NUITableViewDropItem_h */
