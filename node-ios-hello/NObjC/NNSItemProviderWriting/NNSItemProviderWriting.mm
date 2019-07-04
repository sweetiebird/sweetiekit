//
//  NNSItemProviderWriting.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSItemProviderWriting.h"

#import <Foundation/NSItemProvider.h>

#define instancetype NSItemProviderWriting
#define js_value_instancetype js_value_NSItemProviderWriting

NNSItemProviderWriting::NNSItemProviderWriting() {}
NNSItemProviderWriting::~NNSItemProviderWriting() {}

JS_INIT_PROTOCOL(NSItemProviderWriting, NSObject);
  JS_ASSIGN_STATIC_METHOD(itemProviderVisibilityForRepresentationWithTypeIdentifier);
  JS_ASSIGN_PROTO_PROP(itemProviderVisibilityForRepresentationWithTypeIdentifier);
  JS_ASSIGN_PROTO_PROP(loadDataWithTypeIdentifierForItemProviderCompletionHandler);
  JS_ASSIGN_STATIC_PROP_READONLY(writableTypeIdentifiersForItemProvider);
  JS_ASSIGN_PROTO_PROP_READONLY(writableTypeIdentifiersForItemProvider);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSItemProviderWriting, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(NSItemProviderWriting, NSObject);

NAN_METHOD(NNSItemProviderWriting::New) {
  JS_RECONSTRUCT_PROTOCOL(NSItemProviderWriting);
  @autoreleasepool {
    id<NSItemProviderWriting> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<NSItemProviderWriting>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<NSItemProviderWriting> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], NSItemProviderWriting, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[NSItemProviderWritingType alloc] init];
    }
    if (self) {
      NNSItemProviderWriting *wrapper = new NNSItemProviderWriting();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSItemProviderWriting::New: invalid arguments");
    }
  }
}

#include "NNSItemProvider.h"
#import <Foundation/NSItemProvider.h>

NAN_METHOD(NNSItemProviderWriting::itemProviderVisibilityForRepresentationWithTypeIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, typeIdentifier);
    JS_SET_RETURN(js_value_NSItemProviderRepresentationVisibility([NSItemProviderWritingType itemProviderVisibilityForRepresentationWithTypeIdentifier: typeIdentifier]));
  }
}

NAN_GETTER(NNSItemProviderWriting::writableTypeIdentifiersForItemProviderGetter) {
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSItemProviderWritingType writableTypeIdentifiersForItemProvider]));
    #endif
  }
}

DELEGATE_PROTOCOL_PROP(NSItemProviderWriting, itemProviderVisibilityForRepresentationWithTypeIdentifier);
DELEGATE_PROTOCOL_PROP(NSItemProviderWriting, loadDataWithTypeIdentifierForItemProviderCompletionHandler);

@implementation NSItemProviderWritingType

+ (NSItemProviderRepresentationVisibility)itemProviderVisibilityForRepresentationWithTypeIdentifier:(NSString *)typeIdentifier
{
  __block NSItemProviderRepresentationVisibility result = NSItemProviderRepresentationVisibilityAll;
  // TODO
  return result;
}

// If this method is not implemented, the class method will be consulted instead.
- (NSItemProviderRepresentationVisibility)itemProviderVisibilityForRepresentationWithTypeIdentifier:(NSString *)typeIdentifier
{
  __block NSItemProviderRepresentationVisibility result = [NSItemProviderWritingType itemProviderVisibilityForRepresentationWithTypeIdentifier:typeIdentifier];
  // TODO
  return result;
}

- (nullable NSProgress *)loadDataWithTypeIdentifier:(NSString *)typeIdentifier // One of writableTypeIdentifiersForItemProvider
                   forItemProviderCompletionHandler:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completionHandler
{
  __block NSProgress* result = nil;
  // TODO
  return result;
}

@end
