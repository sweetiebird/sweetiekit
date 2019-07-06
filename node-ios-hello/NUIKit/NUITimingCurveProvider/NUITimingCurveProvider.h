//
//  NUITimingCurveProvider.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITimingCurveProvider_h
#define NUITimingCurveProvider_h    

#include "NNSObject.h"

#define js_value_UITimingCurveProvider(x) js_protocol_wrapper(x, UITimingCurveProvider)
#define to_value_UITimingCurveProvider(x) to_protocol_wrapper(x, UITimingCurveProvider)
#define is_value_UITimingCurveProvider(x) is_protocol_wrapper(x, UITimingCurveProvider)

#define js_value_UITimingCurveType(x) JS_ENUM(UITimingCurveType, NSInteger, x)
#define to_value_UITimingCurveType(x) TO_ENUM(UITimingCurveType, NSInteger, x)
#define is_value_UITimingCurveType(x) IS_ENUM(UITimingCurveType, NSInteger, x)

JS_WRAP_PROTOCOL(UITimingCurveProvider, NSObject);
  // TODO: declare UITimingCurveProvider methods and properties
JS_WRAP_PROTOCOL_END(UITimingCurveProvider, NSObject);

#if __OBJC__
@interface UITimingCurveProviderType : NSObject<UITimingCurveProvider>
@end
#endif

#endif /* NUITimingCurveProvider_h */
