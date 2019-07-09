//
//  NVNRequestProgressProviding.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNRequestProgressProviding_h
#define NVNRequestProgressProviding_h    

#include "NNSObject.h"

#if __OBJC__
@protocol VNRequestProgressProviding;
#endif

#define js_value_VNRequestProgressProviding(x) js_protocol_wrapper(x, VNRequestProgressProviding)
#define to_value_VNRequestProgressProviding(x) to_protocol_wrapper(x, VNRequestProgressProviding)
#define is_value_VNRequestProgressProviding(x) is_protocol_wrapper(x, VNRequestProgressProviding)

JS_WRAP_PROTOCOL(VNRequestProgressProviding, NSObject);
  JS_PROP(progressHandler);
  JS_PROP_READONLY(indeterminate);
JS_WRAP_PROTOCOL_END(VNRequestProgressProviding, NSObject);

#if __OBJC__
@class VNRequest;
typedef void (^VNRequestProgressHandler)(VNRequest *request, double fractionCompleted, NSError * _Nullable error);

@interface VNRequestProgressProvidingType : NSObject<VNRequestProgressProviding>

/*!
 @brief Requests that support the VNRequestProgressProviding protocol would periodically call the progressHandler to report progress on longer running tasks.
 
 @discussion The progessHandler is optional allowing clients of the request to report progress to the user and/or display or process partial results when they become available. Note that the progressHandler can be called on a different dispatch queue than what the request was initiated from.
 */
@property (readwrite, nonatomic, assign) VNRequestProgressHandler progressHandler;


/*!
 @brief If a request cannot determine its progress in fractions completed, this property will be set.
 @discussion If this is set, it doesn't mean that the request will run forever just that the nature of the request is not broken down into identifiable fractions on which progress can be reported in increments. The progressHandler will nonetheless be called at suitable intervals.
 */
@property (readonly) BOOL indeterminate;

@end
#endif

#endif /* NVNRequestProgressProviding_h */
