//
//  NNSItemProviderWriting.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSItemProviderWriting_h
#define NNSItemProviderWriting_h    

#include "NNSObject.h"

#define js_value_NSItemProviderWriting(x) js_protocol_wrapper(x, NSItemProviderWriting)
#define to_value_NSItemProviderWriting(x) to_protocol_wrapper(x, NSItemProviderWriting)
#define is_value_NSItemProviderWriting(x) is_protocol_wrapper(x, NSItemProviderWriting)

JS_WRAP_PROTOCOL(NSItemProviderWriting, NSObject);
  JS_STATIC_METHOD(itemProviderVisibilityForRepresentationWithTypeIdentifier);
  JS_PROP(itemProviderVisibilityForRepresentationWithTypeIdentifier);
  JS_PROP(loadDataWithTypeIdentifierForItemProviderCompletionHandler);
  JS_STATIC_PROP_READONLY(writableTypeIdentifiersForItemProvider);
  //JS_PROP_READONLY(writableTypeIdentifiersForItemProvider);
JS_WRAP_PROTOCOL_END(NSItemProviderWriting, NSObject);

#if __OBJC__
@interface NSItemProviderWritingType : NSObject<NSItemProviderWriting>

@property (class, NS_NONATOMIC_IOSONLY, readonly, copy) NSArray<NSString *> *writableTypeIdentifiersForItemProvider;

// If this method is not implemented, the class method will be consulted instead.
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSArray<NSString *> *writableTypeIdentifiersForItemProvider;

+ (NSItemProviderRepresentationVisibility)itemProviderVisibilityForRepresentationWithTypeIdentifier:(NSString *)typeIdentifier;

// If this method is not implemented, the class method will be consulted instead.
- (NSItemProviderRepresentationVisibility)itemProviderVisibilityForRepresentationWithTypeIdentifier:(NSString *)typeIdentifier;

- (nullable NSProgress *)loadDataWithTypeIdentifier:(NSString *)typeIdentifier // One of writableTypeIdentifiersForItemProvider
                   forItemProviderCompletionHandler:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completionHandler;

@end
#endif

#endif /* NNSItemProviderWriting_h */
