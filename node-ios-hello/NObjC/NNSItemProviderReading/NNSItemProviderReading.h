//
//  NNSItemProviderReading.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSItemProviderReading_h
#define NNSItemProviderReading_h    

#include "NNSObject.h"

#define js_value_NSItemProviderReading(x) js_protocol_wrapper(x, NSItemProviderReading)
#define to_value_NSItemProviderReading(x) to_protocol_wrapper(x, NSItemProviderReading)
#define is_value_NSItemProviderReading(x) is_protocol_wrapper(x, NSItemProviderReading)

JS_WRAP_PROTOCOL(NSItemProviderReading, NSObject);
  JS_STATIC_METHOD(objectWithItemProviderDataTypeIdentifierError);
  JS_STATIC_PROP_READONLY(readableTypeIdentifiersForItemProvider);
  JS_PROP(objectWithItemProviderDataTypeIdentifierError);
JS_WRAP_PROTOCOL_END(NSItemProviderReading, NSObject);

#if __OBJC__
@interface NSItemProviderReadingType : NSObject<NSItemProviderReading>

@property (class, NS_NONATOMIC_IOSONLY, readonly, copy) NSArray<NSString *> *readableTypeIdentifiersForItemProvider;

+ (nullable instancetype)objectWithItemProviderData:(NSData *)data
                                     typeIdentifier:(NSString *)typeIdentifier
                                              error:(NSError **)outError;

@end
#endif

#endif /* NNSItemProviderReading_h */
