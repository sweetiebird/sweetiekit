//
//  NVNRequest.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNRequest.h"

#import <Vision/VNRequest.h>

#define instancetype VNRequest
#define js_value_instancetype js_value_VNRequest

NVNRequest::NVNRequest() {}
NVNRequest::~NVNRequest() {}

JS_INIT_CLASS(VNRequest, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(cancel);
  JS_ASSIGN_PROTO_PROP(preferBackgroundProcessing);
  JS_ASSIGN_PROTO_PROP(usesCPUOnly);
  JS_ASSIGN_PROTO_PROP_READONLY(results);
  JS_ASSIGN_PROTO_PROP_READONLY(completionHandler);
  JS_ASSIGN_PROTO_PROP(revision);
  JS_ASSIGN_STATIC_PROP_READONLY(supportedRevisions);
  JS_ASSIGN_STATIC_PROP_READONLY(defaultRevision);
  JS_ASSIGN_STATIC_PROP_READONLY(currentRevision);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNRequest, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(VNRequest, NSObject);

NAN_METHOD(NVNRequest::New) {
  JS_RECONSTRUCT(VNRequest);
  @autoreleasepool {
    VNRequest* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNRequest *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNRequest alloc] init];
    }
    if (self) {
      NVNRequest *wrapper = new NVNRequest();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNRequest::New: invalid arguments");
    }
  }
}

#include "NVNRequest.h"
#include "NNSError.h"

NAN_METHOD(NVNRequest::initWithCompletionHandler) {
  JS_UNWRAP_OR_ALLOC(VNRequest, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(completionHandler);
    JS_SET_RETURN(js_value_instancetype([self initWithCompletionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NVNRequestProgressProviding::progressHandler",
            js_value_VNRequest(request),
            js_value_NSError(error));
        }
      });
    }]));
  }
}

NAN_METHOD(NVNRequest::cancel) {
  JS_UNWRAP(VNRequest, self);
  declare_autoreleasepool {
    [self cancel];
  }
}

NAN_GETTER(NVNRequest::preferBackgroundProcessingGetter) {
  JS_UNWRAP(VNRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self preferBackgroundProcessing]));
  }
}

NAN_SETTER(NVNRequest::preferBackgroundProcessingSetter) {
  JS_UNWRAP(VNRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPreferBackgroundProcessing: input];
  }
}

NAN_GETTER(NVNRequest::usesCPUOnlyGetter) {
  JS_UNWRAP(VNRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self usesCPUOnly]));
  }
}

NAN_SETTER(NVNRequest::usesCPUOnlySetter) {
  JS_UNWRAP(VNRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUsesCPUOnly: input];
  }
}

NAN_GETTER(NVNRequest::resultsGetter) {
  JS_UNWRAP(VNRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray([self results]));
  }
}

NAN_GETTER(NVNRequest::completionHandlerGetter) {
  JS_UNWRAP(VNRequest, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_VNRequestCompletionHandler([self completionHandler]));
    #endif
  }
}

NAN_GETTER(NVNRequest::revisionGetter) {
  JS_UNWRAP(VNRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self revision]));
  }
}

NAN_SETTER(NVNRequest::revisionSetter) {
  JS_UNWRAP(VNRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setRevision: input];
  }
}

#include "NNSIndexSet.h"

NAN_GETTER(NVNRequest::supportedRevisionsGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexSet([VNRequest supportedRevisions]));
  }
}

NAN_GETTER(NVNRequest::defaultRevisionGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([VNRequest defaultRevision]));
  }
}

NAN_GETTER(NVNRequest::currentRevisionGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([VNRequest currentRevision]));
  }
}
