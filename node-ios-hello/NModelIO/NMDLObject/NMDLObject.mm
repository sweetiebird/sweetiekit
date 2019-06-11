//
//  NMDLObject.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLObject.h"

#define instancetype MDLObject
#define js_value_instancetype js_value_MDLObject

#include "NMDLTypes.h"

NMDLObject::NMDLObject() {}
NMDLObject::~NMDLObject() {}

JS_INIT_CLASS(MDLObject, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(setComponentForProtocol);
  JS_ASSIGN_PROTO_METHOD(componentConformingToProtocol);
  JS_ASSIGN_PROTO_METHOD(objectForKeyedSubscript);
  JS_ASSIGN_PROTO_METHOD(setObjectForKeyedSubscript);
  JS_ASSIGN_PROTO_METHOD(objectAtPath);
  JS_ASSIGN_PROTO_METHOD(enumerateChildObjectsOfClass);
  JS_ASSIGN_PROTO_METHOD(addChild);
  JS_ASSIGN_PROTO_METHOD(boundingBoxAtTime);
  JS_ASSIGN_PROTO_PROP_READONLY(components);
  JS_ASSIGN_PROTO_PROP(parent);
  JS_ASSIGN_PROTO_PROP(instance);
  JS_ASSIGN_PROTO_PROP_READONLY(path);
  JS_ASSIGN_PROTO_PROP(transform);
  JS_ASSIGN_PROTO_PROP(children);
  JS_ASSIGN_PROTO_PROP(hidden);
  // static members (ctor)
  JS_INIT_CTOR(MDLObject, NSObject);
  JS_ASSIGN_STATIC_METHOD(objectWithSCNNode);
  JS_ASSIGN_STATIC_METHOD(objectWithSCNNodeBufferAllocator);

JS_INIT_CLASS_END(MDLObject, NSObject);

NAN_METHOD(NMDLObject::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLObject(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLObject, info);
      return;
    }

    MDLObject* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLObject *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLObject alloc] init];
    }
    if (self) {
      NMDLObject *wrapper = new NMDLObject();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLObject::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMDLObject::setComponentForProtocol) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MDLComponent>*/, component);
    declare_value(id/* <Protocol>*/, protocol);
    [self setComponent: component forProtocol: protocol];
  }
}

NAN_METHOD(NMDLObject::componentConformingToProtocol) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <Protocol>*/, protocol);
    JS_SET_RETURN(js_value_id/* <MDLComponent>*/([self componentConformingToProtocol: protocol]));
  }
}

NAN_METHOD(NMDLObject::objectForKeyedSubscript) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <Protocol>*/, key);
    JS_SET_RETURN(js_value_id/* <MDLComponent>*/([self objectForKeyedSubscript: key]));
  }
}

NAN_METHOD(NMDLObject::setObjectForKeyedSubscript) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* <MDLComponent>*/, obj);
    declare_value(id/* <Protocol>*/, key);
    [self setObject: obj forKeyedSubscript: key];
  }
}

NAN_METHOD(NMDLObject::objectAtPath) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    JS_SET_RETURN(js_value_MDLObject([self objectAtPath: path]));
  }
}

NAN_METHOD(NMDLObject::enumerateChildObjectsOfClass) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <Class>*/, objectClass);
    declare_pointer(MDLObject, root)
    declare_callback_function(block);
    BOOL stop = NO;
    [self enumerateChildObjectsOfClass:objectClass root:root usingBlock:^(MDLObject * _Nonnull object, BOOL * _Nonnull stop) {
      dispatch_main(^{
        // TODO: stop pointer
        block("NMDLObject::enumerateChildObjectsOfClass", js_value_MDLObject(object));
      });
    } stopPointer:&stop];
  }
}

NAN_METHOD(NMDLObject::addChild) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLObject, child);
    [self addChild: child];
  }
}

NAN_METHOD(NMDLObject::boundingBoxAtTime) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, time);
    JS_SET_RETURN(js_value_MDLAxisAlignedBoundingBox([self boundingBoxAtTime: time]));
  }
}

NAN_GETTER(NMDLObject::componentsGetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<id<MDLComponent>>([self components]));
  }
}

NAN_GETTER(NMDLObject::parentGetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLObject([self parent]));
  }
}

NAN_SETTER(NMDLObject::parentSetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLObject, input);
    [self setParent: input];
  }
}

NAN_GETTER(NMDLObject::instanceGetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MDLObject([self instance]));
  }
}

NAN_SETTER(NMDLObject::instanceSetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MDLObject, input);
    [self setInstance: input];
  }
}

NAN_GETTER(NMDLObject::pathGetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self path]));
  }
}

NAN_GETTER(NMDLObject::transformGetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLTransformComponent>*/([self transform]));
  }
}

NAN_SETTER(NMDLObject::transformSetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLTransformComponent>*/, input);
    [self setTransform: input];
  }
}

NAN_GETTER(NMDLObject::childrenGetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MDLObjectContainerComponent>*/([self children]));
  }
}

NAN_SETTER(NMDLObject::childrenSetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MDLObjectContainerComponent>*/, input);
    [self setChildren: input];
  }
}

NAN_GETTER(NMDLObject::hiddenGetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidden]));
  }
}

NAN_SETTER(NMDLObject::hiddenSetter) {
  JS_UNWRAP(MDLObject, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidden: input];
  }
}

#include <SceneKit/ModelIO.h>
#include "NSCNNode.h"

NAN_METHOD(NMDLObject::objectWithSCNNode) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNNode, scnNode);
    JS_SET_RETURN(js_value_instancetype([MDLObject objectWithSCNNode: scnNode]));
  }
}

NAN_METHOD(NMDLObject::objectWithSCNNodeBufferAllocator) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNNode, scnNode);
    declare_nullable_value(id/* <MDLMeshBufferAllocator>*/, bufferAllocator);
    JS_SET_RETURN(js_value_instancetype([MDLObject objectWithSCNNode: scnNode bufferAllocator: bufferAllocator]));
  }
}
