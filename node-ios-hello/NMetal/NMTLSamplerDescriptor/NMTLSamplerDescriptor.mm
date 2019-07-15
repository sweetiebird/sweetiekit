//
//  NMTLSamplerDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLSamplerDescriptor.h"

#define instancetype MTLSamplerDescriptor
#define js_value_instancetype js_value_MTLSamplerDescriptor

NMTLSamplerDescriptor::NMTLSamplerDescriptor() {}
NMTLSamplerDescriptor::~NMTLSamplerDescriptor() {}

JS_INIT_CLASS(MTLSamplerDescriptor, NSObject);
  JS_ASSIGN_PROTO_PROP(minFilter);
  JS_ASSIGN_PROTO_PROP(magFilter);
  JS_ASSIGN_PROTO_PROP(mipFilter);
  JS_ASSIGN_PROTO_PROP(maxAnisotropy);
  JS_ASSIGN_PROTO_PROP(sAddressMode);
  JS_ASSIGN_PROTO_PROP(tAddressMode);
  JS_ASSIGN_PROTO_PROP(rAddressMode);
#if DEPRECATED
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_PROP(borderColor);
#endif
#endif
  JS_ASSIGN_PROTO_PROP(normalizedCoordinates);
  JS_ASSIGN_PROTO_PROP(lodMinClamp);
  JS_ASSIGN_PROTO_PROP(lodMaxClamp);
#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
  JS_ASSIGN_PROTO_PROP(lodAverage);
#endif
  JS_ASSIGN_PROTO_PROP(compareFunction);
  JS_ASSIGN_PROTO_PROP(supportArgumentBuffers);
  JS_ASSIGN_PROTO_PROP(label);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLSamplerDescriptor, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSUInteger, MTLSamplerMinMagFilter) {
    JS_ASSIGN_ENUM(MTLSamplerMinMagFilterNearest, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLSamplerMinMagFilterLinear, NSUInteger); // = 1,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLSamplerMipFilter) {
    JS_ASSIGN_ENUM(MTLSamplerMipFilterNotMipmapped, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLSamplerMipFilterNearest, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLSamplerMipFilterLinear, NSUInteger); // = 2,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLSamplerAddressMode) {
    JS_ASSIGN_ENUM(MTLSamplerAddressModeClampToEdge, NSUInteger); // = 0,
#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLSamplerAddressModeMirrorClampToEdge, NSUInteger); // API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 1,
#endif
    JS_ASSIGN_ENUM(MTLSamplerAddressModeRepeat, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLSamplerAddressModeMirrorRepeat, NSUInteger); // = 3,
    JS_ASSIGN_ENUM(MTLSamplerAddressModeClampToZero, NSUInteger); // = 4,
#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLSamplerAddressModeClampToBorderColor, NSUInteger); // API_AVAILABLE(macos(10.12)) API_UNAVAILABLE(ios) = 5,
#endif
  //} API_AVAILABLE(macos(10.11), ios(8.0));

#if !TARGET_OS_IPHONE
  //typedef NS_ENUM(NSUInteger, MTLSamplerBorderColor) {
    JS_ASSIGN_ENUM(MTLSamplerBorderColorTransparentBlack, NSUInteger); // = 0,  
    JS_ASSIGN_ENUM(MTLSamplerBorderColorOpaqueBlack, NSUInteger); // = 1,       
    JS_ASSIGN_ENUM(MTLSamplerBorderColorOpaqueWhite, NSUInteger); // = 2,       
  //} API_AVAILABLE(macos(10.12)) API_UNAVAILABLE(ios);
#endif

JS_INIT_CLASS_END(MTLSamplerDescriptor, NSObject);

NAN_METHOD(NMTLSamplerDescriptor::New) {
  JS_RECONSTRUCT(MTLSamplerDescriptor);
  @autoreleasepool {
    MTLSamplerDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLSamplerDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLSamplerDescriptor alloc] init];
    }
    if (self) {
      NMTLSamplerDescriptor *wrapper = new NMTLSamplerDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLSamplerDescriptor::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLSamplerDescriptor::minFilterGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLSamplerMinMagFilter([self minFilter]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::minFilterSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLSamplerMinMagFilter, input);
    [self setMinFilter: input];
  }
}

NAN_GETTER(NMTLSamplerDescriptor::magFilterGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLSamplerMinMagFilter([self magFilter]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::magFilterSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLSamplerMinMagFilter, input);
    [self setMagFilter: input];
  }
}

NAN_GETTER(NMTLSamplerDescriptor::mipFilterGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLSamplerMipFilter([self mipFilter]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::mipFilterSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLSamplerMipFilter, input);
    [self setMipFilter: input];
  }
}

NAN_GETTER(NMTLSamplerDescriptor::maxAnisotropyGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maxAnisotropy]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::maxAnisotropySetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setMaxAnisotropy: input];
  }
}

NAN_GETTER(NMTLSamplerDescriptor::sAddressModeGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLSamplerAddressMode([self sAddressMode]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::sAddressModeSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLSamplerAddressMode, input);
    [self setSAddressMode: input];
  }
}

NAN_GETTER(NMTLSamplerDescriptor::tAddressModeGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLSamplerAddressMode([self tAddressMode]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::tAddressModeSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLSamplerAddressMode, input);
    [self setTAddressMode: input];
  }
}

NAN_GETTER(NMTLSamplerDescriptor::rAddressModeGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLSamplerAddressMode([self rAddressMode]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::rAddressModeSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLSamplerAddressMode, input);
    [self setRAddressMode: input];
  }
}

#if DEPRECATED
#if !TARGET_OS_IPHONE
NAN_GETTER(NMTLSamplerDescriptor::borderColorGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLSamplerBorderColor([self borderColor]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::borderColorSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLSamplerBorderColor, input);
    [self setBorderColor: input];
  }
}
#endif
#endif

NAN_GETTER(NMTLSamplerDescriptor::normalizedCoordinatesGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self normalizedCoordinates]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::normalizedCoordinatesSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setNormalizedCoordinates: input];
  }
}

NAN_GETTER(NMTLSamplerDescriptor::lodMinClampGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self lodMinClamp]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::lodMinClampSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setLodMinClamp: input];
  }
}

NAN_GETTER(NMTLSamplerDescriptor::lodMaxClampGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self lodMaxClamp]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::lodMaxClampSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setLodMaxClamp: input];
  }
}

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
NAN_GETTER(NMTLSamplerDescriptor::lodAverageGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self lodAverage]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::lodAverageSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLodAverage: input];
  }
}
#endif

#include "NMTLDepthStencil.h"

NAN_GETTER(NMTLSamplerDescriptor::compareFunctionGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCompareFunction([self compareFunction]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::compareFunctionSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MTLCompareFunction, input);
    [self setCompareFunction: input];
  }
}

NAN_GETTER(NMTLSamplerDescriptor::supportArgumentBuffersGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self supportArgumentBuffers]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::supportArgumentBuffersSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSupportArgumentBuffers: input];
  }
}

NAN_GETTER(NMTLSamplerDescriptor::labelGetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

NAN_SETTER(NMTLSamplerDescriptor::labelSetter) {
  JS_UNWRAP(MTLSamplerDescriptor, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLabel: input];
  }
}
