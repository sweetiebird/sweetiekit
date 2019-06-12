//
//  NMDLVertexAttribute.mm
//
//  Created by Shawn Presser on 6/11/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLVertexAttribute.h"

#define instancetype MDLVertexAttribute
#define js_value_instancetype js_value_MDLVertexAttribute

NMDLVertexAttribute::NMDLVertexAttribute() {}
NMDLVertexAttribute::~NMDLVertexAttribute() {}

JS_INIT_CLASS(MDLVertexAttribute, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP(format);
  JS_ASSIGN_PROTO_PROP(offset);
  JS_ASSIGN_PROTO_PROP(bufferIndex);
  JS_ASSIGN_PROTO_PROP(time);
  JS_ASSIGN_PROTO_PROP(initializationValue);
  // static members (ctor)
  JS_INIT_CTOR(MDLVertexAttribute, NSObject);
  JS_ASSIGN_STATIC_METHOD(initWithNameFormatOffsetBufferIndex);
  // constants
  exports->Set(JS_STR("MDLVertexAttributeAnisotropy"), js_value_NSString(MDLVertexAttributeAnisotropy));
  exports->Set(JS_STR("MDLVertexAttributeBinormal"), js_value_NSString(MDLVertexAttributeBinormal));
  exports->Set(JS_STR("MDLVertexAttributeBitangent"), js_value_NSString(MDLVertexAttributeBitangent));
  exports->Set(JS_STR("MDLVertexAttributeColor"), js_value_NSString(MDLVertexAttributeColor));
  exports->Set(JS_STR("MDLVertexAttributeEdgeCrease"), js_value_NSString(MDLVertexAttributeEdgeCrease));
  exports->Set(JS_STR("MDLVertexAttributeJointIndices"), js_value_NSString(MDLVertexAttributeJointIndices));
  exports->Set(JS_STR("MDLVertexAttributeJointWeights"), js_value_NSString(MDLVertexAttributeJointWeights));
  exports->Set(JS_STR("MDLVertexAttributeNormal"), js_value_NSString(MDLVertexAttributeNormal));
  exports->Set(JS_STR("MDLVertexAttributeOcclusionValue"), js_value_NSString(MDLVertexAttributeOcclusionValue));
  exports->Set(JS_STR("MDLVertexAttributePosition"), js_value_NSString(MDLVertexAttributePosition));
  exports->Set(JS_STR("MDLVertexAttributeShadingBasisU"), js_value_NSString(MDLVertexAttributeShadingBasisU));
  exports->Set(JS_STR("MDLVertexAttributeShadingBasisV"), js_value_NSString(MDLVertexAttributeShadingBasisV));
  exports->Set(JS_STR("MDLVertexAttributeSubdivisionStencil"), js_value_NSString(MDLVertexAttributeSubdivisionStencil));
  exports->Set(JS_STR("MDLVertexAttributeTangent"), js_value_NSString(MDLVertexAttributeTangent));
  exports->Set(JS_STR("MDLVertexAttributeTextureCoordinate"), js_value_NSString(MDLVertexAttributeTextureCoordinate));
JS_INIT_CLASS_END(MDLVertexAttribute, NSObject);

NAN_METHOD(NMDLVertexAttribute::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLVertexAttribute(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLVertexAttribute, info);
      return;
    }

    MDLVertexAttribute* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLVertexAttribute *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLVertexAttribute alloc] init];
    }
    if (self) {
      NMDLVertexAttribute *wrapper = new NMDLVertexAttribute();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLVertexAttribute::New: invalid arguments");
    }
  }
}

#include "NMDLVertexDescriptor.h"

NAN_METHOD(NMDLVertexAttribute::initWithNameFormatOffsetBufferIndex) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(MDLVertexFormat, format);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, bufferIndex);
    JS_SET_RETURN(js_value_instancetype([[MDLVertexAttribute alloc] initWithName: name format: format offset: offset bufferIndex: bufferIndex]));
  }
}

NAN_GETTER(NMDLVertexAttribute::nameGetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NMDLVertexAttribute::nameSetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

NAN_GETTER(NMDLVertexAttribute::formatGetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLVertexFormat([self format]));
  }
}

NAN_SETTER(NMDLVertexAttribute::formatSetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MDLVertexFormat, input);
    [self setFormat: input];
  }
}

NAN_GETTER(NMDLVertexAttribute::offsetGetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self offset]));
  }
}

NAN_SETTER(NMDLVertexAttribute::offsetSetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setOffset: input];
  }
}

NAN_GETTER(NMDLVertexAttribute::bufferIndexGetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self bufferIndex]));
  }
}

NAN_SETTER(NMDLVertexAttribute::bufferIndexSetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setBufferIndex: input];
  }
}

NAN_GETTER(NMDLVertexAttribute::timeGetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self time]));
  }
}

NAN_SETTER(NMDLVertexAttribute::timeSetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setTime: input];
  }
}

NAN_GETTER(NMDLVertexAttribute::initializationValueGetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float4([self initializationValue]));
  }
}

NAN_SETTER(NMDLVertexAttribute::initializationValueSetter) {
  JS_UNWRAP(MDLVertexAttribute, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float4, input);
    [self setInitializationValue: input];
  }
}

