//
//  NNSItemProvider.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSItemProvider_h
#define NNSItemProvider_h    

#include "NNSObject.h"

#define js_value_NSItemProvider(x) js_value_wrapper(x, NSItemProvider)
#define to_value_NSItemProvider(x) to_value_wrapper(x, NSItemProvider)
#define is_value_NSItemProvider(x) is_value_wrapper(x, NSItemProvider)

#define js_value_NSItemProviderRepresentationVisibility(x) JS_ENUM(NSItemProviderRepresentationVisibility, NSInteger, x)
#define to_value_NSItemProviderRepresentationVisibility(x) TO_ENUM(NSItemProviderRepresentationVisibility, NSInteger, x)
#define is_value_NSItemProviderRepresentationVisibility(x) IS_ENUM(NSItemProviderRepresentationVisibility, NSInteger, x)

#define js_value_NSItemProviderFileOptions(x) JS_OPTS(NSItemProviderFileOptions, NSInteger, x)
#define to_value_NSItemProviderFileOptions(x) TO_OPTS(NSItemProviderFileOptions, NSInteger, x)
#define is_value_NSItemProviderFileOptions(x) IS_OPTS(NSItemProviderFileOptions, NSInteger, x)

#define js_value_NSItemProviderErrorCode(x) JS_ENUM(NSItemProviderErrorCode, NSInteger, x)
#define to_value_NSItemProviderErrorCode(x) TO_ENUM(NSItemProviderErrorCode, NSInteger, x)
#define is_value_NSItemProviderErrorCode(x) IS_ENUM(NSItemProviderErrorCode, NSInteger, x)

JS_WRAP_CLASS(NSItemProvider, NSObject);
  JS_METHOD(registerDataRepresentationForTypeIdentifierVisibilityLoadHandler);
  JS_METHOD(registerFileRepresentationForTypeIdentifierFileOptionsVisibilityLoadHandler);
  JS_METHOD(registeredTypeIdentifiersWithFileOptions);
  JS_METHOD(hasItemConformingToTypeIdentifier);
  JS_METHOD(hasRepresentationConformingToTypeIdentifierFileOptions);
  JS_METHOD(loadDataRepresentationForTypeIdentifierCompletionHandler);
  JS_METHOD(loadFileRepresentationForTypeIdentifierCompletionHandler);
  JS_METHOD(loadInPlaceFileRepresentationForTypeIdentifierCompletionHandler);
  JS_METHOD(initWithObject);
  JS_METHOD(registerObjectVisibility);
  JS_METHOD(registerObjectOfClassVisibilityLoadHandler);
  JS_METHOD(canLoadObjectOfClass);
  JS_METHOD(loadObjectOfClassCompletionHandler);
  JS_METHOD(initWithItemTypeIdentifier);
  JS_METHOD(initWithContentsOfURL);
  JS_METHOD(registerItemForTypeIdentifierLoadHandler);
  JS_METHOD(loadItemForTypeIdentifierOptionsCompletionHandler);
  JS_METHOD(loadPreviewImageWithOptionsCompletionHandler);
  JS_PROP_READONLY(registeredTypeIdentifiers);
  JS_PROP(suggestedName);
  JS_PROP(previewImageHandler);
JS_WRAP_CLASS_END(NSItemProvider);

#endif /* NNSItemProvider_h */
