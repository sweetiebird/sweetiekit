//
//  NCIBlendKernel.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCIBlendKernel.h"

#define instancetype CIBlendKernel
#define js_value_instancetype js_value_CIBlendKernel

NCIBlendKernel::NCIBlendKernel() {}
NCIBlendKernel::~NCIBlendKernel() {}

JS_INIT_CLASS(CIBlendKernel, CIColorKernel);
  JS_ASSIGN_STATIC_METHOD(kernelWithString);
  JS_ASSIGN_PROTO_METHOD(applyWithForegroundBackground);
  JS_ASSIGN_STATIC_PROP_READONLY(componentAdd);
  JS_ASSIGN_STATIC_PROP_READONLY(componentMultiply);
  JS_ASSIGN_STATIC_PROP_READONLY(componentMin);
  JS_ASSIGN_STATIC_PROP_READONLY(componentMax);
  JS_ASSIGN_STATIC_PROP_READONLY(clear);
  JS_ASSIGN_STATIC_PROP_READONLY(source);
  JS_ASSIGN_STATIC_PROP_READONLY(destination);
  JS_ASSIGN_STATIC_PROP_READONLY(sourceOver);
  JS_ASSIGN_STATIC_PROP_READONLY(destinationOver);
  JS_ASSIGN_STATIC_PROP_READONLY(sourceIn);
  JS_ASSIGN_STATIC_PROP_READONLY(destinationIn);
  JS_ASSIGN_STATIC_PROP_READONLY(sourceOut);
  JS_ASSIGN_STATIC_PROP_READONLY(destinationOut);
  JS_ASSIGN_STATIC_PROP_READONLY(sourceAtop);
  JS_ASSIGN_STATIC_PROP_READONLY(destinationAtop);
  JS_ASSIGN_STATIC_PROP_READONLY(exclusiveOr);
  JS_ASSIGN_STATIC_PROP_READONLY(multiply);
  JS_ASSIGN_STATIC_PROP_READONLY(screen);
  JS_ASSIGN_STATIC_PROP_READONLY(overlay);
  JS_ASSIGN_STATIC_PROP_READONLY(darken);
  JS_ASSIGN_STATIC_PROP_READONLY(lighten);
  JS_ASSIGN_STATIC_PROP_READONLY(colorDodge);
  JS_ASSIGN_STATIC_PROP_READONLY(colorBurn);
  JS_ASSIGN_STATIC_PROP_READONLY(hardLight);
  JS_ASSIGN_STATIC_PROP_READONLY(softLight);
  JS_ASSIGN_STATIC_PROP_READONLY(difference);
  JS_ASSIGN_STATIC_PROP_READONLY(exclusion);
  JS_ASSIGN_STATIC_PROP_READONLY(hue);
  JS_ASSIGN_STATIC_PROP_READONLY(saturation);
  JS_ASSIGN_STATIC_PROP_READONLY(color);
  JS_ASSIGN_STATIC_PROP_READONLY(luminosity);
  JS_ASSIGN_STATIC_PROP_READONLY(subtract);
  JS_ASSIGN_STATIC_PROP_READONLY(divide);
  JS_ASSIGN_STATIC_PROP_READONLY(linearBurn);
  JS_ASSIGN_STATIC_PROP_READONLY(linearDodge);
  JS_ASSIGN_STATIC_PROP_READONLY(vividLight);
  JS_ASSIGN_STATIC_PROP_READONLY(linearLight);
  JS_ASSIGN_STATIC_PROP_READONLY(pinLight);
  JS_ASSIGN_STATIC_PROP_READONLY(hardMix);
  JS_ASSIGN_STATIC_PROP_READONLY(darkerColor);
  JS_ASSIGN_STATIC_PROP_READONLY(lighterColor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CIBlendKernel, CIColorKernel);
  // constant values (exports)
JS_INIT_CLASS_END(CIBlendKernel, CIColorKernel);

NAN_METHOD(NCIBlendKernel::New) {
  JS_RECONSTRUCT(CIBlendKernel);
  @autoreleasepool {
    CIBlendKernel* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CIBlendKernel *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CIBlendKernel alloc] init];
    }
    if (self) {
      NCIBlendKernel *wrapper = new NCIBlendKernel();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CIBlendKernel::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCIBlendKernel::kernelWithString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    JS_SET_RETURN(js_value_instancetype([CIBlendKernel kernelWithString: string]));
  }
}

#include "NCIImage.h"

NAN_METHOD(NCIBlendKernel::applyWithForegroundBackground) {
  JS_UNWRAP(CIBlendKernel, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIImage, foreground);
    declare_pointer(CIImage, background);
    JS_SET_RETURN(js_value_CIImage([self applyWithForeground: foreground background: background]));
  }
}

NAN_GETTER(NCIBlendKernel::componentAddGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel componentAdd]));
  }
}

NAN_GETTER(NCIBlendKernel::componentMultiplyGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel componentMultiply]));
  }
}

NAN_GETTER(NCIBlendKernel::componentMinGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel componentMin]));
  }
}

NAN_GETTER(NCIBlendKernel::componentMaxGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel componentMax]));
  }
}

NAN_GETTER(NCIBlendKernel::clearGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel clear]));
  }
}

NAN_GETTER(NCIBlendKernel::sourceGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel source]));
  }
}

NAN_GETTER(NCIBlendKernel::destinationGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel destination]));
  }
}

NAN_GETTER(NCIBlendKernel::sourceOverGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel sourceOver]));
  }
}

NAN_GETTER(NCIBlendKernel::destinationOverGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel destinationOver]));
  }
}

NAN_GETTER(NCIBlendKernel::sourceInGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel sourceIn]));
  }
}

NAN_GETTER(NCIBlendKernel::destinationInGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel destinationIn]));
  }
}

NAN_GETTER(NCIBlendKernel::sourceOutGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel sourceOut]));
  }
}

NAN_GETTER(NCIBlendKernel::destinationOutGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel destinationOut]));
  }
}

NAN_GETTER(NCIBlendKernel::sourceAtopGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel sourceAtop]));
  }
}

NAN_GETTER(NCIBlendKernel::destinationAtopGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel destinationAtop]));
  }
}

NAN_GETTER(NCIBlendKernel::exclusiveOrGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel exclusiveOr]));
  }
}

NAN_GETTER(NCIBlendKernel::multiplyGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel multiply]));
  }
}

NAN_GETTER(NCIBlendKernel::screenGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel screen]));
  }
}

NAN_GETTER(NCIBlendKernel::overlayGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel overlay]));
  }
}

NAN_GETTER(NCIBlendKernel::darkenGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel darken]));
  }
}

NAN_GETTER(NCIBlendKernel::lightenGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel lighten]));
  }
}

NAN_GETTER(NCIBlendKernel::colorDodgeGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel colorDodge]));
  }
}

NAN_GETTER(NCIBlendKernel::colorBurnGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel colorBurn]));
  }
}

NAN_GETTER(NCIBlendKernel::hardLightGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel hardLight]));
  }
}

NAN_GETTER(NCIBlendKernel::softLightGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel softLight]));
  }
}

NAN_GETTER(NCIBlendKernel::differenceGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel difference]));
  }
}

NAN_GETTER(NCIBlendKernel::exclusionGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel exclusion]));
  }
}

NAN_GETTER(NCIBlendKernel::hueGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel hue]));
  }
}

NAN_GETTER(NCIBlendKernel::saturationGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel saturation]));
  }
}

NAN_GETTER(NCIBlendKernel::colorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel color]));
  }
}

NAN_GETTER(NCIBlendKernel::luminosityGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel luminosity]));
  }
}

NAN_GETTER(NCIBlendKernel::subtractGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel subtract]));
  }
}

NAN_GETTER(NCIBlendKernel::divideGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel divide]));
  }
}

NAN_GETTER(NCIBlendKernel::linearBurnGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel linearBurn]));
  }
}

NAN_GETTER(NCIBlendKernel::linearDodgeGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel linearDodge]));
  }
}

NAN_GETTER(NCIBlendKernel::vividLightGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel vividLight]));
  }
}

NAN_GETTER(NCIBlendKernel::linearLightGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel linearLight]));
  }
}

NAN_GETTER(NCIBlendKernel::pinLightGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel pinLight]));
  }
}

NAN_GETTER(NCIBlendKernel::hardMixGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel hardMix]));
  }
}

NAN_GETTER(NCIBlendKernel::darkerColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel darkerColor]));
  }
}

NAN_GETTER(NCIBlendKernel::lighterColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIBlendKernel([CIBlendKernel lighterColor]));
  }
}
