//
//  NVNFaceObservationAccepting.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNFaceObservationAccepting_h
#define NVNFaceObservationAccepting_h    

#include "NNSObject.h"

#if __OBJC__
@protocol VNFaceObservationAccepting;
@class VNFaceObservation;
#endif

#define js_value_VNFaceObservationAccepting(x) js_protocol_wrapper(x, VNFaceObservationAccepting)
#define to_value_VNFaceObservationAccepting(x) to_protocol_wrapper(x, VNFaceObservationAccepting)
#define is_value_VNFaceObservationAccepting(x) is_protocol_wrapper(x, VNFaceObservationAccepting)

JS_WRAP_PROTOCOL(VNFaceObservationAccepting, NSObject);
  JS_PROP(inputFaceObservations);
JS_WRAP_PROTOCOL_END(VNFaceObservationAccepting, NSObject);

#if __OBJC__
@interface VNFaceObservationAcceptingType : NSObject<VNFaceObservationAccepting>

/*!
  @brief  The VNFaceObservation objects to be processed as part of the request.
*/
@property (readwrite, nonatomic, copy, nullable) NSArray<VNFaceObservation *> *inputFaceObservations;

@end
#endif

#endif /* NVNFaceObservationAccepting_h */
