//
//  NUICollectionViewFlowLayoutInvalidationContext.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewFlowLayoutInvalidationContext_h
#define NUICollectionViewFlowLayoutInvalidationContext_h    

#include "NUICollectionViewLayoutInvalidationContext.h"

#define js_value_UICollectionViewFlowLayoutInvalidationContext(x) js_value_wrapper(x, UICollectionViewFlowLayoutInvalidationContext)
#define to_value_UICollectionViewFlowLayoutInvalidationContext(x) to_value_wrapper(x, UICollectionViewFlowLayoutInvalidationContext)
#define is_value_UICollectionViewFlowLayoutInvalidationContext(x) is_value_wrapper(x, UICollectionViewFlowLayoutInvalidationContext)

JS_WRAP_CLASS(UICollectionViewFlowLayoutInvalidationContext, UICollectionViewLayoutInvalidationContext);
  JS_PROP(invalidateFlowLayoutDelegateMetrics);
  JS_PROP(invalidateFlowLayoutAttributes);
JS_WRAP_CLASS_END(UICollectionViewFlowLayoutInvalidationContext);

#endif /* NUICollectionViewFlowLayoutInvalidationContext_h */
