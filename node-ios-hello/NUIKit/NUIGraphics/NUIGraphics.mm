//
//  NUIGraphics.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIGraphics.h"

#include "NCGContext.h"

NAN_METHOD(UIGraphicsGetCurrentContext) {
  declare_autoreleasepool {
    declare_args();
    JS_SET_RETURN(js_value_CGContextRef(::UIGraphicsGetCurrentContext()));
  }
}

NAN_METHOD(UIGraphicsPushContext) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGContextRef, context);
    ::UIGraphicsPushContext(context);
  }
}

NAN_METHOD(UIGraphicsPopContext) {
  declare_autoreleasepool {
    declare_args();
    ::UIGraphicsPopContext();
  }
}

NAN_METHOD(UIRectFillUsingBlendMode) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_value(CGBlendMode, blendMode);
    ::UIRectFillUsingBlendMode(rect, blendMode);
  }
}

NAN_METHOD(UIRectFill) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    ::UIRectFill(rect);
  }
}

NAN_METHOD(UIRectFrameUsingBlendMode) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_value(CGBlendMode, blendMode);
    ::UIRectFrameUsingBlendMode(rect, blendMode);
  }
}

NAN_METHOD(UIRectFrame) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    ::UIRectFrame(rect);
  }
}

NAN_METHOD(UIRectClip) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    ::UIRectClip(rect);
  }
}

NAN_METHOD(UIGraphicsBeginImageContext) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGSize, size);
    ::UIGraphicsBeginImageContext(size);
  }
}

NAN_METHOD(UIGraphicsBeginImageContextWithOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGSize, size);
    declare_value(BOOL, opaque);
    declare_value(CGFloat, scale);
    ::UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
  }
}

#include "NUIImage.h"

NAN_METHOD(UIGraphicsGetImageFromCurrentImageContext) {
  declare_autoreleasepool {
    declare_args();
    JS_SET_RETURN(js_value_UIImage(::UIGraphicsGetImageFromCurrentImageContext()));
  }
}

NAN_METHOD(UIGraphicsEndImageContext) {
  declare_autoreleasepool {
    declare_args();
    ::UIGraphicsEndImageContext();
  }
}

NAN_METHOD(UIGraphicsBeginPDFContextToFile) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    declare_value(CGRect, bounds);
    declare_nullable_pointer(NSDictionary, documentInfo);
    JS_SET_RETURN(js_value_BOOL(::UIGraphicsBeginPDFContextToFile(path, bounds, documentInfo)));
  }
}

NAN_METHOD(UIGraphicsBeginPDFContextToData) {
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(NSMutableData, data);
    declare_value(CGRect, bounds);
    declare_nullable_pointer(NSDictionary, documentInfo);
    ::UIGraphicsBeginPDFContextToData();
    #endif
  }
}

NAN_METHOD(UIGraphicsEndPDFContext) {
  declare_autoreleasepool {
    declare_args();
    ::UIGraphicsEndPDFContext();
  }
}

NAN_METHOD(UIGraphicsBeginPDFPage) {
  declare_autoreleasepool {
    declare_args();
    ::UIGraphicsBeginPDFPage();
  }
}

NAN_METHOD(UIGraphicsBeginPDFPageWithInfo) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    declare_nullable_pointer(NSDictionary, documentInfo);
    ::UIGraphicsBeginPDFPageWithInfo(bounds, documentInfo);
  }
}

NAN_METHOD(UIGraphicsGetPDFContextBounds) {
  declare_autoreleasepool {
    declare_args();
    JS_SET_RETURN(js_value_CGRect(::UIGraphicsGetPDFContextBounds()));
  }
}

#include "NNSURL.h"

NAN_METHOD(UIGraphicsSetPDFContextURLForRect) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_value(CGRect, rect);
    ::UIGraphicsSetPDFContextURLForRect(url, rect);
  }
}

NAN_METHOD(UIGraphicsAddPDFContextDestinationAtPoint) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(CGPoint, point);
    ::UIGraphicsAddPDFContextDestinationAtPoint(name, point);
  }
}

NAN_METHOD(UIGraphicsSetPDFContextDestinationForRect) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(CGRect, rect);
    ::UIGraphicsSetPDFContextDestinationForRect(name, rect);
  }
}

JS_INIT_GLOBALS(UIGraphics);
  // global values (exports)
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsGetCurrentContext);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsPushContext);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsPopContext);
  JS_ASSIGN_GLOBAL_METHOD(UIRectFillUsingBlendMode);
  JS_ASSIGN_GLOBAL_METHOD(UIRectFill);
  JS_ASSIGN_GLOBAL_METHOD(UIRectFrameUsingBlendMode);
  JS_ASSIGN_GLOBAL_METHOD(UIRectFrame);
  JS_ASSIGN_GLOBAL_METHOD(UIRectClip);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsBeginImageContext);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsBeginImageContextWithOptions);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsGetImageFromCurrentImageContext);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsEndImageContext);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsBeginPDFContextToFile);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsBeginPDFContextToData);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsEndPDFContext);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsBeginPDFPage);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsBeginPDFPageWithInfo);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsGetPDFContextBounds);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsSetPDFContextURLForRect);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsAddPDFContextDestinationAtPoint);
  JS_ASSIGN_GLOBAL_METHOD(UIGraphicsSetPDFContextDestinationForRect);
JS_INIT_GLOBALS_END(UIGraphics);

