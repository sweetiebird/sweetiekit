//
//  NMDLTransform.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLTransform.h"

#define instancetype MDLTransform
#define js_value_instancetype js_value_MDLTransform

NMDLTransform::NMDLTransform() {}
NMDLTransform::~NMDLTransform() {}

JS_INIT_CLASS(MDLTransform, NSObject);
  // instance members (proto)
#if TODO
// MDLTransformComponent
  JS_ASSIGN_STATIC_METHOD(globalTransformWithObjectAtTime);
  JS_ASSIGN_PROTO_METHOD(setLocalTransformForTime);
  JS_ASSIGN_PROTO_METHOD(setLocalTransform);
  JS_ASSIGN_PROTO_METHOD(localTransformAtTime);
#endif
// MDLTransform
  JS_ASSIGN_PROTO_METHOD(setIdentity);
  JS_ASSIGN_PROTO_METHOD(translationAtTime);
  JS_ASSIGN_PROTO_METHOD(rotationAtTime);
  JS_ASSIGN_PROTO_METHOD(shearAtTime);
  JS_ASSIGN_PROTO_METHOD(scaleAtTime);
  JS_ASSIGN_PROTO_METHOD(setMatrixForTime);
  JS_ASSIGN_PROTO_METHOD(setTranslationForTime);
  JS_ASSIGN_PROTO_METHOD(setRotationForTime);
  JS_ASSIGN_PROTO_METHOD(setShearForTime);
  JS_ASSIGN_PROTO_METHOD(setScaleForTime);
  JS_ASSIGN_PROTO_METHOD(rotationMatrixAtTime);
#if TODO
// MDLTransformComponent
  JS_ASSIGN_PROTO_PROP(matrix);
  JS_ASSIGN_PROTO_PROP(resetsTransform);
  JS_ASSIGN_PROTO_PROP_READONLY(minimumTime);
  JS_ASSIGN_PROTO_PROP_READONLY(maximumTime);
  JS_ASSIGN_PROTO_PROP_READONLY(keyTimes);
#endif
// MDLTransform
  JS_ASSIGN_PROTO_PROP(translation);
  JS_ASSIGN_PROTO_PROP(rotation);
  JS_ASSIGN_PROTO_PROP(shear);
  JS_ASSIGN_PROTO_PROP(scale);
  // static members (ctor)
  JS_INIT_CTOR(MDLTransform, NSObject);
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithIdentity);
  JS_ASSIGN_PROTO_METHOD(initWithTransformComponent);
  JS_ASSIGN_PROTO_METHOD(initWithMatrix);
  JS_ASSIGN_PROTO_METHOD(initWithMatrixResetsTransform);
JS_INIT_CLASS_END(MDLTransform, NSObject);

NAN_METHOD(NMDLTransform::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLTransform(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLTransform, info);
      return;
    }

    MDLTransform* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLTransform *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLTransform alloc] init];
    }
    if (self) {
      NMDLTransform *wrapper = new NMDLTransform();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLTransform::New: invalid arguments");
    }
  }
}

#if TODO
NAN_METHOD(NMDLTransformComponent::globalTransformWithObjectAtTime) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLObject, object);
    declare_value(NSTimeInterval, time);
    JS_SET_RETURN(js_value_matrix_float4x4([MDLTransformComponent globalTransformWithObject: object atTime: time]));
  }
}

NAN_METHOD(NMDLTransformComponent::setLocalTransformForTime) {
  JS_UNWRAP(MDLTransformComponent, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(matrix_float4x4, transform);
    declare_value(NSTimeInterval, time);
    [self setLocalTransform: transform forTime: time];
  }
}

NAN_METHOD(NMDLTransformComponent::setLocalTransform) {
  JS_UNWRAP(MDLTransformComponent, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(matrix_float4x4, transform);
    [self setLocalTransform: transform];
  }
}

NAN_METHOD(NMDLTransformComponent::localTransformAtTime) {
  JS_UNWRAP(MDLTransformComponent, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, time);
    JS_SET_RETURN(js_value_matrix_float4x4([self localTransformAtTime: time]));
  }
}
#endif

NAN_METHOD(NMDLTransform::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[MDLTransform alloc] init]));
  }
}

NAN_METHOD(NMDLTransform::initWithIdentity) {
  JS_UNWRAP_OR_ALLOC(MDLTransform, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([self initWithIdentity]));
  }
}

NAN_METHOD(NMDLTransform::initWithTransformComponent) {
  JS_UNWRAP_OR_ALLOC(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MDLTransformComponent>*/, component);
    JS_SET_RETURN(js_value_instancetype([self initWithTransformComponent: component]));
  }
}

NAN_METHOD(NMDLTransform::initWithMatrix) {
  JS_UNWRAP_OR_ALLOC(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(matrix_float4x4, matrix);
    JS_SET_RETURN(js_value_instancetype([self initWithMatrix: matrix]));
  }
}

NAN_METHOD(NMDLTransform::initWithMatrixResetsTransform) {
  JS_UNWRAP_OR_ALLOC(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(matrix_float4x4, matrix);
    declare_value(BOOL, resetsTransform);
    JS_SET_RETURN(js_value_instancetype([self initWithMatrix: matrix resetsTransform: resetsTransform]));
  }
}

NAN_METHOD(NMDLTransform::setIdentity) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    [self setIdentity];
  }
}

NAN_METHOD(NMDLTransform::translationAtTime) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, time);
    JS_SET_RETURN(js_value_vector_float3([self translationAtTime: time]));
  }
}

NAN_METHOD(NMDLTransform::rotationAtTime) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, time);
    JS_SET_RETURN(js_value_vector_float3([self rotationAtTime: time]));
  }
}

NAN_METHOD(NMDLTransform::shearAtTime) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, time);
    JS_SET_RETURN(js_value_vector_float3([self shearAtTime: time]));
  }
}

NAN_METHOD(NMDLTransform::scaleAtTime) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, time);
    JS_SET_RETURN(js_value_vector_float3([self scaleAtTime: time]));
  }
}

NAN_METHOD(NMDLTransform::setMatrixForTime) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(matrix_float4x4, matrix);
    declare_value(NSTimeInterval, time);
    [self setMatrix: matrix forTime: time];
  }
}

NAN_METHOD(NMDLTransform::setTranslationForTime) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, translation);
    declare_value(NSTimeInterval, time);
    [self setTranslation: translation forTime: time];
  }
}

NAN_METHOD(NMDLTransform::setRotationForTime) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, rotation);
    declare_value(NSTimeInterval, time);
    [self setRotation: rotation forTime: time];
  }
}

NAN_METHOD(NMDLTransform::setShearForTime) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, shear);
    declare_value(NSTimeInterval, time);
    [self setShear: shear forTime: time];
  }
}

NAN_METHOD(NMDLTransform::setScaleForTime) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, scale);
    declare_value(NSTimeInterval, time);
    [self setScale: scale forTime: time];
  }
}

NAN_METHOD(NMDLTransform::rotationMatrixAtTime) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, time);
    JS_SET_RETURN(js_value_matrix_float4x4([self rotationMatrixAtTime: time]));
  }
}

#if TODO
NAN_GETTER(NMDLTransformComponent::matrixGetter) {
  JS_UNWRAP(MDLTransformComponent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_matrix_float4x4([self matrix]));
  }
}

NAN_SETTER(NMDLTransformComponent::matrixSetter) {
  JS_UNWRAP(MDLTransformComponent, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(matrix_float4x4, input);
    [self setMatrix: input];
  }
}

NAN_GETTER(NMDLTransformComponent::resetsTransformGetter) {
  JS_UNWRAP(MDLTransformComponent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self resetsTransform]));
  }
}

NAN_SETTER(NMDLTransformComponent::resetsTransformSetter) {
  JS_UNWRAP(MDLTransformComponent, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setResetsTransform: input];
  }
}

NAN_GETTER(NMDLTransformComponent::minimumTimeGetter) {
  JS_UNWRAP(MDLTransformComponent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self minimumTime]));
  }
}

NAN_GETTER(NMDLTransformComponent::maximumTimeGetter) {
  JS_UNWRAP(MDLTransformComponent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self maximumTime]));
  }
}

NAN_GETTER(NMDLTransformComponent::keyTimesGetter) {
  JS_UNWRAP(MDLTransformComponent, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self keyTimes]));
  }
}
#endif

NAN_GETTER(NMDLTransform::translationGetter) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float3([self translation]));
  }
}

NAN_SETTER(NMDLTransform::translationSetter) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float3, input);
    [self setTranslation: input];
  }
}

NAN_GETTER(NMDLTransform::rotationGetter) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float3([self rotation]));
  }
}

NAN_SETTER(NMDLTransform::rotationSetter) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float3, input);
    [self setRotation: input];
  }
}

NAN_GETTER(NMDLTransform::shearGetter) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float3([self shear]));
  }
}

NAN_SETTER(NMDLTransform::shearSetter) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float3, input);
    [self setShear: input];
  }
}

NAN_GETTER(NMDLTransform::scaleGetter) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float3([self scale]));
  }
}

NAN_SETTER(NMDLTransform::scaleSetter) {
  JS_UNWRAP(MDLTransform, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float3, input);
    [self setScale: input];
  }
}
