//
//  NUIDevice.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDevice.h"

#define instancetype UIDevice
#define js_value_instancetype js_value_UIDevice

NUIDevice::NUIDevice() {}
NUIDevice::~NUIDevice() {}

JS_INIT_CLASS(UIDevice, NSObject);
  // global functions
  JS_ASSIGN_GLOBAL_METHOD(UIDeviceOrientationIsPortrait);
  JS_ASSIGN_GLOBAL_METHOD(UIDeviceOrientationIsLandscape);
  JS_ASSIGN_GLOBAL_METHOD(UIDeviceOrientationIsFlat);
  JS_ASSIGN_GLOBAL_METHOD(UIDeviceOrientationIsValidInterfaceOrientation);

// UIDevice
  JS_ASSIGN_STATIC_METHOD(currentDevice);
  JS_ASSIGN_PROTO_METHOD(beginGeneratingDeviceOrientationNotifications);
  JS_ASSIGN_PROTO_METHOD(endGeneratingDeviceOrientationNotifications);
  JS_ASSIGN_PROTO_METHOD(playInputClick);
  JS_ASSIGN_STATIC_PROP_READONLY(currentDevice);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(model);
  JS_ASSIGN_PROTO_PROP_READONLY(localizedModel);
  JS_ASSIGN_PROTO_PROP_READONLY(systemName);
  JS_ASSIGN_PROTO_PROP_READONLY(systemVersion);
  JS_ASSIGN_PROTO_PROP_READONLY(orientation);
  JS_ASSIGN_PROTO_PROP_READONLY(identifierForVendor);
  JS_ASSIGN_PROTO_PROP_READONLY(isGeneratingDeviceOrientationNotifications);
  JS_ASSIGN_PROTO_PROP(isBatteryMonitoringEnabled);
  JS_ASSIGN_PROTO_PROP_READONLY(batteryState);
  JS_ASSIGN_PROTO_PROP_READONLY(batteryLevel);
  JS_ASSIGN_PROTO_PROP(isProximityMonitoringEnabled);
  JS_ASSIGN_PROTO_PROP_READONLY(proximityState);
  JS_ASSIGN_PROTO_PROP_READONLY(isMultitaskingSupported);
  JS_ASSIGN_PROTO_PROP_READONLY(userInterfaceIdiom);

#if TODO
// UIInputViewAudioFeedback
  JS_ASSIGN_PROTO_PROP_READONLY(enableInputClicksWhenVisible);
#endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIDevice, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, UIDeviceOrientation) {
    JS_ASSIGN_ENUM(UIDeviceOrientationUnknown, NSInteger);
    JS_ASSIGN_ENUM(UIDeviceOrientationPortrait, NSInteger);            
    JS_ASSIGN_ENUM(UIDeviceOrientationPortraitUpsideDown, NSInteger);  
    JS_ASSIGN_ENUM(UIDeviceOrientationLandscapeLeft, NSInteger);       
    JS_ASSIGN_ENUM(UIDeviceOrientationLandscapeRight, NSInteger);      
    JS_ASSIGN_ENUM(UIDeviceOrientationFaceUp, NSInteger);              
    JS_ASSIGN_ENUM(UIDeviceOrientationFaceDown, NSInteger); //             
  //} __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, UIDeviceBatteryState) {
    JS_ASSIGN_ENUM(UIDeviceBatteryStateUnknown, NSInteger);
    JS_ASSIGN_ENUM(UIDeviceBatteryStateUnplugged, NSInteger);   
    JS_ASSIGN_ENUM(UIDeviceBatteryStateCharging, NSInteger);    
    JS_ASSIGN_ENUM(UIDeviceBatteryStateFull, NSInteger);        
  //} __TVOS_PROHIBITED;              

  //typedef NS_ENUM(NSInteger, UIUserInterfaceIdiom) {
    JS_ASSIGN_ENUM(UIUserInterfaceIdiomUnspecified, NSInteger); // = -1,
    JS_ASSIGN_ENUM(UIUserInterfaceIdiomPhone, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2), 
    JS_ASSIGN_ENUM(UIUserInterfaceIdiomPad, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2), 
    JS_ASSIGN_ENUM(UIUserInterfaceIdiomTV, NSInteger); // NS_ENUM_AVAILABLE_IOS(9_0), 
    JS_ASSIGN_ENUM(UIUserInterfaceIdiomCarPlay, NSInteger); // NS_ENUM_AVAILABLE_IOS(9_0), 
  //};

JS_INIT_CLASS_END(UIDevice, NSObject);

NAN_METHOD(NUIDevice::New) {
  JS_RECONSTRUCT(UIDevice);
  @autoreleasepool {
    UIDevice* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIDevice *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIDevice alloc] init];
    }
    if (self) {
      NUIDevice *wrapper = new NUIDevice();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDevice::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIDevice::UIDeviceOrientationIsPortrait) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIDeviceOrientation, value);
    JS_SET_RETURN(js_value_BOOL(::UIDeviceOrientationIsPortrait(value)));
  }
}

NAN_METHOD(NUIDevice::UIDeviceOrientationIsLandscape) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIDeviceOrientation, value);
    JS_SET_RETURN(js_value_BOOL(::UIDeviceOrientationIsLandscape(value)));
  }
}

NAN_METHOD(NUIDevice::UIDeviceOrientationIsFlat) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIDeviceOrientation, value);
    JS_SET_RETURN(js_value_BOOL(::UIDeviceOrientationIsFlat(value)));
  }
}

NAN_METHOD(NUIDevice::UIDeviceOrientationIsValidInterfaceOrientation) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIDeviceOrientation, value);
    JS_SET_RETURN(js_value_BOOL(::UIDeviceOrientationIsValidInterfaceOrientation(value)));
  }
}

NAN_METHOD(NUIDevice::currentDevice) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDevice([UIDevice currentDevice]));
  }
}

NAN_METHOD(NUIDevice::beginGeneratingDeviceOrientationNotifications) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    [self beginGeneratingDeviceOrientationNotifications];
  }
}

NAN_METHOD(NUIDevice::endGeneratingDeviceOrientationNotifications) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    [self endGeneratingDeviceOrientationNotifications];
  }
}

NAN_METHOD(NUIDevice::playInputClick) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    [self playInputClick];
  }
}

NAN_GETTER(NUIDevice::currentDeviceGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDevice([UIDevice currentDevice]));
  }
}

NAN_GETTER(NUIDevice::nameGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NUIDevice::modelGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self model]));
  }
}

NAN_GETTER(NUIDevice::localizedModelGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self localizedModel]));
  }
}

NAN_GETTER(NUIDevice::systemNameGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self systemName]));
  }
}

NAN_GETTER(NUIDevice::systemVersionGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self systemVersion]));
  }
}

NAN_GETTER(NUIDevice::orientationGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDeviceOrientation([self orientation]));
  }
}

#include "NNSUUID.h"

NAN_GETTER(NUIDevice::identifierForVendorGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUUID([self identifierForVendor]));
  }
}

NAN_GETTER(NUIDevice::isGeneratingDeviceOrientationNotificationsGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isGeneratingDeviceOrientationNotifications]));
  }
}

NAN_GETTER(NUIDevice::isBatteryMonitoringEnabledGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isBatteryMonitoringEnabled]));
  }
}

NAN_SETTER(NUIDevice::isBatteryMonitoringEnabledSetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setBatteryMonitoringEnabled: input];
  }
}

NAN_GETTER(NUIDevice::batteryStateGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDeviceBatteryState([self batteryState]));
  }
}

NAN_GETTER(NUIDevice::batteryLevelGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self batteryLevel]));
  }
}

NAN_GETTER(NUIDevice::isProximityMonitoringEnabledGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isProximityMonitoringEnabled]));
  }
}

NAN_SETTER(NUIDevice::isProximityMonitoringEnabledSetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setProximityMonitoringEnabled: input];
  }
}

NAN_GETTER(NUIDevice::proximityStateGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self proximityState]));
  }
}

NAN_GETTER(NUIDevice::isMultitaskingSupportedGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMultitaskingSupported]));
  }
}

NAN_GETTER(NUIDevice::userInterfaceIdiomGetter) {
  JS_UNWRAP(UIDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserInterfaceIdiom([self userInterfaceIdiom]));
  }
}

#if TODO
NAN_GETTER(NUIInputViewAudioFeedback::enableInputClicksWhenVisibleGetter) {
  JS_UNWRAP(UIInputViewAudioFeedback, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self enableInputClicksWhenVisible]));
  }
}
#endif
