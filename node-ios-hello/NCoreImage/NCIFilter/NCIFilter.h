//
//  NCIFilter.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCIFilter_h
#define NCIFilter_h    

#include "NNSObject.h"

#define js_value_CIFilter(x) js_value_wrapper(x, CIFilter)
#define to_value_CIFilter(x) to_value_wrapper(x, CIFilter)
#define is_value_CIFilter(x) is_value_wrapper(x, CIFilter)

JS_WRAP_CLASS(CIFilter, NSObject);
  JS_STATIC_METHOD(filterWithName);
  JS_STATIC_METHOD(filterWithNameWithInputParameters);
  JS_STATIC_METHOD(filterNamesInCategory);
  JS_STATIC_METHOD(filterNamesInCategories);
  JS_STATIC_METHOD(registerFilterNameConstructorClassAttributes);
  JS_STATIC_METHOD(localizedNameForFilterName);
  JS_STATIC_METHOD(localizedNameForCategory);
  JS_STATIC_METHOD(localizedDescriptionForFilterName);
  JS_STATIC_METHOD(localizedReferenceDocumentationForFilterName);
  JS_STATIC_METHOD(serializedXMPFromFiltersInputImageExtent);
  JS_STATIC_METHOD(filterArrayFromSerializedXMPInputImageExtentError);
  JS_METHOD(name);
  JS_METHOD(setName);
  JS_METHOD(setDefaults);
  JS_METHOD(applyArgumentsOptions);
  JS_METHOD(apply);
  JS_PROP_READONLY(outputImage);
  JS_PROP(name);
  JS_PROP(isEnabled);
  JS_PROP_READONLY(inputKeys);
  JS_PROP_READONLY(outputKeys);
  JS_PROP_READONLY(attributes);
JS_WRAP_CLASS_END(CIFilter);

#endif /* NCIFilter_h */
