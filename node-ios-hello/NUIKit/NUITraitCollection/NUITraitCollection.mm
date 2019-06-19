//
//  NUITraitCollection.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITraitCollection.h"

#define instancetype UITraitCollection
#define js_value_instancetype js_value_UITraitCollection

NUITraitCollection::NUITraitCollection() {}
NUITraitCollection::~NUITraitCollection() {}

JS_INIT_CLASS(UITraitCollection, NSObject);
  // instance members (proto)
// UITraitCollection
  JS_ASSIGN_STATIC_METHOD(traitCollectionWithTraitsFromCollections);
  JS_ASSIGN_STATIC_METHOD(traitCollectionWithUserInterfaceIdiom);
  JS_ASSIGN_STATIC_METHOD(traitCollectionWithUserInterfaceStyle);
  JS_ASSIGN_STATIC_METHOD(traitCollectionWithLayoutDirection);
  JS_ASSIGN_STATIC_METHOD(traitCollectionWithDisplayScale);
  JS_ASSIGN_STATIC_METHOD(traitCollectionWithHorizontalSizeClass);
  JS_ASSIGN_STATIC_METHOD(traitCollectionWithVerticalSizeClass);
  JS_ASSIGN_STATIC_METHOD(traitCollectionWithForceTouchCapability);
  JS_ASSIGN_STATIC_METHOD(traitCollectionWithPreferredContentSizeCategory);
  JS_ASSIGN_STATIC_METHOD(traitCollectionWithDisplayGamut);
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(containsTraitsInCollection);
  JS_ASSIGN_PROTO_PROP_READONLY(userInterfaceIdiom);
  JS_ASSIGN_PROTO_PROP_READONLY(userInterfaceStyle);
  JS_ASSIGN_PROTO_PROP_READONLY(layoutDirection);
  JS_ASSIGN_PROTO_PROP_READONLY(displayScale);
  JS_ASSIGN_PROTO_PROP_READONLY(horizontalSizeClass);
  JS_ASSIGN_PROTO_PROP_READONLY(verticalSizeClass);
  JS_ASSIGN_PROTO_PROP_READONLY(forceTouchCapability);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredContentSizeCategory);
  JS_ASSIGN_PROTO_PROP_READONLY(displayGamut);
#if TODO
// UITraitEnvironment
  JS_ASSIGN_PROTO_METHOD(traitCollectionDidChange);
  JS_ASSIGN_PROTO_PROP_READONLY(traitCollection);
#endif

  // static members (ctor)
  JS_INIT_CTOR(UITraitCollection, NSObject);
  
  // constants (exports)

//typedef NS_ENUM(NSInteger, UIDeviceOrientation) {
  JS_ASSIGN_ENUM(UIDeviceOrientationUnknown, NSInteger);
  JS_ASSIGN_ENUM(UIDeviceOrientationPortrait, NSInteger);            // Device oriented vertically, home button on the bottom
  JS_ASSIGN_ENUM(UIDeviceOrientationPortraitUpsideDown, NSInteger);  // Device oriented vertically, home button on the top
  JS_ASSIGN_ENUM(UIDeviceOrientationLandscapeLeft, NSInteger);       // Device oriented horizontally, home button on the right
  JS_ASSIGN_ENUM(UIDeviceOrientationLandscapeRight, NSInteger);      // Device oriented horizontally, home button on the left
  JS_ASSIGN_ENUM(UIDeviceOrientationFaceUp, NSInteger);              // Device oriented flat, face up
  JS_ASSIGN_ENUM(UIDeviceOrientationFaceDown, NSInteger);            // Device oriented flat, face down
//} __TVOS_PROHIBITED;

//typedef NS_ENUM(NSInteger, UIDeviceBatteryState) {
  JS_ASSIGN_ENUM(UIDeviceBatteryStateUnknown, NSInteger);
  JS_ASSIGN_ENUM(UIDeviceBatteryStateUnplugged, NSInteger);   // on battery, discharging
  JS_ASSIGN_ENUM(UIDeviceBatteryStateCharging, NSInteger);    // plugged in, less than 100%
  JS_ASSIGN_ENUM(UIDeviceBatteryStateFull, NSInteger);        // plugged in, at 100%
//} __TVOS_PROHIBITED;              // available in iPhone 3.0

//typedef NS_ENUM(NSInteger, UIUserInterfaceIdiom) {
  JS_ASSIGN_ENUM(UIUserInterfaceIdiomUnspecified, NSInteger); // = -1,
  JS_ASSIGN_ENUM(UIUserInterfaceIdiomPhone, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2), // iPhone and iPod touch style UI
  JS_ASSIGN_ENUM(UIUserInterfaceIdiomPad, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2), // iPad style UI
  JS_ASSIGN_ENUM(UIUserInterfaceIdiomTV, NSInteger); // NS_ENUM_AVAILABLE_IOS(9_0), // Apple TV style UI
  JS_ASSIGN_ENUM(UIUserInterfaceIdiomCarPlay, NSInteger); // NS_ENUM_AVAILABLE_IOS(9_0), // CarPlay style UI
//};
  
JS_INIT_CLASS_END(UITraitCollection, NSObject);

NAN_METHOD(NUITraitCollection::New) {
  JS_RECONSTRUCT(UITraitCollection);
  @autoreleasepool {
    UITraitCollection* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UITraitCollection *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITraitCollection alloc] init];
    }
    if (self) {
      NUITraitCollection *wrapper = new NUITraitCollection();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITraitCollection::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUITraitCollection::traitCollectionWithTraitsFromCollections) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<UITraitCollection*>, traitCollections);
    JS_SET_RETURN(js_value_UITraitCollection([UITraitCollection traitCollectionWithTraitsFromCollections: traitCollections]));
  }
}

NAN_METHOD(NUITraitCollection::traitCollectionWithUserInterfaceIdiom) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIUserInterfaceIdiom, idiom);
    JS_SET_RETURN(js_value_UITraitCollection([UITraitCollection traitCollectionWithUserInterfaceIdiom: idiom]));
  }
}

#include "NUIView.h"

NAN_METHOD(NUITraitCollection::traitCollectionWithUserInterfaceStyle) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIUserInterfaceStyle, userInterfaceStyle);
    JS_SET_RETURN(js_value_UITraitCollection([UITraitCollection traitCollectionWithUserInterfaceStyle: userInterfaceStyle]));
  }
}

NAN_METHOD(NUITraitCollection::traitCollectionWithLayoutDirection) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UITraitEnvironmentLayoutDirection, layoutDirection);
    JS_SET_RETURN(js_value_UITraitCollection([UITraitCollection traitCollectionWithLayoutDirection: layoutDirection]));
  }
}

NAN_METHOD(NUITraitCollection::traitCollectionWithDisplayScale) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, scale);
    JS_SET_RETURN(js_value_UITraitCollection([UITraitCollection traitCollectionWithDisplayScale: scale]));
  }
}

NAN_METHOD(NUITraitCollection::traitCollectionWithHorizontalSizeClass) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIUserInterfaceSizeClass, horizontalSizeClass);
    JS_SET_RETURN(js_value_UITraitCollection([UITraitCollection traitCollectionWithHorizontalSizeClass: horizontalSizeClass]));
  }
}

NAN_METHOD(NUITraitCollection::traitCollectionWithVerticalSizeClass) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIUserInterfaceSizeClass, verticalSizeClass);
    JS_SET_RETURN(js_value_UITraitCollection([UITraitCollection traitCollectionWithVerticalSizeClass: verticalSizeClass]));
  }
}

#include "NUITouch.h"

NAN_METHOD(NUITraitCollection::traitCollectionWithForceTouchCapability) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIForceTouchCapability, capability);
    JS_SET_RETURN(js_value_UITraitCollection([UITraitCollection traitCollectionWithForceTouchCapability: capability]));
  }
}

#include "NUIApplication.h"

NAN_METHOD(NUITraitCollection::traitCollectionWithPreferredContentSizeCategory) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIContentSizeCategory, preferredContentSizeCategory);
    JS_SET_RETURN(js_value_UITraitCollection([UITraitCollection traitCollectionWithPreferredContentSizeCategory: preferredContentSizeCategory]));
  }
}

NAN_METHOD(NUITraitCollection::traitCollectionWithDisplayGamut) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIDisplayGamut, displayGamut);
    JS_SET_RETURN(js_value_UITraitCollection([UITraitCollection traitCollectionWithDisplayGamut: displayGamut]));
  }
}

NAN_METHOD(NUITraitCollection::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[UITraitCollection alloc] init]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUITraitCollection::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UITraitCollection, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUITraitCollection::containsTraitsInCollection) {
  JS_UNWRAP(UITraitCollection, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UITraitCollection, trait);
    JS_SET_RETURN(js_value_BOOL([self containsTraitsInCollection: trait]));
  }
}

NAN_GETTER(NUITraitCollection::userInterfaceIdiomGetter) {
  JS_UNWRAP(UITraitCollection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserInterfaceIdiom([self userInterfaceIdiom]));
  }
}

NAN_GETTER(NUITraitCollection::userInterfaceStyleGetter) {
  JS_UNWRAP(UITraitCollection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserInterfaceStyle([self userInterfaceStyle]));
  }
}

NAN_GETTER(NUITraitCollection::layoutDirectionGetter) {
  JS_UNWRAP(UITraitCollection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITraitEnvironmentLayoutDirection([self layoutDirection]));
  }
}

NAN_GETTER(NUITraitCollection::displayScaleGetter) {
  JS_UNWRAP(UITraitCollection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self displayScale]));
  }
}

NAN_GETTER(NUITraitCollection::horizontalSizeClassGetter) {
  JS_UNWRAP(UITraitCollection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserInterfaceSizeClass([self horizontalSizeClass]));
  }
}

NAN_GETTER(NUITraitCollection::verticalSizeClassGetter) {
  JS_UNWRAP(UITraitCollection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserInterfaceSizeClass([self verticalSizeClass]));
  }
}

NAN_GETTER(NUITraitCollection::forceTouchCapabilityGetter) {
  JS_UNWRAP(UITraitCollection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIForceTouchCapability([self forceTouchCapability]));
  }
}

NAN_GETTER(NUITraitCollection::preferredContentSizeCategoryGetter) {
  JS_UNWRAP(UITraitCollection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIContentSizeCategory([self preferredContentSizeCategory]));
  }
}

NAN_GETTER(NUITraitCollection::displayGamutGetter) {
  JS_UNWRAP(UITraitCollection, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDisplayGamut([self displayGamut]));
  }
}

#if TODO
NAN_METHOD(NUITraitEnvironment::traitCollectionDidChange) {
  JS_UNWRAP(UITraitEnvironment, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UITraitCollection, previousTraitCollection);
    [self traitCollectionDidChange: previousTraitCollection];
  }
}

NAN_GETTER(NUITraitEnvironment::traitCollectionGetter) {
  JS_UNWRAP(UITraitEnvironment, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITraitCollection([self traitCollection]));
  }
}
#endif
