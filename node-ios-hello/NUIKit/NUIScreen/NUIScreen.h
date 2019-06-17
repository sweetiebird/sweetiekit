//
//  NUIScreen.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIScreen_h
#define NUIScreen_h    

#include "NNSObject.h"

#define js_value_UIScreen(x) js_value_wrapper(x, UIScreen)
#define to_value_UIScreen(x) to_value_wrapper(x, UIScreen)
#define is_value_UIScreen(x) is_value_wrapper(x, UIScreen)

#define js_value_UIScreenOverscanCompensation(x) JS_ENUM(UIScreenOverscanCompensation, NSInteger, x)
#define to_value_UIScreenOverscanCompensation(x) TO_ENUM(UIScreenOverscanCompensation, NSInteger, x)
#define is_value_UIScreenOverscanCompensation(x) IS_ENUM(UIScreenOverscanCompensation, NSInteger, x)

JS_WRAP_CLASS(UIScreen, NSObject);
  JS_STATIC_METHOD(screens);
  JS_STATIC_METHOD(mainScreen);
  JS_METHOD(displayLinkWithTargetSelector);
  JS_METHOD(snapshotViewAfterScreenUpdates);
  JS_STATIC_PROP_READONLY(screens);
  JS_STATIC_PROP_READONLY(mainScreen);
  JS_PROP_READONLY(bounds);
  JS_PROP_READONLY(scale);
  JS_PROP_READONLY(availableModes);
  JS_PROP_READONLY(preferredMode);
  JS_PROP(currentMode);
  JS_PROP(overscanCompensation);
  JS_PROP_READONLY(overscanCompensationInsets);
  JS_PROP_READONLY(mirroredScreen);
  JS_PROP_READONLY(isCaptured);
  JS_PROP(brightness);
  JS_PROP(wantsSoftwareDimming);
  JS_PROP_READONLY(coordinateSpace);
  JS_PROP_READONLY(fixedCoordinateSpace);
  JS_PROP_READONLY(nativeBounds);
  JS_PROP_READONLY(nativeScale);
  JS_PROP_READONLY(maximumFramesPerSecond);
  JS_PROP_READONLY(focusedItem);
  JS_PROP_READONLY(focusedView);
  JS_PROP_READONLY(supportsFocus);
  JS_PROP_READONLY(applicationFrame);
JS_WRAP_CLASS_END(UIScreen);

#endif /* NUIScreen_h */
