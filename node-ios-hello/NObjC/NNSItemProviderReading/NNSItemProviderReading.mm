//
//  NNSItemProviderReading.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSItemProviderReading.h"

#define instancetype NSItemProviderReading
#define js_value_instancetype js_value_NSItemProviderReading

NNSItemProviderReading::NNSItemProviderReading() {}
NNSItemProviderReading::~NNSItemProviderReading() {}

JS_INIT_PROTOCOL(NSItemProviderReading, NSObject);
  JS_ASSIGN_STATIC_METHOD(objectWithItemProviderDataTypeIdentifierError);
  JS_ASSIGN_STATIC_PROP_READONLY(readableTypeIdentifiersForItemProvider);
  JS_ASSIGN_PROTO_PROP(objectWithItemProviderDataTypeIdentifierError);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSItemProviderReading, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(NSItemProviderReading, NSObject);


NAN_METHOD(NNSItemProviderReading::New) {
  JS_RECONSTRUCT_PROTOCOL(NSItemProviderReading);
  @autoreleasepool {
    id<NSItemProviderReading> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<NSItemProviderReading>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<NSItemProviderReading> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], NSItemProviderReading, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[NSItemProviderReadingType alloc] init];
    }
    if (self) {
      NNSItemProviderReading *wrapper = new NNSItemProviderReading();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSItemProviderReading::New: invalid arguments");
    }
  }
}

#include "NNSItemProvider.h"

NAN_METHOD(NNSItemProviderReading::objectWithItemProviderDataTypeIdentifierError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_pointer(NSString, typeIdentifier);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([NSItemProviderReadingType objectWithItemProviderData: data typeIdentifier: typeIdentifier error: &error]));
    js_panic_NSError(error);
  }
}

NAN_GETTER(NNSItemProviderReading::readableTypeIdentifiersForItemProviderGetter) {
  declare_autoreleasepool {
    JS_TODO(); // +[NSItemProviderReadingType readableTypeIdentifiersForItemProvider]: unrecognized selector sent to class 0x10e6d7b70
    #if TODO
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSItemProviderReadingType readableTypeIdentifiersForItemProvider]));
    #endif
  }
}

#undef instancetype

DELEGATE_PROTOCOL_PROP(NSItemProviderReading, objectWithItemProviderDataTypeIdentifierError);

@implementation NSItemProviderReadingType

+ (nullable instancetype)objectWithItemProviderData:(NSData *)data
                                     typeIdentifier:(NSString *)typeIdentifier
                                              error:(NSError **)outError
{
  __block id<NSItemProviderReading> result = nil;
  // TODO
  return result;
}

@end
