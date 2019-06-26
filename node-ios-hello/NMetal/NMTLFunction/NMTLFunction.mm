//
//  NMTLFunction.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLFunction.h"

#define instancetype MTLFunction
#define js_value_instancetype js_value_MTLFunction

NMTLFunction::NMTLFunction() {}
NMTLFunction::~NMTLFunction() {}

JS_INIT_PROTOCOL(MTLFunction, NSObject);
  JS_ASSIGN_PROTO_METHOD(newArgumentEncoderWithBufferIndex);
  JS_ASSIGN_PROTO_METHOD(newArgumentEncoderWithBufferIndexReflection);
  JS_ASSIGN_PROTO_PROP(label);
  JS_ASSIGN_PROTO_PROP_READONLY(device);
  JS_ASSIGN_PROTO_PROP_READONLY(functionType);
  JS_ASSIGN_PROTO_PROP_READONLY(patchType);
  JS_ASSIGN_PROTO_PROP_READONLY(patchControlPointCount);
  JS_ASSIGN_PROTO_PROP_READONLY(vertexAttributes);
  JS_ASSIGN_PROTO_PROP_READONLY(stageInputAttributes);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(functionConstantsDictionary);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLFunction, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLFunction, NSObject);

NAN_METHOD(NMTLFunction::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLFunction);
  @autoreleasepool {
    id<MTLFunction> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLFunction>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLFunction> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLFunction, value);
      self = value;
    }
    if (self) {
      NMTLFunction *wrapper = new NMTLFunction();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLFunction::New: invalid arguments");
    }
  }
}

#include "NMTLArgumentEncoder.h"

NAN_METHOD(NMTLFunction::newArgumentEncoderWithBufferIndex) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, bufferIndex);
    JS_SET_RETURN(js_value_MTLArgumentEncoder([self newArgumentEncoderWithBufferIndex: bufferIndex]));
  }
}

NAN_METHOD(NMTLFunction::newArgumentEncoderWithBufferIndexReflection) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(NSUInteger, bufferIndex);
    declare_value(MTLAutoreleasedArgument-pointer-__nullable, reflection);
    JS_SET_RETURN(js_value_MTLArgumentEncoder([self newArgumentEncoderWithBufferIndex: bufferIndex reflection: reflection]));
    #endif
  }
}

NAN_GETTER(NMTLFunction::labelGetter) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

NAN_SETTER(NMTLFunction::labelSetter) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLabel: input];
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NMTLFunction::deviceGetter) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}

#include "NMTLLibrary.h"

NAN_GETTER(NMTLFunction::functionTypeGetter) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLFunctionType([self functionType]));
  }
}

NAN_GETTER(NMTLFunction::patchTypeGetter) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLPatchType([self patchType]));
  }
}

NAN_GETTER(NMTLFunction::patchControlPointCountGetter) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self patchControlPointCount]));
  }
}

NAN_GETTER(NMTLFunction::vertexAttributesGetter) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<MTLVertexAttribute*>([self vertexAttributes]));
  }
}

NAN_GETTER(NMTLFunction::stageInputAttributesGetter) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<MTLAttribute*>([self stageInputAttributes]));
  }
}

NAN_GETTER(NMTLFunction::nameGetter) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NMTLFunction::functionConstantsDictionaryGetter) {
  JS_UNWRAP_PROTOCOL(MTLFunction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, MTLFunctionConstant*>*/([self functionConstantsDictionary]));
  }
}
