//
//  NUIScreen.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIScreen.h"

#define instancetype UIScreen
#define js_value_instancetype js_value_UIScreen

NUIScreen::NUIScreen() {}
NUIScreen::~NUIScreen() {}

JS_INIT_CLASS(UIScreen, NSObject);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(screens);
  JS_ASSIGN_STATIC_METHOD(mainScreen);
  JS_ASSIGN_PROTO_METHOD(displayLinkWithTargetSelector);
  JS_ASSIGN_PROTO_METHOD(snapshotViewAfterScreenUpdates);
  JS_ASSIGN_STATIC_PROP_READONLY(screens);
  JS_ASSIGN_STATIC_PROP_READONLY(mainScreen);
  JS_ASSIGN_PROTO_PROP_READONLY(bounds);
  JS_ASSIGN_PROTO_PROP_READONLY(scale);
  JS_ASSIGN_PROTO_PROP_READONLY(availableModes);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredMode);
  JS_ASSIGN_PROTO_PROP(currentMode);
  JS_ASSIGN_PROTO_PROP(overscanCompensation);
  JS_ASSIGN_PROTO_PROP_READONLY(overscanCompensationInsets);
  JS_ASSIGN_PROTO_PROP_READONLY(mirroredScreen);
  JS_ASSIGN_PROTO_PROP_READONLY(isCaptured);
  JS_ASSIGN_PROTO_PROP(brightness);
  JS_ASSIGN_PROTO_PROP(wantsSoftwareDimming);
  JS_ASSIGN_PROTO_PROP_READONLY(coordinateSpace);
  JS_ASSIGN_PROTO_PROP_READONLY(fixedCoordinateSpace);
  JS_ASSIGN_PROTO_PROP_READONLY(nativeBounds);
  JS_ASSIGN_PROTO_PROP_READONLY(nativeScale);
  JS_ASSIGN_PROTO_PROP_READONLY(maximumFramesPerSecond);
  JS_ASSIGN_PROTO_PROP_READONLY(focusedItem);
  JS_ASSIGN_PROTO_PROP_READONLY(focusedView);
  JS_ASSIGN_PROTO_PROP_READONLY(supportsFocus);
  JS_ASSIGN_PROTO_PROP_READONLY(applicationFrame);
  // static members (ctor)
  JS_INIT_CTOR(UIScreen, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIScreen, NSObject);

NAN_METHOD(NUIScreen::New) {
  JS_RECONSTRUCT(UIScreen);
  @autoreleasepool {
    UIScreen* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIScreen *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIScreen alloc] init];
    }
    if (self) {
      NUIScreen *wrapper = new NUIScreen();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIScreen::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIScreen::screens) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIScreen*>([UIScreen screens]));
  }
}

NAN_METHOD(NUIScreen::mainScreen) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScreen([UIScreen mainScreen]));
  }
}

NAN_METHOD(NUIScreen::displayLinkWithTargetSelector) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(id, target);
    declare_value(SEL, sel);
    JS_SET_RETURN(js_value_CADisplayLink([self displayLinkWithTarget: target selector: sel]));
    #endif
  }
}

#include "NUIView.h"

NAN_METHOD(NUIScreen::snapshotViewAfterScreenUpdates) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, afterUpdates);
    JS_SET_RETURN(js_value_UIView([self snapshotViewAfterScreenUpdates: afterUpdates]));
  }
}

NAN_GETTER(NUIScreen::screensGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIScreen*>([UIScreen screens]));
  }
}

NAN_GETTER(NUIScreen::mainScreenGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScreen([UIScreen mainScreen]));
  }
}

NAN_GETTER(NUIScreen::boundsGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self bounds]));
  }
}

NAN_GETTER(NUIScreen::scaleGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self scale]));
  }
}

NAN_GETTER(NUIScreen::availableModesGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIScreenMode*>([self availableModes]));
  }
}

#include "NUIScreenMode.h"

NAN_GETTER(NUIScreen::preferredModeGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScreenMode([self preferredMode]));
  }
}

NAN_GETTER(NUIScreen::currentModeGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScreenMode([self currentMode]));
  }
}

NAN_SETTER(NUIScreen::currentModeSetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIScreenMode, input);
    [self setCurrentMode: input];
  }
}

NAN_GETTER(NUIScreen::overscanCompensationGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScreenOverscanCompensation([self overscanCompensation]));
  }
}

NAN_SETTER(NUIScreen::overscanCompensationSetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIScreenOverscanCompensation, input);
    [self setOverscanCompensation: input];
  }
}

NAN_GETTER(NUIScreen::overscanCompensationInsetsGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self overscanCompensationInsets]));
  }
}

NAN_GETTER(NUIScreen::mirroredScreenGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScreen([self mirroredScreen]));
  }
}

NAN_GETTER(NUIScreen::isCapturedGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCaptured]));
  }
}

NAN_GETTER(NUIScreen::brightnessGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self brightness]));
  }
}

NAN_SETTER(NUIScreen::brightnessSetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setBrightness: input];
  }
}

NAN_GETTER(NUIScreen::wantsSoftwareDimmingGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self wantsSoftwareDimming]));
  }
}

NAN_SETTER(NUIScreen::wantsSoftwareDimmingSetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setWantsSoftwareDimming: input];
  }
}

NAN_GETTER(NUIScreen::coordinateSpaceGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UICoordinateSpace>*/([self coordinateSpace]));
  }
}

NAN_GETTER(NUIScreen::fixedCoordinateSpaceGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UICoordinateSpace>*/([self fixedCoordinateSpace]));
  }
}

NAN_GETTER(NUIScreen::nativeBoundsGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self nativeBounds]));
  }
}

NAN_GETTER(NUIScreen::nativeScaleGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self nativeScale]));
  }
}

NAN_GETTER(NUIScreen::maximumFramesPerSecondGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self maximumFramesPerSecond]));
  }
}

NAN_GETTER(NUIScreen::focusedItemGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UIFocusItem>*/([self focusedItem]));
  }
}

NAN_GETTER(NUIScreen::focusedViewGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self focusedView]));
  }
}

NAN_GETTER(NUIScreen::supportsFocusGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self supportsFocus]));
  }
}

NAN_GETTER(NUIScreen::applicationFrameGetter) {
  JS_UNWRAP(UIScreen, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self applicationFrame]));
  }
}

