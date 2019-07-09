//
//  NCIFilter.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCIFilter.h"

#define instancetype CIFilter
#define js_value_instancetype js_value_CIFilter

NCIFilter::NCIFilter() {}
NCIFilter::~NCIFilter() {}

JS_INIT_CLASS(CIFilter, NSObject);
  JS_ASSIGN_STATIC_METHOD(filterWithName);
  JS_ASSIGN_STATIC_METHOD(filterWithNameWithInputParameters);
  JS_ASSIGN_STATIC_METHOD(filterNamesInCategory);
  JS_ASSIGN_STATIC_METHOD(filterNamesInCategories);
  JS_ASSIGN_STATIC_METHOD(registerFilterNameConstructorClassAttributes);
  JS_ASSIGN_STATIC_METHOD(localizedNameForFilterName);
  JS_ASSIGN_STATIC_METHOD(localizedNameForCategory);
  JS_ASSIGN_STATIC_METHOD(localizedDescriptionForFilterName);
  JS_ASSIGN_STATIC_METHOD(localizedReferenceDocumentationForFilterName);
  JS_ASSIGN_STATIC_METHOD(serializedXMPFromFiltersInputImageExtent);
  JS_ASSIGN_STATIC_METHOD(filterArrayFromSerializedXMPInputImageExtentError);
  JS_ASSIGN_PROTO_METHOD(name);
  JS_ASSIGN_PROTO_METHOD(setName);
  JS_ASSIGN_PROTO_METHOD(setDefaults);
#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
  JS_ASSIGN_PROTO_METHOD(applyArgumentsOptions);
  JS_ASSIGN_PROTO_METHOD(apply);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(outputImage);
  JS_ASSIGN_PROTO_PROP(name);
#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
  JS_ASSIGN_PROTO_PROP(isEnabled);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(inputKeys);
  JS_ASSIGN_PROTO_PROP_READONLY(outputKeys);
  JS_ASSIGN_PROTO_PROP_READONLY(attributes);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CIFilter, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(CIFilter, NSObject);

NAN_METHOD(NCIFilter::New) {
  JS_RECONSTRUCT(CIFilter);
  @autoreleasepool {
    CIFilter* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CIFilter *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CIFilter alloc] init];
    }
    if (self) {
      NCIFilter *wrapper = new NCIFilter();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CIFilter::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCIFilter::filterWithName) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_CIFilter([CIFilter filterWithName: name]));
  }
}

NAN_METHOD(NCIFilter::filterWithNameWithInputParameters) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_pointer(NSDictionary/* <NSString*, id>*/, params);
    JS_SET_RETURN(js_value_CIFilter([CIFilter filterWithName: name withInputParameters: params]));
  }
}

NAN_METHOD(NCIFilter::filterNamesInCategory) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, category);
    JS_SET_RETURN(js_value_NSArray<NSString*>([CIFilter filterNamesInCategory: category]));
  }
}

NAN_METHOD(NCIFilter::filterNamesInCategories) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSArray<NSString*>, categories);
    JS_SET_RETURN(js_value_NSArray<NSString*>([CIFilter filterNamesInCategories: categories]));
  }
}

NAN_METHOD(NCIFilter::registerFilterNameConstructorClassAttributes) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(id/* <CIFilterConstructor>*/, anObject);
    declare_pointer(NSDictionary/* <NSString*, id>*/, attributes);
    [CIFilter registerFilterName: name constructor: anObject classAttributes: attributes];
  }
}

NAN_METHOD(NCIFilter::localizedNameForFilterName) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, filterName);
    JS_SET_RETURN(js_value_NSString([CIFilter localizedNameForFilterName: filterName]));
  }
}

NAN_METHOD(NCIFilter::localizedNameForCategory) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, category);
    JS_SET_RETURN(js_value_NSString([CIFilter localizedNameForCategory: category]));
  }
}

NAN_METHOD(NCIFilter::localizedDescriptionForFilterName) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, filterName);
    JS_SET_RETURN(js_value_NSString([CIFilter localizedDescriptionForFilterName: filterName]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NCIFilter::localizedReferenceDocumentationForFilterName) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, filterName);
    JS_SET_RETURN(js_value_NSURL([CIFilter localizedReferenceDocumentationForFilterName: filterName]));
  }
}

NAN_METHOD(NCIFilter::serializedXMPFromFiltersInputImageExtent) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<CIFilter*>, filters);
    declare_value(CGRect, extent);
    JS_SET_RETURN(js_value_NSData([CIFilter serializedXMPFromFilters: filters inputImageExtent: extent]));
  }
}

NAN_METHOD(NCIFilter::filterArrayFromSerializedXMPInputImageExtentError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, xmpData);
    declare_value(CGRect, extent);
    declare_error();
    JS_SET_RETURN(js_value_NSArray<CIFilter*>([CIFilter filterArrayFromSerializedXMP: xmpData inputImageExtent: extent error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NCIFilter::name) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_METHOD(NCIFilter::setName) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, aString);
    [self setName: aString];
  }
}

NAN_METHOD(NCIFilter::setDefaults) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    [self setDefaults];
  }
}

#include "NCIKernel.h"

#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
NAN_METHOD(NCIFilter::applyArgumentsOptions) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIKernel, k);
    declare_nullable_pointer(NSArray, args);
    declare_nullable_pointer(NSDictionary/* <NSString*, id>*/, dict);
    JS_SET_RETURN(js_value_CIImage([self apply: k arguments: args options: dict]));
  }
}
#endif

#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
NAN_METHOD(NCIFilter::apply) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIKernel, k);
    JS_SET_RETURN(js_value_CIImage([self apply: k]));
  }
}
#endif

#include "NCIImage.h"

NAN_GETTER(NCIFilter::outputImageGetter) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIImage([self outputImage]));
  }
}

NAN_GETTER(NCIFilter::nameGetter) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NCIFilter::nameSetter) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
NAN_GETTER(NCIFilter::isEnabledGetter) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NCIFilter::isEnabledSetter) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnabled: input];
  }
}
#endif

NAN_GETTER(NCIFilter::inputKeysGetter) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self inputKeys]));
  }
}

NAN_GETTER(NCIFilter::outputKeysGetter) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self outputKeys]));
  }
}

NAN_GETTER(NCIFilter::attributesGetter) {
  JS_UNWRAP(CIFilter, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self attributes]));
  }
}

