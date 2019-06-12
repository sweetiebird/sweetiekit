//
//  NSCNMaterialProperty.mm
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNMaterialProperty.h"

NSCNMaterialProperty::NSCNMaterialProperty() {}
NSCNMaterialProperty::~NSCNMaterialProperty() {}

JS_INIT_CLASS(SCNMaterialProperty, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, contents);
  JS_ASSIGN_PROP(proto, intensity);
  JS_ASSIGN_PROP(proto, minificationFilter);
  JS_ASSIGN_PROP(proto, magnificationFilter);
  JS_ASSIGN_PROP(proto, mipFilter);
  JS_ASSIGN_PROP(proto, contentsTransform);
  JS_ASSIGN_PROP(proto, wrapS);
  JS_ASSIGN_PROP(proto, wrapT);
  JS_ASSIGN_PROP(proto, borderColor);
  JS_ASSIGN_PROP(proto, mappingChannel);
  JS_ASSIGN_PROP(proto, textureComponents);
  JS_ASSIGN_PROP(proto, maxAnisotropy);
  // static members (ctor)
  JS_INIT_CTOR(SCNMaterialProperty, NSObject);
JS_INIT_CLASS_END(SCNMaterialProperty, NSObject);

NAN_METHOD(NSCNMaterialProperty::New) {
  JS_RECONSTRUCT(SCNMaterialProperty);
  @autoreleasepool {
    SCNMaterialProperty* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNMaterialProperty *)(info[0].As<External>()->Value());
    } else if(info.Length() <= 0) {
      self = [[SCNMaterialProperty alloc] init];
    }
    if (self) {
      NSCNMaterialProperty *wrapper = new NSCNMaterialProperty();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNMaterialProperty::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNMaterialProperty::contentsGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id([self contents]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::contentsSetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setContents: to_value_id(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::intensityGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self intensity]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::intensitySetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setIntensity: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::minificationFilterGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNFilterMode([self minificationFilter]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::minificationFilterSetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setMinificationFilter: to_value_SCNFilterMode(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::magnificationFilterGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNFilterMode([self magnificationFilter]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::magnificationFilterSetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setMagnificationFilter: to_value_SCNFilterMode(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::mipFilterGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNFilterMode([self mipFilter]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::mipFilterSetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setMipFilter: to_value_SCNFilterMode(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::contentsTransformGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNMatrix4([self contentsTransform]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::contentsTransformSetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setContentsTransform: to_value_SCNMatrix4(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::wrapSGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNWrapMode([self wrapS]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::wrapSSetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setWrapS: to_value_SCNWrapMode(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::wrapTGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNWrapMode([self wrapT]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::wrapTSetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setWrapT: to_value_SCNWrapMode(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::borderColorGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_id([self borderColor]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::borderColorSetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setBorderColor: to_value_id(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::mappingChannelGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self mappingChannel]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::mappingChannelSetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setMappingChannel: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::textureComponentsGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNColorMask([self textureComponents]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::textureComponentsSetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setTextureComponents: to_value_SCNColorMask(value)];
  }
}

NAN_GETTER(NSCNMaterialProperty::maxAnisotropyGetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self maxAnisotropy]));
    return;
  }
}

NAN_SETTER(NSCNMaterialProperty::maxAnisotropySetter) {
  JS_UNWRAP(SCNMaterialProperty, self);
  @autoreleasepool
  {
    [self setMaxAnisotropy: TO_FLOAT(value)];
  }
}
