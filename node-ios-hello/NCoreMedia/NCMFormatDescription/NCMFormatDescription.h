//
//  NCMFormatDescription.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCMFormatDescription_h
#define NCMFormatDescription_h    

#include "NNSObject.h"

/*!
  @typedef  CMFormatDescriptionRef
  @abstract  A reference to a CMFormatDescription, a CF object describing media of a particular type (audio, video, muxed, etc).
*/

#define js_value_CMFormatDescriptionRef(x) js_value_bridged(x, CMFormatDescriptionRef)
#define to_value_CMFormatDescriptionRef(x) to_value_bridged(x, CMFormatDescriptionRef)
#define is_value_CMFormatDescriptionRef(x) is_value_bridged(x, CMFormatDescriptionRef)

#define js_value_CMMetadataFormatDescriptionRef js_value_CMFormatDescriptionRef
#define to_value_CMMetadataFormatDescriptionRef to_value_CMFormatDescriptionRef
#define is_value_CMMetadataFormatDescriptionRef is_value_CMFormatDescriptionRef

#define js_value_CMMediaType(x) JS_ENUM(CMMediaType, FourCharCode, x)
#define to_value_CMMediaType(x) TO_ENUM(CMMediaType, FourCharCode, x)
#define is_value_CMMediaType(x) IS_ENUM(CMMediaType, FourCharCode, x)

JS_DECLARE_STRUCT(CMVideoDimensions);

JS_WRAP_GLOBALS(CMFormatDescription);
JS_WRAP_GLOBALS_END(CMFormatDescription);

#endif /* NCMFormatDescription_h */
