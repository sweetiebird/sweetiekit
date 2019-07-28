//
//  NMTLTextureDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTextureDescriptor.h"

#define instancetype MTLTextureDescriptor
#define js_value_instancetype js_value_MTLTextureDescriptor

NMTLTextureDescriptor::NMTLTextureDescriptor() {}
NMTLTextureDescriptor::~NMTLTextureDescriptor() {}

JS_INIT_CLASS(MTLTextureDescriptor, NSObject);
  JS_ASSIGN_STATIC_METHOD(texture2DDescriptorWithPixelFormatWidthHeightMipmapped);
  JS_ASSIGN_STATIC_METHOD(textureCubeDescriptorWithPixelFormatSizeMipmapped);
  JS_ASSIGN_STATIC_METHOD(textureBufferDescriptorWithPixelFormatWidthResourceOptionsUsage);
  JS_ASSIGN_PROTO_PROP(textureType);
  JS_ASSIGN_PROTO_PROP(pixelFormat);
  JS_ASSIGN_PROTO_PROP(width);
  JS_ASSIGN_PROTO_PROP(height);
  JS_ASSIGN_PROTO_PROP(depth);
  JS_ASSIGN_PROTO_PROP(mipmapLevelCount);
  JS_ASSIGN_PROTO_PROP(sampleCount);
  JS_ASSIGN_PROTO_PROP(arrayLength);
  JS_ASSIGN_PROTO_PROP(resourceOptions);
  JS_ASSIGN_PROTO_PROP(cpuCacheMode);
  JS_ASSIGN_PROTO_PROP(storageMode);
  if (@available(iOS 13.0, *)) {
    JS_ASSIGN_PROTO_PROP(hazardTrackingMode);
  }
  JS_ASSIGN_PROTO_PROP(usage);
  JS_ASSIGN_PROTO_PROP(allowGPUOptimizedContents);
  if (@available(iOS 13.0, *)) {
    JS_ASSIGN_PROTO_PROP(swizzle);
  }

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLTextureDescriptor, NSObject);
  // constant values (exports)

JS_INIT_CLASS_END(MTLTextureDescriptor, NSObject);

NAN_METHOD(NMTLTextureDescriptor::New) {
  JS_RECONSTRUCT(MTLTextureDescriptor);
  @autoreleasepool {
    MTLTextureDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLTextureDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLTextureDescriptor alloc] init];
    }
    if (self) {
      NMTLTextureDescriptor *wrapper = new NMTLTextureDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLTextureDescriptor::New: invalid arguments");
    }
  }
}

#include "NMTLPixelFormat.h"

NAN_METHOD(NMTLTextureDescriptor::texture2DDescriptorWithPixelFormatWidthHeightMipmapped) {
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPixelFormat, pixelFormat);
    declare_value(NSUInteger, width);
    declare_value(NSUInteger, height);
    declare_value(BOOL, mipmapped);
    JS_SET_RETURN(js_value_MTLTextureDescriptor([MTLTextureDescriptor texture2DDescriptorWithPixelFormat: pixelFormat width: width height: height mipmapped: mipmapped]));
  }
}

NAN_METHOD(NMTLTextureDescriptor::textureCubeDescriptorWithPixelFormatSizeMipmapped) {
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPixelFormat, pixelFormat);
    declare_value(NSUInteger, size);
    declare_value(BOOL, mipmapped);
    JS_SET_RETURN(js_value_MTLTextureDescriptor([MTLTextureDescriptor textureCubeDescriptorWithPixelFormat: pixelFormat size: size mipmapped: mipmapped]));
  }
}

#include "NMTLTexture.h"

NAN_METHOD(NMTLTextureDescriptor::textureBufferDescriptorWithPixelFormatWidthResourceOptionsUsage) {
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPixelFormat, pixelFormat);
    declare_value(NSUInteger, width);
    declare_value(MTLResourceOptions, resourceOptions);
    declare_value(MTLTextureUsage, usage);
    JS_SET_RETURN(js_value_MTLTextureDescriptor([MTLTextureDescriptor textureBufferDescriptorWithPixelFormat: pixelFormat width: width resourceOptions: resourceOptions usage: usage]));
  }
}

NAN_GETTER(NMTLTextureDescriptor::textureTypeGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTextureType([self textureType]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::textureTypeSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLTextureType, input);
    [self setTextureType: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::pixelFormatGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPixelFormat([self pixelFormat]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::pixelFormatSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLPixelFormat, input);
    [self setPixelFormat: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::widthGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self width]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::widthSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setWidth: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::heightGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self height]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::heightSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setHeight: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::depthGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self depth]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::depthSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setDepth: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::mipmapLevelCountGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self mipmapLevelCount]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::mipmapLevelCountSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setMipmapLevelCount: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::sampleCountGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self sampleCount]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::sampleCountSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setSampleCount: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::arrayLengthGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self arrayLength]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::arrayLengthSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setArrayLength: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::resourceOptionsGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLResourceOptions([self resourceOptions]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::resourceOptionsSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLResourceOptions, input);
    [self setResourceOptions: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::cpuCacheModeGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCPUCacheMode([self cpuCacheMode]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::cpuCacheModeSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLCPUCacheMode, input);
    [self setCpuCacheMode: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::storageModeGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStorageMode([self storageMode]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::storageModeSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLStorageMode, input);
    [self setStorageMode: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::hazardTrackingModeGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLHazardTrackingMode([self hazardTrackingMode]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::hazardTrackingModeSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLHazardTrackingMode, input);
    [self setHazardTrackingMode: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::usageGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTextureUsage([self usage]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::usageSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLTextureUsage, input);
    [self setUsage: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::allowGPUOptimizedContentsGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowGPUOptimizedContents]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::allowGPUOptimizedContentsSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowGPUOptimizedContents: input];
  }
}

NAN_GETTER(NMTLTextureDescriptor::swizzleGetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLTextureSwizzleChannels([self swizzle]));
  }
}

NAN_SETTER(NMTLTextureDescriptor::swizzleSetter) {
  JS_UNWRAP(MTLTextureDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLTextureSwizzleChannels, input);
    [self setSwizzle: input];
  }
}
