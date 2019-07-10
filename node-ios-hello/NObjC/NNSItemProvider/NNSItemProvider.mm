//
//  NNSItemProvider.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSItemProvider.h"

#import <Foundation/NSItemProvider.h>

#define instancetype NSItemProvider
#define js_value_instancetype js_value_NSItemProvider

NNSItemProvider::NNSItemProvider() {}
NNSItemProvider::~NNSItemProvider() {}

JS_INIT_CLASS(NSItemProvider, NSObject);
  JS_ASSIGN_PROTO_METHOD(registerDataRepresentationForTypeIdentifierVisibilityLoadHandler);
  JS_ASSIGN_PROTO_METHOD(registerFileRepresentationForTypeIdentifierFileOptionsVisibilityLoadHandler);
  JS_ASSIGN_PROTO_METHOD(registeredTypeIdentifiersWithFileOptions);
  JS_ASSIGN_PROTO_METHOD(hasItemConformingToTypeIdentifier);
  JS_ASSIGN_PROTO_METHOD(hasRepresentationConformingToTypeIdentifierFileOptions);
  JS_ASSIGN_PROTO_METHOD(loadDataRepresentationForTypeIdentifierCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(loadFileRepresentationForTypeIdentifierCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(loadInPlaceFileRepresentationForTypeIdentifierCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(initWithObject);
  JS_ASSIGN_PROTO_METHOD(registerObjectVisibility);
  JS_ASSIGN_PROTO_METHOD(registerObjectOfClassVisibilityLoadHandler);
  JS_ASSIGN_PROTO_METHOD(canLoadObjectOfClass);
  JS_ASSIGN_PROTO_METHOD(loadObjectOfClassCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(initWithItemTypeIdentifier);
  JS_ASSIGN_PROTO_METHOD(initWithContentsOfURL);
  JS_ASSIGN_PROTO_METHOD(registerItemForTypeIdentifierLoadHandler);
  JS_ASSIGN_PROTO_METHOD(loadItemForTypeIdentifierOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(loadPreviewImageWithOptionsCompletionHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(registeredTypeIdentifiers);
  JS_ASSIGN_PROTO_PROP(suggestedName);
  JS_ASSIGN_PROTO_PROP(previewImageHandler);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSItemProvider, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, NSItemProviderRepresentationVisibility) {
    JS_ASSIGN_ENUM(NSItemProviderRepresentationVisibilityAll, NSInteger); //  = 0,                                  // All processes can see this representation
    JS_ASSIGN_ENUM(NSItemProviderRepresentationVisibilityTeam, NSInteger); //                                       // Only processes from the same dev team can see this representation
    //API_AVAILABLE(ios(11.0), watchos(4.0), tvos(11.0)) API_UNAVAILABLE(macos) = 1,
#if !TARGET_OS_MAC && !TARGET_OS_UIKITFORMAC
    JS_ASSIGN_ENUM(NSItemProviderRepresentationVisibilityGroup, NSInteger); //                                      // Only processes from the same group can see this representation
#endif
    //API_AVAILABLE(macos(10.13)) API_UNAVAILABLE(ios, watchos, tvos) = 2 ,
    JS_ASSIGN_ENUM(NSItemProviderRepresentationVisibilityOwnProcess, NSInteger); //  = 3,                           // Ony the originator's process can see this representation
  //} API_AVAILABLE(macos(10.13), ios(11.0), watchos(4.0), tvos(11.0));


  // The default behavior is to copy files.
  //typedef NS_OPTIONS(NSInteger, NSItemProviderFileOptions) {
    JS_ASSIGN_ENUM(NSItemProviderFileOptionOpenInPlace, NSInteger); //  = 1,
  //} API_AVAILABLE(macos(10.13), ios(11.0), watchos(4.0), tvos(11.0));


  // NSItemProvider-related error codes
  //typedef NS_ENUM(NSInteger, NSItemProviderErrorCode) {
    JS_ASSIGN_ENUM(NSItemProviderUnknownError, NSInteger); //                                       = -1,
    JS_ASSIGN_ENUM(NSItemProviderItemUnavailableError, NSInteger); //                               = -1000,
    JS_ASSIGN_ENUM(NSItemProviderUnexpectedValueClassError, NSInteger); //                          = -1100,
    JS_ASSIGN_ENUM(NSItemProviderUnavailableCoercionError, NSInteger); //  API_AVAILABLE(macos(10.11), ios(9.0), watchos(2.0), tvos(9.0)) = -1200
  //} API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));

  JS_ASSIGN_ENUM(NSItemProviderPreferredImageSizeKey, NSString); //  API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0)); 
  JS_ASSIGN_ENUM(NSExtensionJavaScriptPreprocessingResultsKey, NSString); //  API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSExtensionJavaScriptFinalizeArgumentKey, NSString); //  API_AVAILABLE(ios(8.0), watchos(2.0), tvos(9.0)) API_UNAVAILABLE(macos);
  JS_ASSIGN_ENUM(NSItemProviderErrorDomain, NSString); //  API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));

JS_INIT_CLASS_END(NSItemProvider, NSObject);

NAN_METHOD(NNSItemProvider::New) {
  JS_RECONSTRUCT(NSItemProvider);
  @autoreleasepool {
    NSItemProvider* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSItemProvider *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSItemProvider alloc] init];
    }
    if (self) {
      NNSItemProvider *wrapper = new NNSItemProvider();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSItemProvider::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSItemProvider::registerDataRepresentationForTypeIdentifierVisibilityLoadHandler) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, typeIdentifier);
    declare_value(NSItemProviderRepresentationVisibility, visibility);
    declare_callback(loadHandler);
    [self registerDataRepresentationForTypeIdentifier: typeIdentifier visibility: visibility loadHandler:^NSProgress * _Nullable(void (^ _Nonnull completionHandler)(NSData * _Nullable, NSError * _Nullable)) {
      __block NSProgress* result = nil;
      dispatch_main(^{
        // TODO
      });
      return result;
    }];
  }
}

NAN_METHOD(NNSItemProvider::registerFileRepresentationForTypeIdentifierFileOptionsVisibilityLoadHandler) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, typeIdentifier);
    declare_value(NSItemProviderFileOptions, fileOptions);
    declare_value(NSItemProviderRepresentationVisibility, visibility);
    declare_callback(loadHandler);
    [self registerFileRepresentationForTypeIdentifier: typeIdentifier fileOptions: fileOptions visibility: visibility loadHandler:^NSProgress * _Nullable(void (^ _Nonnull completionHandler)(NSURL * _Nullable, BOOL, NSError * _Nullable)) {
      __block NSProgress* result = nil;
      dispatch_main(^{
        // TODO
      });
      return result;
    }];
  }
}

NAN_METHOD(NNSItemProvider::registeredTypeIdentifiersWithFileOptions) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSItemProviderFileOptions, fileOptions);
    JS_SET_RETURN(js_value_NSArray<NSString*>([self registeredTypeIdentifiersWithFileOptions: fileOptions]));
  }
}

NAN_METHOD(NNSItemProvider::hasItemConformingToTypeIdentifier) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, typeIdentifier);
    JS_SET_RETURN(js_value_BOOL([self hasItemConformingToTypeIdentifier: typeIdentifier]));
  }
}

NAN_METHOD(NNSItemProvider::hasRepresentationConformingToTypeIdentifierFileOptions) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, typeIdentifier);
    declare_value(NSItemProviderFileOptions, fileOptions);
    JS_SET_RETURN(js_value_BOOL([self hasRepresentationConformingToTypeIdentifier: typeIdentifier fileOptions: fileOptions]));
  }
}

#include "NNSProgress.h"

NAN_METHOD(NNSItemProvider::loadDataRepresentationForTypeIdentifierCompletionHandler) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, typeIdentifier);
    declare_callback(completionHandler);
    JS_SET_RETURN(js_value_NSProgress([self loadDataRepresentationForTypeIdentifier: typeIdentifier completionHandler:^(NSData * _Nullable data, NSError * _Nullable error) {
      dispatch_main(^{
        // TODO
      });
    }]));
  }
}

NAN_METHOD(NNSItemProvider::loadFileRepresentationForTypeIdentifierCompletionHandler) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, typeIdentifier);
    declare_callback(completionHandler);
    JS_SET_RETURN(js_value_NSProgress([self loadFileRepresentationForTypeIdentifier: typeIdentifier completionHandler:^(NSURL * _Nullable url, NSError * _Nullable error) {
      dispatch_main(^{
        // TODO
      });
    }]));
  }
}

NAN_METHOD(NNSItemProvider::loadInPlaceFileRepresentationForTypeIdentifierCompletionHandler) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, typeIdentifier);
    declare_callback(completionHandler);
    JS_SET_RETURN(js_value_NSProgress([self loadInPlaceFileRepresentationForTypeIdentifier: typeIdentifier completionHandler:^(NSURL * _Nullable url, BOOL isInPlace, NSError * _Nullable error) {
      dispatch_main(^{
        // TODO
      });
    }]));
  }
}

#include "NNSItemProviderWriting.h"

NAN_METHOD(NNSItemProvider::initWithObject) {
  JS_UNWRAP_OR_ALLOC(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(NSItemProviderWriting, object);
    JS_SET_RETURN(js_value_instancetype([self initWithObject: object]));
  }
}

NAN_METHOD(NNSItemProvider::registerObjectVisibility) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(NSItemProviderWriting, object);
    declare_value(NSItemProviderRepresentationVisibility, visibility);
    [self registerObject: object visibility: visibility];
  }
}

NAN_METHOD(NNSItemProvider::registerObjectOfClassVisibilityLoadHandler) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(Class<NSItemProviderWriting>, aClass);
    declare_value(NSItemProviderRepresentationVisibility, visibility);
    declare_value(NSProgress-pointer-_Nullable-^-void,^completionHandler,id<NSItemProviderWriting>,_Nullable,object,NSError-pointer,_Nullable,error, loadHandler);
    [self registerObjectOfClass: aClass visibility: visibility loadHandler: loadHandler];
    #endif
  }
}

NAN_METHOD(NNSItemProvider::canLoadObjectOfClass) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(Class<NSItemProviderReading>, aClass);
    JS_SET_RETURN(js_value_BOOL([self canLoadObjectOfClass: aClass]));
    #endif
  }
}

NAN_METHOD(NNSItemProvider::loadObjectOfClassCompletionHandler) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(Class<NSItemProviderReading>, aClass);
    declare_value(void-^-id<NSItemProviderReading>,_Nullable,object,NSError-pointer,_Nullable,error, completionHandler);
    JS_SET_RETURN(js_value_NSProgress([self loadObjectOfClass: aClass completionHandler: completionHandler]));
    #endif
  }
}

NAN_METHOD(NNSItemProvider::initWithItemTypeIdentifier) {
  JS_UNWRAP_OR_ALLOC(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* <NSSecureCoding>*/, item);
    declare_nullable_pointer(NSString, typeIdentifier);
    JS_SET_RETURN(js_value_instancetype([self initWithItem: item typeIdentifier: typeIdentifier]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NNSItemProvider::initWithContentsOfURL) {
  JS_UNWRAP_OR_ALLOC(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, fileURL);
    JS_SET_RETURN(js_value_instancetype([self initWithContentsOfURL: fileURL]));
  }
}

NAN_METHOD(NNSItemProvider::registerItemForTypeIdentifierLoadHandler) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, typeIdentifier);
    declare_callback(loadHandler);
    [self registerItemForTypeIdentifier: typeIdentifier loadHandler:^(NSItemProviderCompletionHandler  _Null_unspecified completionHandler, Class  _Null_unspecified __unsafe_unretained expectedValueClass, NSDictionary * _Null_unspecified options) {
      dispatch_main(^{
        // TODO
      });
    }];
  }
}

NAN_METHOD(NNSItemProvider::loadItemForTypeIdentifierOptionsCompletionHandler) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, typeIdentifier);
    declare_nullable_pointer(NSDictionary, options);
    declare_callback(completionHandler);
    [self loadItemForTypeIdentifier: typeIdentifier options: options completionHandler:^(id<NSSecureCoding>  _Nullable item, NSError * _Null_unspecified error) {
      dispatch_main(^{
        // TODO
      });
    }];
  }
}

NAN_METHOD(NNSItemProvider::loadPreviewImageWithOptionsCompletionHandler) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary, options);
    declare_callback(completionHandler);
    [self loadPreviewImageWithOptions: options completionHandler:^(id<NSSecureCoding>  _Nullable item, NSError * _Null_unspecified error) {
      dispatch_main(^{
        // TODO
      });
    }];
  }
}

NAN_GETTER(NNSItemProvider::registeredTypeIdentifiersGetter) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self registeredTypeIdentifiers]));
  }
}

NAN_GETTER(NNSItemProvider::suggestedNameGetter) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self suggestedName]));
  }
}

NAN_SETTER(NNSItemProvider::suggestedNameSetter) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setSuggestedName: input];
  }
}

NAN_GETTER(NNSItemProvider::previewImageHandlerGetter) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_NSItemProviderLoadHandler([self previewImageHandler]));
    #endif
  }
}

NAN_SETTER(NNSItemProvider::previewImageHandlerSetter) {
  JS_UNWRAP(NSItemProvider, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_value(NSItemProviderLoadHandler, input);
    [self setPreviewImageHandler: input];
    #endif
  }
}
