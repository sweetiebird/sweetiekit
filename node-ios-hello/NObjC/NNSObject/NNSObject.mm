//
//  NNSObject.m
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSObject.h"

@implementation NSObject (CategoryNSObject)

#pragma mark Associated Methods:

- (void) associateValue:(id)value withKey:(NSString *)aKey {
  
  objc_setAssociatedObject(self, (void *)NSSelectorFromString(aKey), value, OBJC_ASSOCIATION_RETAIN);
}

- (id) associatedValueForKey:(NSString *)aKey {
  
  return objc_getAssociatedObject(self, (void *)NSSelectorFromString(aKey));
}

- (void) dissociateValueForKey:(NSString *)aKey {
  objc_setAssociatedObject(self, (void *)NSSelectorFromString(aKey), nil, OBJC_ASSOCIATION_RETAIN);
}

@end

Nid::Nid() : _self(nullptr) {}
Nid::~Nid() {}

NAN_METHOD(_NSSelectorFromString)
{
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    SEL result = NSSelectorFromString(name);
    JS_SET_RETURN(js_value_SEL(result));
  }
}

NAN_METHOD(_NSSelectorFromStringAddress)
{
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    SEL result = NSSelectorFromString(name);
    Local<Array> array = Nan::New<Array>(2);
    size_t address = (size_t)(void*)result;
    array->Set(0, Nan::New<Integer>((uint32_t)(address >> 32)));
    array->Set(1, Nan::New<Integer>((uint32_t)(address & 0xFFFFFFFF)));
    JS_SET_RETURN(array);
  }
}

#include "NDispatchQueue.h"

JS_INIT_CLASS_BASE(id, nil);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, self);
  JS_ASSIGN_PROP_READONLY(proto, selfPointer);
  JS_ASSIGN_PROP_READONLY(proto, selfAddress);
  JS_ASSIGN_PROP_READONLY(proto, class);
  JS_ASSIGN_PROP_READONLY(proto, superclass);
  JS_ASSIGN_PROP_READONLY(proto, metaclass);
  JS_ASSIGN_PROP_READONLY(proto, className);
  JS_ASSIGN_PROP_READONLY(proto, description);
  JS_ASSIGN_PROP_READONLY(proto, debugDescription);
  JS_ASSIGN_PROP_READONLY(proto, methods);
  JS_ASSIGN_PROP_READONLY(proto, properties);
  JS_ASSIGN_METHOD(proto, invokeBooleanGetter);
  JS_ASSIGN_METHOD(proto, invokeBooleanSetter);
  JS_ASSIGN_METHOD(proto, invoke);
  // static members (ctor)
  JS_INIT_CTOR(id, objc);
  Nan::SetMethod(ctor, "NSSelectorFromString", _NSSelectorFromString);
  Nan::SetMethod(ctor, "NSSelectorFromStringAddress", _NSSelectorFromStringAddress);
  Nan::SetMethod(ctor, "NSClassFromString", _NSClassFromString);
  Nan::SetMethod(ctor, "objc_msgSend", _objc_msgSend);
  Nan::SetMethod(ctor, "NSSearchPathForDirectoriesInDomains", _NSSearchPathForDirectoriesInDomains);
  sweetiekit::Set(ctor, "dispatch_ui_sync", ^(JSInfo info) {
    declare_autoreleasepool {
      declare_args();
      declare_optional_value(dispatch_queue_t, queue, dispatch_get_main_queue());
      declare_callback(thunk);
      if (thunk) {
        dispatch_ui_sync(queue, ^{
          if ([thunk jsFunction]) {
            [thunk jsFunction]->Call("dispatch_ui_sync");
          }
        });
      }
    }
  });
  sweetiekit::Set(ctor, "dispatch_ui_async", ^(JSInfo info) {
    declare_autoreleasepool {
      declare_args();
      declare_optional_value(dispatch_queue_t, queue, dispatch_get_main_queue());
      declare_callback(thunk);
      if (thunk) {
        dispatch_ui_async(queue, ^{
          if ([thunk jsFunction]) {
            [thunk jsFunction]->Call("dispatch_ui_async");
          }
        });
      }
    }
  });
  sweetiekit::Set(ctor, "classFromString", ^(JSInfo info) {
    Nan::HandleScope scope;
    Class cls = NSClassFromString(NJSStringToNSString(info[0]));
    JS_SET_RETURN(sweetiekit::GetWrapperFor(cls, NNSObject::type));
  });
  sweetiekit::Set(ctor, "metaclassFromString", ^(JSInfo info) {
    Nan::HandleScope scope;
    Class cls = NSClassFromString(NJSStringToNSString(info[0]));
    if (cls != nullptr) {
      cls = object_getClass(cls);
      JS_SET_RETURN(sweetiekit::GetWrapperFor(cls, NNSObject::type));
    }
  });
  sweetiekit::Set(ctor, "stringFromClass", ^(JSInfo info) {
    Nan::HandleScope scope;
    NNSObject* ncls = ObjectWrap::Unwrap<NNSObject>(JS_OBJ(info[0]));
    @autoreleasepool {
      if (!ncls->IsClass()) {
        Nan::ThrowError("NSObject.stringFromClass: argument isn't a class");
      } else {
        Class cls = ncls->AsClass();
        NSString* clsStr = NSStringFromClass(cls);
        JS_SET_RETURN(JS_STR([clsStr UTF8String]));
      }
    }
  });
JS_INIT_CLASS_END(id, objc);

NAN_METHOD(Nid::New) {
  JS_RECONSTRUCT(id);
  @autoreleasepool {
    id self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id)(info[0].As<External>()->Value());
    }
    if (!self && info.Length() > 0 && !info[0]->IsNullOrUndefined() && !info[0]->IsExternal()) {
      Nan::ThrowError("Nid::New: invalid arguments");
    } else {
      Nid *wrapper = new Nid();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    }
  }
}

NAN_GETTER(Nid::classGetter) {
  JS_UNWRAP_(id, ns);

  JS_SET_RETURN(js_value_id([ns class]));
}

NAN_GETTER(Nid::superclassGetter) {
  JS_UNWRAP_(id, ns);

  JS_SET_RETURN(js_value_id([ns superclass]));
}

NAN_GETTER(Nid::metaclassGetter) {
  JS_UNWRAP_(id, ns);

  JS_SET_RETURN(js_value_id(object_getClass([ns class])));
}

NAN_GETTER(Nid::classNameGetter) {
  JS_UNWRAP_(id, ns);
  JS_SET_RETURN(js_value_NSString(NSStringFromClass([ns class])));
}

NAN_GETTER(Nid::descriptionGetter) {
  JS_UNWRAP_(id, ns);
  JS_SET_RETURN(js_value_NSString([ns description]));
}

NAN_GETTER(Nid::debugDescriptionGetter) {
  JS_UNWRAP_(id, ns);
  JS_SET_RETURN(js_value_NSString([ns debugDescription]));
}

class JS_FREE_STR {
public:
  JS_FREE_STR(char* str) : _str(str) {}
  virtual ~JS_FREE_STR() { free(_str); }
  operator Local<Value>() { return JS_STR(_str); }
  char* _str;
};

NAN_GETTER(Nid::methodsGetter) {
  JS_UNWRAP_(id, ns);
  @autoreleasepool {
    if (!object_isClass(ns)) {
      Nan::ThrowError("id:methods: not a class");
      return;
    }
    Class cls = nns->AsClass();
    
    Local<Array> result = Nan::New<Array>();
    __block unsigned int n = 0;
    sweetiekit::forEachMethodInClass(cls, ^(Method m) {
      Local<Object> obj = Nan::New<Object>();
      auto argc = method_getNumberOfArguments(m);
      obj->Set(JS_STR("name"), JS_STR([NSStringFromSelector(method_getName(m)) UTF8String]));
      obj->Set(JS_STR("returnType"), JS_FREE_STR(method_copyReturnType(m)));
      Local<Array> argv = Nan::New<Array>();
      for (auto i = 0; i < argc; i++) {
        argv->Set(i, JS_FREE_STR(method_copyArgumentType(m, i)));
      }
      obj->Set(JS_STR("arguments"), argv);
      obj->Set(JS_STR("typeEncoding"), JS_STR(method_getTypeEncoding(m)));
      result->Set(n, obj);
      n++;
    });
    JS_SET_RETURN(result);
  }
}

NAN_GETTER(Nid::propertiesGetter) {
  JS_UNWRAP_(id, ns);
  @autoreleasepool {
    if (!object_isClass(ns)) {
      Nan::ThrowError("id:properties: not a class");
      return;
    }
    Class cls = nns->AsClass();
    
    Local<Array> result = Nan::New<Array>();
    __block unsigned int n = 0;
    sweetiekit::forEachPropertyInClass(cls, ^(objc_property_t p) {
      Local<Object> obj = Nan::New<Object>();
      obj->Set(JS_STR("name"), JS_STR(property_getName(p)));
      obj->Set(JS_STR("attributes"), JS_STR(property_getAttributes(p)));
      result->Set(n, obj);
      n++;
    });
    JS_SET_RETURN(result);
  }
}

NAN_METHOD(Nid::invokeBooleanGetter)
{
  JS_UNWRAP_(id, self);
  @autoreleasepool {
    if (!self) {
      Nan::ThrowError("Nid::invokeBooleanGetter: self is nil");
      return;
    }
    Class cls = [self class];
    if (!cls) {
      Nan::ThrowError("Nid::invokeBooleanGetter: [self class] is nil");
      return;
    }
  
    NSString* name = NJSStringToNSString(info[0]);
    if (!name) {
      Nan::ThrowError("Nid::invokeBooleanGetter: expected 1st argument to be a string");
      return;
    }
    
    SEL sel = NSSelectorFromString(name);
    if (!sel) {
      Nan::ThrowError("Nid::invokeBooleanGetter: NSSelectorFromString returned nil");
      return;
    }
    
    NSMethodSignature * sig = [cls instanceMethodSignatureForSelector:sel];
    if (!sig) {
      Nan::ThrowError("Nid::invokeBooleanGetter: [[self class] instanceMethodSignatureForSelector:] returned nil");
      return;
    }
    
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
    if (!inv) {
      Nan::ThrowError("Nid::invokeBooleanGetter: [NSInvocation invocationWithMethodSignature:] returned nil");
      return;
    }
    
    [inv setSelector:sel];
    [inv invokeWithTarget:self];
    bool result = false;
    [inv getReturnValue:&result];
    JS_SET_RETURN(JS_BOOL(result));
  }
}

NAN_METHOD(Nid::invokeBooleanSetter)
{
  Nan::HandleScope scope;
  
  JS_UNWRAP_(id, self);
  @autoreleasepool {
    if (!self) {
      Nan::ThrowError("Nid::invokeBooleanSetter: self is nil");
      return;
    }
    
    Class cls = [self class];
    if (!cls) {
      Nan::ThrowError("Nid::invokeBooleanSetter: [self class] is nil");
      return;
    }
    
    NSString* name = NJSStringToNSString(info[0]);
    if (!name) {
      Nan::ThrowError("Nid::invokeBooleanSetter: expected 1st argument to be a string");
      return;
    }
    
    SEL sel = NSSelectorFromString(name);
    if (!sel) {
      Nan::ThrowError("Nid::invokeBooleanSetter: NSSelectorFromString returned nil");
      return;
    }
    
    bool value = info[1]->BooleanValue(JS_ISOLATE());
    NSMethodSignature * sig = [cls instanceMethodSignatureForSelector:sel];
    if (!sig) {
      Nan::ThrowError("Nid::invokeBooleanSetter: [[self class] instanceMethodSignatureForSelector:] returned nil");
      return;
    }
    
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
    if (!inv) {
      Nan::ThrowError("Nid::invokeBooleanSetter: [NSInvocation invocationWithMethodSignature:] returned nil");
      return;
    }
    
    [inv setSelector:sel];
    [inv setArgument:&value atIndex:2];
    [inv invokeWithTarget:self];
  }
}

NAN_METHOD(Nid::_NSClassFromString)
{
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    Class result = NSClassFromString(name);
    JS_SET_RETURN(js_value_id/* Class*/(result));
  }
}

NAN_METHOD(Nid::_NSSearchPathForDirectoriesInDomains)
{
  @autoreleasepool {
    declare_args();
    declare_value(NSSearchPathDirectory, directory);
    declare_value(NSSearchPathDomainMask, domainMask);
    declare_value(BOOL, expandTilde);
    JS_SET_RETURN(js_value_NSArray(NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde)));
  }
}

id to_id(Local<Value> jsValue, bool* failed = nullptr) {
  return to_value_id(jsValue, failed);
}

#include "Nobjc.h"

NAN_METHOD(Nid::_objc_msgSend)
{
  @autoreleasepool {
    bool failed = false;
    id obj = to_id(info[0], &failed);
    if (failed) {
      Nan::ThrowError("Nid::objc_msgSend: expected first argument to be an id");
      return;
    }
    if (!obj) {
      Nan::ThrowError("Nid::objc_msgSend: first argument is nil");
      return;
    }
    NSString* name = to_value_NSString(info[1]);
    if (!name) {
      Nan::ThrowError("Nid::objc_msgSend: expected second argument to be a SEL (string)");
      return;
    }
    
    SEL sel = NSSelectorFromString(name);
    if (!sel) {
      Nan::ThrowError("Nid::objc_msgSend: NSSelectorFromString returned nil");
      return;
    }
    
    switch (info.Length()) {
      case 2: {
#if TODO_IOS13
        nobjc_msgSend0(obj, sel);
#endif
      } break;
      default: {
        Nan::ThrowError("Nid::objc_msgSend: input arguments not yet implemented");
        return;
      }
    }
  }
}

NAN_METHOD(Nid::invoke)
{
  Nan::HandleScope scope;
  
  JS_UNWRAP_(id, self);
  @autoreleasepool {
    if (!self) {
      Nan::ThrowError("Nid::invoke: self is nil");
      return;
    }
    
    if (!info[0]->IsArray()) {
      Nan::ThrowError("Nid::invoke: expected first argument to be an array");
      return;
    }
    
    Local<Array> spec = Local<Array>::Cast(info[0]);
    
    NSString* returnTypeSpec = NJSStringToNSString(spec->Get(0));
    if (!returnTypeSpec) {
      Nan::ThrowError("Nid::invoke: expected first value of first argument to be a string");
      return;
    }
    
    NSString* name = NJSStringToNSString(spec->Get(1));
    if (!name) {
      Nan::ThrowError("Nid::invoke: expected last value of first argument to be a string");
      return;
    }
    
    SEL sel = NSSelectorFromString(name);
    if (!sel) {
      Nan::ThrowError("Nid::invoke: NSSelectorFromString returned nil");
      return;
    }
    
    NSMethodSignature * sig = nullptr;
    if (object_isClass(self)) {
      sig = [self methodSignatureForSelector:sel];
      if (!sig) {
        Nan::ThrowError("Nid::invoke: [self methodSignatureForSelector:] returned nil");
        return;
      }
    } else {
      Class cls = [self class];
      if (!cls) {
        Nan::ThrowError("Nid::invoke: [self class] is nil");
        return;
      }
      sig = [cls instanceMethodSignatureForSelector:sel];
      if (!sig) {
        Nan::ThrowError("Nid::invoke: [[self class] instanceMethodSignatureForSelector:] returned nil");
        return;
      }
    }
    
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
    if (!inv) {
      Nan::ThrowError("Nid::invoke: [NSInvocation invocationWithMethodSignature:] returned nil");
      return;
    }
    
    [inv setSelector:sel];
    
    for (unsigned int i = 1; i < info.Length(); i++) {
      if (!info[i]->IsArray()) {
        Nan::ThrowError("Nid::invoke: expected argument to be an array");
        return;
      }
      Local<Array> arg = Local<Array>::Cast(info[i]);
      
      NSString* typeSpec = NJSStringToNSString(arg->Get(0));
      if (!typeSpec) {
        Nan::ThrowError("Nid::invoke: expected first value of argument to be a string");
        return;
      }
      
      char type = [typeSpec UTF8String][0];
      Local<Value> jsValue = arg->Get(1);
      switch (type)
      {
        case 'B':
        {
          bool value = jsValue->BooleanValue(JS_ISOLATE());
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'i':
        {
          int32_t value = TO_INT32(jsValue);
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'I':
        {
          uint32_t value = TO_UINT32(jsValue);
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'd':
        {
          double value = TO_DOUBLE(jsValue);
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'f':
        {
          float value = TO_FLOAT(jsValue);
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'q':
        {
          double value = TO_DOUBLE(jsValue);
          long long value1 = (long long)value;
          [inv setArgument:&value1 atIndex:1+i];
        } break;
        case 'Q':
        {
          double value = TO_DOUBLE(jsValue);
          unsigned long long value1 = (unsigned long long)value;
          [inv setArgument:&value1 atIndex:1+i];
        } break;
        case '@':
        {
          bool failed = false;
          id value = to_id(jsValue, &failed);
          if (failed) {
            Nan::ThrowError("id::invoke: Failed to convert argument to id");
            return;
          }
          [inv setArgument:&value atIndex:1+i];
        } break;
        default:
        {
          Nan::ThrowError("id::invoke: Unknown type specifier");
          return;
        } break;
      }
    }
    [inv setTarget:self];
    [inv invoke];
    
    char returnType = [returnTypeSpec UTF8String][0];
    switch (returnType)
    {
      case 'B':
      {
        bool value = false;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_BOOL(value));
      } break;
      case 'i':
      {
        int32_t value = 0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_INT(value));
      } break;
      case 'I':
      {
        uint32_t value = 0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_UINT(value));
      } break;
      case 'd':
      {
        double value = 0.0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_NUM(value));
      } break;
      case 'f':
      {
        float value = 0.0f;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_FLOAT(value));
      } break;
      case 'q':
      {
        long long value = 0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_NUM(value));
      } break;
      case 'Q':
      {
        unsigned long long value = 0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_NUM(value));
      } break;
      case 'v':
      {
        // void
      } break;
      case 's':
      {
        void* value = nullptr;
        [inv getReturnValue:&value];
        if (value) {
          if (![(__bridge id)value isKindOfClass:[NSString class]]) {
            Nan::ThrowError("id::invoke: returned value was not an NSString");
            return;
          }
          JS_SET_RETURN(JS_STR([(__bridge NSString*)value UTF8String]));
        }
      } break;
      case '@':
      {
        __weak id value = nil;
        [inv getReturnValue:&value];
        JS_SET_RETURN(js_value_id(value));
      } break;
      default:
      {
        Nan::ThrowError("id::invoke: Unknown return type specifier");
        return;
      } break;
    }
  }
}

NAN_GETTER(Nid::selfGetter) {
  JS_SET_RETURN(info.This());
}

NAN_GETTER(Nid::selfPointerGetter) {
  JS_UNWRAP_(id, self);
  JS_SET_RETURN(Nan::New<External>((__bridge void*)self));
}

NAN_GETTER(Nid::selfAddressGetter) {
  JS_UNWRAP_(id, self);

  Local<Array> array = Nan::New<Array>(2);
  size_t address = (size_t)(__bridge void*)self;
  array->Set(0, Nan::New<Integer>((uint32_t)(address >> 32)));
  array->Set(1, Nan::New<Integer>((uint32_t)(address & 0xFFFFFFFF)));
  JS_SET_RETURN(array);
}

NNSObject::NNSObject() {}
NNSObject::~NNSObject() {}

JS_INIT_CLASS(NSObject, id);
  JS_ASSIGN_PROTO_METHOD(associatedValueForKey);
  JS_ASSIGN_PROTO_METHOD(associateValueWithKey);

  // NSKeyValueCoding.h
  JS_ASSIGN_PROTO_METHOD(valueForKey);
  JS_ASSIGN_PROTO_METHOD(setValueForKey);
  JS_ASSIGN_PROTO_METHOD(validateValueForKeyError);
  JS_ASSIGN_PROTO_METHOD(mutableArrayValueForKey);
  JS_ASSIGN_PROTO_METHOD(mutableOrderedSetValueForKey);
  JS_ASSIGN_PROTO_METHOD(mutableSetValueForKey);
  JS_ASSIGN_PROTO_METHOD(valueForKeyPath);
  JS_ASSIGN_PROTO_METHOD(setValueForKeyPath);
  JS_ASSIGN_PROTO_METHOD(validateValueForKeyPathError);
  JS_ASSIGN_PROTO_METHOD(mutableArrayValueForKeyPath);
  JS_ASSIGN_PROTO_METHOD(mutableOrderedSetValueForKeyPath);
  JS_ASSIGN_PROTO_METHOD(mutableSetValueForKeyPath);
  JS_ASSIGN_PROTO_METHOD(valueForUndefinedKey);
  JS_ASSIGN_PROTO_METHOD(setValueForUndefinedKey);
  JS_ASSIGN_PROTO_METHOD(setNilValueForKey);
  JS_ASSIGN_PROTO_METHOD(dictionaryWithValuesForKeys);
  JS_ASSIGN_PROTO_METHOD(setValuesForKeysWithDictionary);
#if TODO
// NSArray<ObjectType>
  JS_ASSIGN_PROTO_METHOD(valueForKey);
  JS_ASSIGN_PROTO_METHOD(setValueForKey);
// NSDictionary<KeyType
  JS_ASSIGN_PROTO_METHOD(valueForKey);
// NSMutableDictionary<KeyType
  JS_ASSIGN_PROTO_METHOD(setValueForKey);
// NSOrderedSet<ObjectType>
  JS_ASSIGN_PROTO_METHOD(valueForKey);
  JS_ASSIGN_PROTO_METHOD(setValueForKey);
// NSSet<ObjectType>
  JS_ASSIGN_PROTO_METHOD(valueForKey);
  JS_ASSIGN_PROTO_METHOD(setValueForKey);
#endif
// NSObject
#if UNAVAILABLE
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
  JS_ASSIGN_STATIC_METHOD(useStoredAccessor);
  JS_ASSIGN_PROTO_METHOD(storedValueForKey);
  JS_ASSIGN_PROTO_METHOD(takeStoredValueForKey);
  JS_ASSIGN_PROTO_METHOD(takeValueForKey);
  JS_ASSIGN_PROTO_METHOD(takeValueForKeyPath);
  JS_ASSIGN_PROTO_METHOD(handleQueryWithUnboundKey);
  JS_ASSIGN_PROTO_METHOD(handleTakeValueForUnboundKey);
  JS_ASSIGN_PROTO_METHOD(unableToSetNilForKey);
  JS_ASSIGN_PROTO_METHOD(valuesForKeys);
  JS_ASSIGN_PROTO_METHOD(takeValuesFromDictionary);
#endif
#endif
#if TODO
  JS_ASSIGN_STATIC_PROP_READONLY(accessInstanceVariablesDirectly);
#endif

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSObject, id);
JS_INIT_CLASS_END(NSObject, id);

NAN_METHOD(NNSObject::New) {
  JS_RECONSTRUCT(NSObject);
  @autoreleasepool {
    NSObject* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSObject *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSObject alloc] init];
    }
    if (self) {
      NNSObject *wrapper = new NNSObject();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSObject::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSObject::associatedValueForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self associatedValueForKey:key]));
  }
}

NAN_METHOD(NNSObject::associateValueWithKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_pointer(NSString, key);
    [self associateValue:value withKey:key];
  }
}

NAN_METHOD(NNSObject::valueForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self valueForKey: key]));
  }
}

NAN_METHOD(NNSObject::setValueForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_pointer(NSString, key);
    [self setValue: value forKey: key];
  }
}

NAN_METHOD(NNSObject::validateValueForKeyError) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(inout-id-_Nullable-pointer-_Nonnull, ioValue);
    declare_pointer(NSString, inKey);
    declare_pointer(out-NSError-pointer, outError);
    JS_SET_RETURN(js_value_BOOL([self validateValue: ioValue forKey: inKey error: outError]));
    #endif
  }
}

NAN_METHOD(NNSObject::mutableArrayValueForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_NSMutableArray([self mutableArrayValueForKey: key]));
  }
}

#define js_value_NSMutableOrderedSet(x) js_value_wrapper_unknown(x, NSMutableOrderedSet)
#define to_value_NSMutableOrderedSet(x) to_value_wrapper_unknown(x, NSMutableOrderedSet)
#define is_value_NSMutableOrderedSet(x) is_value_wrapper_unknown(x, NSMutableOrderedSet)

NAN_METHOD(NNSObject::mutableOrderedSetValueForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_NSMutableOrderedSet([self mutableOrderedSetValueForKey: key]));
  }
}

NAN_METHOD(NNSObject::mutableSetValueForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_NSMutableSet([self mutableSetValueForKey: key]));
  }
}

NAN_METHOD(NNSObject::valueForKeyPath) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, keyPath);
    JS_SET_RETURN(js_value_id([self valueForKeyPath: keyPath]));
  }
}

NAN_METHOD(NNSObject::setValueForKeyPath) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_pointer(NSString, keyPath);
    [self setValue: value forKeyPath: keyPath];
  }
}

NAN_METHOD(NNSObject::validateValueForKeyPathError) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(inout-id-_Nullable-pointer-_Nonnull, ioValue);
    declare_pointer(NSString, inKeyPath);
    declare_pointer(out-NSError-pointer, outError);
    JS_SET_RETURN(js_value_BOOL([self validateValue: ioValue forKeyPath: inKeyPath error: outError]));
    #endif
  }
}

NAN_METHOD(NNSObject::mutableArrayValueForKeyPath) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, keyPath);
    JS_SET_RETURN(js_value_NSMutableArray([self mutableArrayValueForKeyPath: keyPath]));
  }
}

NAN_METHOD(NNSObject::mutableOrderedSetValueForKeyPath) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, keyPath);
    JS_SET_RETURN(js_value_NSMutableOrderedSet([self mutableOrderedSetValueForKeyPath: keyPath]));
  }
}

NAN_METHOD(NNSObject::mutableSetValueForKeyPath) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, keyPath);
    JS_SET_RETURN(js_value_NSMutableSet([self mutableSetValueForKeyPath: keyPath]));
  }
}

NAN_METHOD(NNSObject::valueForUndefinedKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self valueForUndefinedKey: key]));
  }
}

NAN_METHOD(NNSObject::setValueForUndefinedKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_pointer(NSString, key);
    [self setValue: value forUndefinedKey: key];
  }
}

NAN_METHOD(NNSObject::setNilValueForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    [self setNilValueForKey: key];
  }
}

NAN_METHOD(NNSObject::dictionaryWithValuesForKeys) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSString*>, keys);
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self dictionaryWithValuesForKeys: keys]));
  }
}

NAN_METHOD(NNSObject::setValuesForKeysWithDictionary) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary/* <NSString*, id>*/, keyedValues);
    [self setValuesForKeysWithDictionary: keyedValues];
  }
}

#if UNAVAILABLE
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

NAN_METHOD(NNSObject::useStoredAccessor) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([NSObject useStoredAccessor]));
  }
}

NAN_METHOD(NNSObject::storedValueForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self storedValueForKey: key]));
  }
}

NAN_METHOD(NNSObject::takeStoredValueForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_pointer(NSString, key);
    [self takeStoredValue: value forKey: key];
  }
}

NAN_METHOD(NNSObject::takeValueForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_pointer(NSString, key);
    [self takeValue: value forKey: key];
  }
}

NAN_METHOD(NNSObject::takeValueForKeyPath) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_pointer(NSString, keyPath);
    [self takeValue: value forKeyPath: keyPath];
  }
}

NAN_METHOD(NNSObject::handleQueryWithUnboundKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self handleQueryWithUnboundKey: key]));
  }
}

NAN_METHOD(NNSObject::handleTakeValueForUnboundKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_pointer(NSString, key);
    [self handleTakeValue: value forUnboundKey: key];
  }
}

NAN_METHOD(NNSObject::unableToSetNilForKey) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    [self unableToSetNilForKey: key];
  }
}

NAN_METHOD(NNSObject::valuesForKeys) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, keys);
    JS_SET_RETURN(js_value_NSDictionary([self valuesForKeys: keys]));
  }
}

NAN_METHOD(NNSObject::takeValuesFromDictionary) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary, properties);
    [self takeValuesFromDictionary: properties];
  }
}

#endif // #if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
#endif // UNAVAILABLE

#if TODO
NAN_GETTER(NNSObject::accessInstanceVariablesDirectlyGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([NSObject accessInstanceVariablesDirectly]));
  }
}
#endif


NClass::NClass() {}
NClass::~NClass() {}

JS_INIT_CLASS_ALLOC(Class, id, noop());
  JS_INIT_CTOR(Class, id);
JS_INIT_CLASS_END(Class, id);

NAN_METHOD(NClass::New) {
  JS_RECONSTRUCT(Class);
  @autoreleasepool {
    Class self = nil;

    if (info[0]->IsExternal()) {
      self = (__bridge Class)(info[0].As<External>()->Value());
    }
    if (self) {
      NClass* wrapper = new NClass();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NClass::New: invalid arguments");
    }
  }
}

#include "NNSObjCRuntime.h"
#include "NMacTypes.h"
#include "NDispatchQueue.h"
#include "NCFBase.h"
#include "NCFDictionary.h"
#if TARGET_OS_UIKITFORMAC
#include "NNSOpenGL.h"
#define APPKIT_EXTERN extern "C"
#include "NNSOpenGL_uikitformac.h"
#endif
#include "NNSTarget.h"
#include "NNSRunLoop.h"
#include "NNSTimer.h"
#include "NNSPort.h"
#include "NNSPortDelegate.h"
#include "NNSMachPort.h"
#include "NNSMachPortDelegate.h"
#include "NNSMessagePort.h"
#include "NNSSocketPort.h"
#include "NNSInvocation.h"
#include "NNSUserDefaults.h"

#include "NNSIndexSet.h"
#include "NNSMutableIndexSet.h"
#include "NNSItemProvider.h"
#include "NNSItemProviderReading.h"
#include "NNSItemProviderWriting.h"
#include "NNSProgress.h"

#include "NNSMutableParagraphStyle.h"
#include "NNSParagraphStyle.h"
#include "NNSAttributedString.h"
#include "NNSMutableAttributedString.h"
#include "NNSCharacterSet.h"
#include "NNSMutableCharacterSet.h"
#include "NNSTimeZone.h"
#include "NNSDateComponents.h"
#include "NNSCalendar.h"
#include "NNSCoder.h"
#include "NNSURL.h"
#include "NNSURLRequest.h"
#include "NNSMutableURLRequest.h"
#include "NNSURLResponse.h"
#include "NNSHTTPURLResponse.h" // : NSURLResponse
#include "NNSURLProtectionSpace.h"
#include "NNSURLCredential.h"
#include "NNSURLAuthenticationChallenge.h"
#include "NNSStream.h"
#include "NNSInputStream.h"
#include "NNSOutputStream.h"
#include "NNSCache.h"
#include "NNSBundle.h"
#include "NNSNotification.h"
#include "NNSNotificationCenter.h"
#include "NNSOperation.h"
#include "NNSOperationQueue.h"
#include "NNSBlockOperation.h" // : NSOperation
#include "NNSInvocationOperation.h" // : NSOperation
#include "NNSUndoManager.h"
#include "NNSUserActivity.h"
#include "NNSUserActivityDelegate.h"

#include "NUIGraphics.h"
#include "NUIBezierPath.h"
#include "NUILabel.h"
#include "NUIFont.h"
#include "NUISlider.h"
#include "NUIApplication.h"
#include "NUIWindow.h"
#include "NUIScreen.h"
#include "NUIScreenMode.h"
#include "NUIFocusSystem.h"
#include "NUILocalNotification.h"
#include "NUIUserNotificationSettings.h"
#include "NUIButton.h"
#include "NUIStepper.h"
#include "NUISegmentedControl.h"
#include "NUIRefreshControl.h"
#include "NUISwitch.h"
#include "NUIGraphicsRendererFormat.h"
#include "NUIGraphicsImageRendererFormat.h"
#include "NUIImageAsset.h"
#include "NUITraitCollection.h"
#include "NUIToolbar.h"
#include "NUIImage.h"
#include "NUIImageView.h"
#include "NUIVisualEffect.h"
#include "NUIBlurEffect.h"
#include "NUIVisualEffectView.h"
#include "NUITextInput.h"
#include "NUITextInputStringTokenizer.h"
#include "NUITextInputAssistantItem.h"
#include "NUITextInputPasswordRules.h"
#include "NUITextInputMode.h"
#include "NUITextSelectionRect.h"
#include "NUITextRange.h"
#include "NUITextPosition.h"
#include "NUITextField.h"
#include "NUITextFieldDelegate.h"
#include "NUITextInputDelegate.h"
#include "NUIKeyCommand.h"
#include "NUIStoryboardSegue.h"
#include "NUIStoryboardUnwindSegueSource.h"
#include "NUIStoryboard.h"
#include "NUISearchController.h"
#include "NUITabBarController.h"
#include "NUITabBarControllerDelegate.h"
#include "NUITabBarDelegate.h"
#include "NUISplitViewController.h"
#include "NUIBarCommon.h"
#include "NUITabBarItem.h"
#include "NUIBarButtonItem.h"
#include "NUITabBar.h"
#include "NUIViewController.h"
#include "NUITimingCurveProvider.h"
#include "NUICubicTimingParameters.h"
#include "NUISpringTimingParameters.h"
#include "NUIViewAnimating.h"
#include "NUIViewImplicitlyAnimating.h"
#include "NUIViewPropertyAnimator.h"
#include "NUINavigationController.h"
#include "NUINavigationControllerDelegate.h"
#include "NUIBarPositioning.h"
#include "NUIBarPositioningDelegate.h"
#include "NUINavigationBarDelegate.h"
#include "NUINavigationBar.h"
#include "NUINavigationItem.h"
#include "NUIImagePickerController.h"
#include "NUIImagePickerControllerDelegate.h"
#include "NUIViewControllerTransitioningDelegate.h"
#include "NUIPopoverPresentationControllerDelegate.h"
#include "NUIPopoverPresentationController.h"

#include "NUISwipeActionsConfiguration.h"
#include "NUIContextualAction.h"
#include "NUITableViewRowAction.h"
#include "NUIFocusUpdateContext.h"
#include "NUITableViewFocusUpdateContext.h" // : NUIFocusUpdateContext
#include "NUIFocus.h" // globals
#include "NUIFocusAnimationCoordinator.h"
#include "NUIFocusAnimationContext.h"
#include "NUITableViewDelegate.h"
#include "NUIDropInteractionDelegate.h"
#include "NUIDropInteraction.h"
#include "NUIDropProposal.h"

#include "NUIDragAnimating.h"
#include "NUIDragDropSession.h"
#include "NUIDragSession.h"
#include "NUIDropSession.h"
#include "NUIDragInteractionDelegate.h"
#include "NUITableViewDataSource.h"
#include "NUITableViewDataSourcePrefetching.h"
#include "NUITableViewDragDelegate.h"
#include "NUITableViewDropItem.h"
#include "NUITableViewDropCoordinator.h"
#include "NUITableViewDropDelegate.h"
#include "NUITableViewDropPlaceholderContext.h" // <UIDragAnimating>

#include "NUIDragInteraction.h"
#include "NUIDragItem.h"
#include "NUIDragPreviewParameters.h"
#include "NUIDragPreviewTarget.h"
#include "NUITableView.h"
#include "NUITableViewDropPlaceholder.h"
#include "NUITableViewDropProposal.h" // : UIDropProposal
#include "NUITableViewHeaderFooterView.h" // : UIView
#include "NUITableViewPlaceholder.h"
#include "NUITargetedDragPreview.h"

#include "NUITableViewController.h"
#include "NUITableViewCell.h"
#include "NUIPickerView.h"
#include "NUIPickerViewManager.h"
#include "NUICollectionReusableView.h"
#include "NUICollectionView.h"
#include "NUICollectionViewController.h"
#include "NUICollectionViewCell.h"
#include "NUICollectionViewManager.h"
#include "NUICollectionViewLayout.h"
#include "NUICollectionViewLayoutAttributes.h"
#include "NUICollectionViewLayoutInvalidationContext.h"
#include "NUICollectionViewUpdateItem.h"
#include "NUICollectionViewFlowLayout.h"
#include "NUICollectionViewFlowLayoutInvalidationContext.h"
#include "NUICollectionViewTransitionLayout.h"
#include "NUIPageControl.h"
#include "NUIProgressView.h"
#include "NUIDatePicker.h"
#include "NCADisplayLink.h"
#include "NCATransaction.h"
#include "NCAAction.h"
#include "NCALayerDelegate.h"
#include "NCALayer.h"
#include "NCAMetalDrawable.h"
#include "NCAMetalLayer.h"
#include "NCAGradientLayer.h"
#include "NCAEmitterLayer.h"
#include "NCAEmitterCell.h"
#include "NCAMediaTimingFunction.h" // : NSObject
#include "NCAValueFunction.h" // : NSObject
#include "NCAAnimation.h" // : NSObject
#include "NCAAnimationGroup.h" // : CAAnimation
#include "NCATransition.h" // : CAAnimation
#include "NCAPropertyAnimation.h" // : CAAnimation
#include "NCAKeyframeAnimation.h" // : CAPropertyAnimation
#include "NCABasicAnimation.h" // : CAPropertyAnimation
#include "NCASpringAnimation.h" // : CABasicAnimation
#include "NCAShapeLayer.h"
#include "NUIViewControllerTransitioning.h" // globals
#include "NUIViewControllerTransitionCoordinatorContext.h" // NSObject
#include "NUIViewControllerTransitionCoordinator.h" // NSObject<UIViewControllerTransitionCoordinatorContext>
#include "NUIAdaptivePresentationControllerDelegate.h" // NSObject
#include "NUIPresentationController.h"
#include "NUIInputViewController.h"
#include "NUIAlertController.h"
#include "NUIAlertAction.h"
#include "NUIScrollView.h"
#include "NUIScrollViewDelegate.h"
#include "NUIStackView.h"
#include "NUIInputView.h"
#include "NUIGestureRecognizer.h"
#include "NUITapGestureRecognizer.h"
#include "NNSLayoutAnchor.h"
#include "NNSLayoutConstraint.h"
#include "NNSLayoutDimension.h"
#include "NNSLayoutXAxisAnchor.h"
#include "NNSLayoutYAxisAnchor.h"
#include "NUIMotionEffect.h"
#include "NUILayoutGuide.h"
#include "NUIEvent.h"
#include "NUIPressesEvent.h"
#include "NUITouch.h"
#include "NUIPress.h"
#include "NUIBarButtonItem.h"
#include "NGif.h"
#include "NGifView.h"
#include "NGifManager.h"
#include "NUIDevice.h"
#include "NUINib.h"
#include "NUILexicon.h"
#include "NUILexiconEntry.h"
#include "NUIKitGlobals.h"
#include "NUIDictationPhrase.h"

#include "NMTLPixelFormat.h"

#include "NMTLType.h" // : NSObject
#include "NMTLStructMember.h" // : NSObject
#include "NMTLStructType.h" // : MTLType
#include "NMTLArrayType.h" // : MTLType
#include "NMTLPointerType.h" // : MTLType
#include "NMTLTextureReferenceType.h" // : MTLType
#include "NMTLArgument.h" // : NSObject

#include "NMTLArgumentDescriptor.h" // : NSObject <NSCopying>
#include "NMTLDevice.h" // <NSObject>

#include "NMTLResource.h" // <NSObject>
#include "NMTLTextureDescriptor.h" // : NSObject <NSCopying>
#include "NMTLTexture.h" // <MTLResource>

#include "NMTLRenderPassAttachmentDescriptor.h" // : NSObject <NSCopying>
#include "NMTLRenderPassColorAttachmentDescriptor.h" // : MTLRenderPassAttachmentDescriptor
#include "NMTLRenderPassDepthAttachmentDescriptor.h" // : MTLRenderPassAttachmentDescriptor
#include "NMTLRenderPassStencilAttachmentDescriptor.h" // : MTLRenderPassAttachmentDescriptor
#include "NMTLRenderPassColorAttachmentDescriptorArray.h" // : NSObject
#include "NMTLRenderPassDescriptor.h" // : NSObject <NSCopying>

#include "NMTLCommandQueue.h"
#include "NMTLHeapDescriptor.h"
#include "NMTLHeap.h"
#include "NMTLBuffer.h" // <MTLResource>

#include "NMTLSamplerDescriptor.h" // : NSObject <NSCopying>
#include "NMTLSamplerState.h" // <NSObject>

#include "NMTLDepthStencil.h"
#include "NMTLStencilDescriptor.h" // : NSObject <NSCopying>
#include "NMTLDepthStencilDescriptor.h" // : NSObject <NSCopying>
#include "NMTLDepthStencilState.h" // <NSObject>

#include "NMTLTypes.h"

#include "NMTLVertexAttribute.h" // : NSObject
#include "NMTLAttribute.h" // : NSObject
#include "NMTLFunctionConstant.h" // : NSObject
#include "NMTLCompileOptions.h" // : NSObject <NSCopying>
#include "NMTLFunction.h" // <NSObject>
#include "NMTLLibrary.h" // <NSObject>

#include "NMTLRenderPipelineColorAttachmentDescriptor.h" // : NSObject <NSCopying>
#include "NMTLRenderPipelineReflection.h" // : NSObject
#include "NMTLRenderPipelineDescriptor.h" // : NSObject <NSCopying>
#include "NMTLRenderPipelineColorAttachmentDescriptorArray.h" // : NSObject
#include "NMTLTileRenderPipelineColorAttachmentDescriptor.h" // : NSObject <NSCopying>
#include "NMTLTileRenderPipelineColorAttachmentDescriptorArray.h" // : NSObject
#include "NMTLTileRenderPipelineDescriptor.h" // : NSObject <NSCopying>
#include "NMTLRenderPipelineState.h" // <NSObject>

#include "NMTLVertexBufferLayoutDescriptor.h" // : NSObject <NSCopying>
#include "NMTLVertexBufferLayoutDescriptorArray.h" // : NSObject
#include "NMTLVertexAttributeDescriptor.h" // : NSObject <NSCopying>
#include "NMTLVertexAttributeDescriptorArray.h" // : NSObject
#include "NMTLVertexDescriptor.h" // : NSObject <NSCopying>

#include "NMTLComputePipelineReflection.h" // : NSObject
#include "NMTLComputePipelineDescriptor.h" // : NSObject <NSCopying>
#include "NMTLComputePipelineState.h" // <NSObject>

#include "NMTLFence.h" // <NSObject>
#include "NMTLArgumentEncoder.h" // <NSObject>

#include "NMTLIndirectCommandBufferDescriptor.h" // : NSObject
#include "NMTLIndirectCommandBuffer.h" // <MTLResource>
#include "NMTLIndirectRenderCommand.h" // <NSObject>
#include "NMTLCommandEncoder.h" // <NSObject>
#include "NMTLRenderCommandEncoder.h" // <MTLCommandEncoder>

#include "NMTLBufferLayoutDescriptor.h" // : NSObject <NSCopying>
#include "NMTLBufferLayoutDescriptorArray.h" // : NSObject
#include "NMTLAttributeDescriptor.h" // : NSObject <NSCopying>
#include "NMTLAttributeDescriptorArray.h" // : NSObject
#include "NMTLStageInputOutputDescriptor.h" // : NSObject <NSCopying>

#include "NMTLEvent.h" // <NSObject>
#include "NMTLSharedEvent.h" // <MTLEvent>
#include "NMTLSharedEventListener.h" // : NSObject
#include "NMTLSharedEventHandle.h" // : NSObject <NSSecureCoding>

#include "NMTLFunctionConstantValues.h" // : NSObject <NSCopying>

#include "NMTLCommandBuffer.h" // <NSObject>
#include "NMTLDrawable.h" // <NSObject>

#include "NMTLBlitCommandEncoder.h" // <MTLCommandEncoder>
#include "NMTLParallelRenderCommandEncoder.h" // <MTLCommandEncoder>
#include "NMTLComputeCommandEncoder.h" // <MTLCommandEncoder>

#include "NMTLPipeline.h"
#include "NMTLPipelineBufferDescriptor.h" // : NSObject <NSCopying>
#include "NMTLPipelineBufferDescriptorArray.h" // : NSObject

#include "NMTKView.h"
#include "NMTKViewDelegate.h"

#include "NSKRenderer.h"
#include "NSKView.h"
#include "NSKNode.h"
#include "NSKTexture.h"
#include "NSKTransformNode.h"
#include "NSKPhysicsBody.h"
#include "NSKPhysicsJoint.h"
#include "NSKPhysicsJointFixed.h"
#include "NSKPhysicsJointLimit.h"
#include "NSKPhysicsJointPin.h"
#include "NSKPhysicsJointSliding.h"
#include "NSKPhysicsJointSpring.h"
#include "NSKPhysicsContactDelegate.h"
#include "NSKPhysicsContact.h"
#include "NSKPhysicsWorld.h"
#include "NSKLabelNode.h"
#include "NSKAction.h"

#include "NCVBase.h" // globals
#include "NCVBuffer.h" // globals
#include "NCVImageBuffer.h" // globals
#include "NCVPixelBuffer.h" // globals

#include "NCMFormatDescription.h" // globals
#include "NCMTime.h" // globals
#include "NCMSync.h" // globals
#include "NCMTimeRange.h" // globals
#include "NCMAttachment.h" // globals
#include "NCMSampleBuffer.h" // globals

#include "NCoreAudioBaseTypes.h"
#include "NAVCaptureSession.h" // : NSObject
#include "NAVCaptureMultiCamSession.h" // : AVCaptureSession
#include "NAVCaptureConnection.h" // : NSObject
#include "NAVCaptureAudioChannel.h" // : NSObject
#include "NAVCaptureOutput.h" // : NSObject
#include "NAVMetadataObject.h" // : NSObject
#include "NAVMetadataFaceObject.h" // : AVMetadataObject
#include "NAVMetadataMachineReadableCodeObject.h" // : AVMetadataObject
#include "NAVMediaFormat.h" // globals
#include "NAVCaptureSessionPreset.h" // globals
#include "NAVCaptureInput.h" // : NSObject
#include "NAVCaptureInputPort.h" // : NSObject
#include "NAVCaptureDeviceInput.h" // : AVCaptureInput
#include "NAVCaptureScreenInput.h" // : AVCaptureInput
#include "NAVCaptureMetadataInput.h" // : AVCaptureInput
#include "NAVCaptureDevice.h" // : NSObject
#include "NAVCaptureDeviceDiscoverySession.h" // : NSObject
#include "NAVFrameRateRange.h" // : NSObject
#include "NAVCaptureDeviceFormat.h" // : NSObject
#include "NAVCaptureDeviceInputSource.h" // : NSObject
#include "NAVMetadataGroup.h" // : NSObject
#include "NAVTimedMetadataGroup.h" // : AVMetadataGroup
#include "NAVMutableTimedMetadataGroup.h" // : AVTimedMetadataGroup
#include "NAVDateRangeMetadataGroup.h" // : AVMetadataGroup
#include "NAVMutableDateRangeMetadataGroup.h" // : AVDateRangeMetadataGroup
#include "NAVCaptureSystemPressureState.h" // : NSObject
#include "NAVAnimation.h" // globals
#include "NAVVideoSettings.h" // globals
#include "NAVCaptureVideoDataOutput.h" : NSObject
#include "NAVCaptureVideoDataOutputSampleBufferDelegate.h" // <NSObject>
#include "NAVCaptureVideoPreviewLayer.h" // : CALayer

#include "NAVAudioTypes.h"
#include "NAVAudioPlayer.h"
#include "NAVAudioFormat.h"
#include "NAVAudioSession.h"
#include "NAVAudioSessionChannelDescription.h"
#include "NAVAudioSessionDataSourceDescription.h"
#include "NAVAudioSessionPortDescription.h"
#include "NAVAudioSessionRouteDescription.h"
#include "NAudioComponent.h"
#include "NAudioUnitProperties.h"
#include "NAUComponent.h"
#include "NAUAudioUnit.h"
#include "NAUParameterTree.h"
#include "NAUParameterNode.h"
#include "NAUParameterGroup.h"
#include "NAUAudioUnitPreset.h"
#include "NAVAudioEngine.h"
#include "NAVAudioNode.h"
#include "NAVAudioTime.h"
#include "NAVAudioConnectionPoint.h"
#include "NAVAudioBuffer.h"
#include "NAVAudioCompressedBuffer.h"
#include "NAVAudioPCMBuffer.h"
#include "NAVAudioIONode.h"
#include "NAVAudioOutputNode.h"
#include "NAVAudioInputNode.h"
#include "NAVAudioMixerNode.h"
#include "NAVAudioPlayerNode.h"
#include "NAVAudioFile.h"
#include "NAVAudioChannelLayout.h"

#include "NAVAudioStereoMixing.h" // <NSObject>
#include "NAVAudio3DMixing.h" // <NSObject>
#include "NAVAudioMixing.h" // <AVAudioStereoMixing, AVAudio3DMixing>
#include "NAVAudioMixingDestination.h" // : NSObject <AVAudioMixing>

#include "NAVAudioEnvironmentNode.h" // : AVAudioNode <AVAudioMixing>
#include "NAVAudioEnvironmentDistanceAttenuationParameters.h" // : NSObject
#include "NAVAudioEnvironmentReverbParameters.h" // : NSObject

#include "NAVAudioUnit.h" // : AVAudioNode
#include "NAVAudioUnitEffect.h" // : AVAudioUnit
#include "NAVAudioUnitEQFilterParameters.h" // : NSObject
#include "NAVAudioUnitEQ.h" // : AVAudioUnitEffect
#include "NAVAudioUnitReverb.h" // : AVAudioUnitEffect

#include "NAVDepthData.h"
#include "NAVPortraitEffectsMatte.h"
#include "NAVCameraCalibrationData.h"

#include "NEAGLContext.h"
#include "NEAGLSharegroup.h"
#include "NWebGL.h"
#include "NGLKView.h"
#include "NGLKViewController.h"
#include "NGLKViewDelegate.h"
#include "NGLKViewControllerDelegate.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
#include "NARAnchor.h"
#include "NARConfiguration.h"
#include "NARWorldTrackingConfiguration.h"
#include "NARFaceTrackingConfiguration.h"
#include "NARImageTrackingConfiguration.h"
#include "NARObjectScanningConfiguration.h"
#include "NAROrientationTrackingConfiguration.h"
#include "NARPointCloud.h"
#include "NARReferenceImage.h"
#include "NARReferenceObject.h"
#include "NARVideoFormat.h"
#include "NARWorldMap.h"
#include "NARSKView.h"
#include "NARSKViewDelegate.h"
#include "NARSession.h"
#include "NARFrame.h"
#include "NARCamera.h"
#include "NARSCNView.h"
#include "NARSCNViewDelegate.h"
#include "NARHitTestResult.h"
#include "NARLightEstimate.h"
#include "NARCollaborationData.h"
#include "NARTrackedRaycast.h"
#include "NARSessionObserver.h"
#include "NARSessionDelegate.h"
#include "NARSessionProviding.h"
#include "NARRaycastQuery.h"
#include "NARRaycastResult.h"
#endif

#include "NSceneKitTypes.h"
#include "NSCNPhysicsField.h"
#include "NSCNRenderer.h"
#include "NSCNSceneRenderer.h"
#include "NSCNSceneRendererDelegate.h"
#include "NSCNAction.h"
#include "NSCNView.h"
#include "NSCNScene.h"
#include "NSCNSceneSource.h"
#include "NSCNSkinner.h"
#include "NSCNMorpher.h"
#include "NSCNPhysicsBehavior.h"
#include "NSCNPhysicsHingeJoint.h" // : SCNPhysicsBehavior
#include "NSCNPhysicsBallSocketJoint.h" // : SCNPhysicsBehavior
#include "NSCNPhysicsSliderJoint.h" // : SCNPhysicsBehavior
#include "NSCNPhysicsConeTwistJoint.h" // : SCNPhysicsBehavior
#include "NSCNPhysicsVehicleWheel.h"
#include "NSCNPhysicsVehicle.h" // : SCNPhysicsBehavior
#include "NSCNPhysicsShape.h"
#include "NSCNPhysicsWorld.h"
#include "NSCNNodeRendererDelegate.h"
#include "NSCNNode.h"
#include "NSCNAudioPlayer.h"
#include "NSCNAudioSource.h"
#include "NSCNLight.h"
#include "NSCNMaterial.h"
#include "NSCNMaterialProperty.h"
#include "NSCNCamera.h"
#include "NSCNCameraController.h"
#include "NSCNPhysicsBody.h"
#include "NSCNHitTestResult.h"
#include "NSCNBox.h"
#include "NSCNCapsule.h"
#include "NSCNCone.h"
#include "NSCNCylinder.h"
#include "NSCNPlane.h"
#include "NSCNPyramid.h"
#include "NSCNSphere.h"
#include "NSCNTorus.h"
#include "NSCNTube.h"
#include "NSCNFloor.h"
#include "NSCNGeometry.h"
#include "NSCNText.h"
#include "NSCNShape.h"
#include "NSCNParticleSystem.h"
#include "NSCNParticlePropertyController.h"
#include "NSKScene.h"
#include "NSKTransition.h"
#include "NSKSpriteNode.h"
#include "NSKCameraNode.h"
#include "NSKEmitterNode.h"
#include "NCLLocationManager.h"
#include "NCLLocationManagerDelegate.h"
#include "NCLLocation.h"
#include "NCLFloor.h"
#include "NCLGeocoder.h"
#include "NCLPlacemark.h"
#include "NCLHeading.h"
#include "NCLVisit.h"
#include "NCLRegion.h"
#include "NCLBeacon.h"
#include "NCLBeaconRegion.h"
#include "NCNPostalAddress.h"
#include "NNSUUID.h"
#include "NMKMapView.h"
#include "NMKMapViewDelegate.h"
#include "NMKAnnotation.h"
#include "NMKClusterAnnotation.h"
#include "NMKAnnotationView.h"
#include "NMKMapCamera.h"
#include "NMKOverlayRenderer.h"
#include "NMKOverlayView.h"
#include "NMKUserLocation.h"

#include "NCoreGraphicsGlobals.h"
#include "NCGColorSpace.h"
#include "NCGContext.h"
#include "NCGFont.h"
#include "NCGGradient.h"
#include "NCGImage.h"
#include "NCGPDFDocument.h"
#include "NCGPDFPage.h"
#include "NCGPath.h"
#include "NCGPattern.h"
#include "NCGShading.h"

#include "NCGImageProperties.h" // globals

#include "NVNTypes.h" // globals
#include "NVNRequest.h" // : NSObject
#include "NVNImageBasedRequest.h" // : VNRequest
#include "NVNDetectTextRectanglesRequest.h" // : VNImageBasedRequest
#include "NVNDetectFaceRectanglesRequest.h" // : VNImageBasedRequest
#include "NVNFaceObservationAccepting.h" // <NSObject>
#include "NVNDetectFaceLandmarksRequest.h" // : VNImageBasedRequest
#include "NVNRecognizeTextRequest.h" // : VNImageBasedRequest
#include "NVNRequestProgressProviding.h" // <NSObject>
#include "NVNImageRequestHandler.h" // : NSObject
#include "NVNSequenceRequestHandler.h" // : NSObject
#include "NVNObservation.h" // : NSObject
#include "NVNDetectedObjectObservation.h" // : VNObservation
#include "NVNFaceObservation.h" // : VNDetectedObjectObservation
#include "NVNClassificationObservation.h" // : VNObservation
#include "NVNRecognizedObjectObservation.h" // : VNDetectedObjectObservation
#include "NVNCoreMLFeatureValueObservation.h" // : VNObservation
#include "NVNPixelBufferObservation.h" // : VNObservation
#include "NVNRectangleObservation.h" // : VNDetectedObjectObservation
#include "NVNTextObservation.h" // : VNRectangleObservation
#include "NVNRecognizedText.h" // : NSObject
#include "NVNRecognizedTextObservation.h" // : VNRectangleObservation
#include "NVNBarcodeObservation.h" // : VNRectangleObservation
#include "NVNHorizonObservation.h" // : VNObservation
#include "NVNImageAlignmentObservation.h" // : VNObservation
#include "NVNImageTranslationAlignmentObservation.h" // : VNImageAlignmentObservation
#include "NVNImageHomographicAlignmentObservation.h" // : VNImageAlignmentObservation
#include "NVNSaliencyImageObservation.h" // : VNPixelBufferObservation
#include "NVNFeaturePrintObservation.h" // : VNObservation

#include "NRPScreenRecorder.h"
#include "NRPScreenRecorderDelegate.h"
#include "NRPPreviewViewController.h"
#include "NRPPreviewViewControllerDelegate.h"
#include "NCIColor.h"
#include "NCIImage.h"
#include "NCIFilter.h"
#include "NCIKernel.h"
#include "NCIColorKernel.h" // : CIKernel
#include "NCIWarpKernel.h" // : CIKernel
#include "NCIBlendKernel.h" // : CIColorKernel

#include "NWKNavigation.h"
#include "NWKNavigationDelegate.h"
#include "NWKWebView.h"

#include "NMPMediaEntity.h"
#include "NMPMediaItem.h"
#include "NMPMediaItemCollection.h"
#include "NMPMediaPlaylist.h"
#include "NMPMediaQuery.h"
#include "NMPMusicPlayerController.h"
#include "NMPMusicPlayerApplicationController.h"
#include "NMPMusicPlayerQueueDescriptor.h"

#include "NMDLAsset.h"
#include "NMDLObject.h"
#include "NMDLLight.h"
#include "NMDLCamera.h"
#include "NMDLMesh.h"
#include "NMDLMeshBufferData.h"
#include "NMDLMeshBufferDataAllocator.h"
#include "NMDLMeshBufferMap.h"
#include "NMDLVertexDescriptor.h"
#include "NMDLVertexBufferLayout.h"
#include "NMDLVertexAttribute.h"
#include "NMDLVertexAttributeData.h"
#include "NMDLSubmesh.h"
#include "NMDLSubmeshTopology.h"
#include "NMDLTransform.h"
#include "NMDLTexture.h"
#include "NMDLTextureFilter.h"
#include "NMDLTextureSampler.h"
#include "NMDLScatteringFunction.h"
#include "NMDLPhysicallyPlausibleScatteringFunction.h"
#include "NMDLMaterialProperty.h"
#include "NMDLMaterial.h"

#define JS_EXPORT_TYPE_AS(type, name, inherits) \
        auto N_##type = N##type::Initialize(isolate, exports); \
        exports->Set(Nan::New(name).ToLocalChecked(), N_##type.first)

#define JS_EXPORT_TYPE_INHERITS(type, inherits) \
        JS_EXPORT_TYPE_AS(type, #type, inherits)

#define JS_EXPORT_TYPE(type) \
        JS_EXPORT_TYPE_INHERITS(type, NSObject)

#define JS_EXPORT_PROTOCOL_INHERITS(type, inherits) \
        JS_EXPORT_TYPE_AS(type, #type, inherits)

#define JS_EXPORT_PROTOCOL(type) \
        JS_EXPORT_PROTOCOL_INHERITS(type, NSObject)

#define JS_EXPORT_GLOBALS(name) \
        N##name::Initialize(isolate, exports)

void NNSObject::RegisterTypes(Local<Object> exports) {
    Isolate* isolate = Isolate::GetCurrent();

    JS_EXPORT_TYPE(id);
    JS_EXPORT_TYPE(Class);
    JS_EXPORT_TYPE(NSObject);
    JS_EXPORT_TYPE(NSObjCRuntime);

    JS_EXPORT_GLOBALS(MacTypes);
    JS_EXPORT_GLOBALS(DispatchQueue);

#if TARGET_OS_UIKITFORMAC
    JS_EXPORT_GLOBALS(NSOpenGL);
    JS_EXPORT_TYPE(NSOpenGLContext);
    JS_EXPORT_TYPE(NSOpenGLPixelFormat);
    JS_EXPORT_TYPE(NSOpenGLPixelBuffer);
#endif
    JS_EXPORT_TYPE(NSTarget);
    JS_EXPORT_TYPE(NSRunLoop);
    JS_EXPORT_TYPE(NSTimer);
    JS_EXPORT_TYPE(NSPort);
    JS_EXPORT_PROTOCOL(NSPortDelegate);
    JS_EXPORT_TYPE(NSMessagePort);
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
    JS_EXPORT_TYPE(NSSocketPort);
    JS_EXPORT_TYPE(NSMachPort);
    JS_EXPORT_PROTOCOL(NSMachPortDelegate);
#endif
    JS_EXPORT_TYPE(NSInvocation);
    JS_EXPORT_TYPE(NSCoder);
    JS_EXPORT_TYPE(NSURL);
    JS_EXPORT_TYPE(NSURLRequest);
    JS_EXPORT_TYPE(NSMutableURLRequest);
    JS_EXPORT_TYPE(NSURLResponse);
    JS_EXPORT_TYPE(NSHTTPURLResponse);
    JS_EXPORT_TYPE(NSURLProtectionSpace);
    JS_EXPORT_TYPE(NSURLCredential);
    JS_EXPORT_TYPE(NSURLAuthenticationChallenge);
    JS_EXPORT_TYPE(NSStream);
    JS_EXPORT_TYPE(NSInputStream);
    JS_EXPORT_TYPE(NSOutputStream);
    JS_EXPORT_TYPE(NSCache);
    JS_EXPORT_TYPE(NSBundle);
    JS_EXPORT_TYPE(NSUserDefaults);
    JS_EXPORT_TYPE(NSIndexSet);
    JS_EXPORT_TYPE(NSMutableIndexSet);
    JS_EXPORT_TYPE(NSItemProvider);
    JS_EXPORT_PROTOCOL(NSItemProviderReading);
    JS_EXPORT_PROTOCOL(NSItemProviderWriting);
    JS_EXPORT_TYPE(NSProgress);
    JS_EXPORT_TYPE(NSParagraphStyle);
    JS_EXPORT_TYPE(NSMutableParagraphStyle);
    JS_EXPORT_TYPE(NSAttributedString);
    JS_EXPORT_TYPE(NSMutableAttributedString);
    JS_EXPORT_TYPE(NSCharacterSet);
    JS_EXPORT_TYPE(NSMutableCharacterSet);
    JS_EXPORT_TYPE(NSTimeZone);
    JS_EXPORT_TYPE(NSDateComponents);
    JS_EXPORT_TYPE(NSCalendar);
    JS_EXPORT_TYPE(NSUUID);
    JS_EXPORT_TYPE(NSNotification);
    JS_EXPORT_TYPE(NSNotificationCenter);
    JS_EXPORT_TYPE(NSOperation);
    JS_EXPORT_TYPE(NSOperationQueue);
    JS_EXPORT_TYPE(NSBlockOperation); // : NSOperation
    JS_EXPORT_TYPE(NSInvocationOperation); // : NSOperation
    JS_EXPORT_TYPE(NSUndoManager);
    JS_EXPORT_TYPE(NSUserActivity);
    JS_EXPORT_TYPE(NSUserActivityDelegate);

    // CoreFoundation
    JS_EXPORT_GLOBALS(CFBase);
    JS_EXPORT_GLOBALS(CFDictionary);

    // UIKit

    JS_EXPORT_GLOBALS(UIGraphics);
    JS_EXPORT_TYPE(UIGestureRecognizer);
    JS_EXPORT_TYPE(UITapGestureRecognizer);
    JS_EXPORT_TYPE(UIPinchGestureRecognizer);
    JS_EXPORT_TYPE(UIRotationGestureRecognizer);
    JS_EXPORT_TYPE(UISwipeGestureRecognizer);
    JS_EXPORT_TYPE(UIPanGestureRecognizer);
    JS_EXPORT_TYPE(UIScreenEdgePanGestureRecognizer);
    JS_EXPORT_TYPE(UILongPressGestureRecognizer);
    
    JS_EXPORT_TYPE(NSLayoutAnchor);
    JS_EXPORT_TYPE(NSLayoutConstraint);
    JS_EXPORT_TYPE(NSLayoutDimension);
    JS_EXPORT_TYPE(NSLayoutXAxisAnchor);
    JS_EXPORT_TYPE(NSLayoutYAxisAnchor);
    JS_EXPORT_TYPE(UIBezierPath);
    JS_EXPORT_TYPE(UIMotionEffect);
    JS_EXPORT_TYPE(UILayoutGuide);
    JS_EXPORT_TYPE(UIBarButtonItem);
    JS_EXPORT_TYPE(UIBarCommon);
    JS_EXPORT_TYPE(UITabBarItem);
    JS_EXPORT_TYPE(UIAlertAction);
    JS_EXPORT_TYPE(UIApplication);
    JS_EXPORT_TYPE(UIResponder);
    JS_EXPORT_TYPE(UIViewController);
    JS_EXPORT_PROTOCOL(UITimingCurveProvider);
    JS_EXPORT_TYPE(UICubicTimingParameters);
    JS_EXPORT_TYPE(UISpringTimingParameters);
    JS_EXPORT_PROTOCOL(UIViewAnimating);
    JS_EXPORT_PROTOCOL(UIViewImplicitlyAnimating);
    JS_EXPORT_TYPE(UIViewPropertyAnimator);
    JS_EXPORT_TYPE(UITabBarController);
    JS_EXPORT_PROTOCOL(UITabBarControllerDelegate);
    JS_EXPORT_PROTOCOL(UITabBarDelegate);
    JS_EXPORT_TYPE(UISplitViewController);
    JS_EXPORT_TYPE(UISearchController);

    JS_EXPORT_TYPE(UISwipeActionsConfiguration);
    JS_EXPORT_TYPE(UIContextualAction);
    JS_EXPORT_TYPE(UITableViewRowAction);
    JS_EXPORT_TYPE(UIFocusUpdateContext);
    JS_EXPORT_TYPE(UITableViewFocusUpdateContext); // : NUIFocusUpdateContext
    JS_EXPORT_GLOBALS(UIFocus);
    JS_EXPORT_TYPE(UIFocusAnimationCoordinator);
    JS_EXPORT_PROTOCOL(UIFocusAnimationContext);
    JS_EXPORT_TYPE(UIDropInteraction);
    JS_EXPORT_TYPE(UIDropProposal);

    JS_EXPORT_TYPE(UIDragInteraction);
    JS_EXPORT_TYPE(UIDragItem);
    JS_EXPORT_TYPE(UIDragPreviewParameters);
    JS_EXPORT_TYPE(UIDragPreviewTarget);
    JS_EXPORT_TYPE(UITableViewPlaceholder);
    JS_EXPORT_TYPE(UITableViewDropPlaceholder); // : UITableViewPlaceholder
    JS_EXPORT_TYPE(UITableViewDropProposal); // : UIDropProposal
    JS_EXPORT_TYPE(UITargetedDragPreview);

    JS_EXPORT_TYPE(UITableViewController);
    JS_EXPORT_TYPE(UICollectionViewController);
    JS_EXPORT_TYPE(UINavigationController);
    JS_EXPORT_PROTOCOL(UINavigationControllerDelegate);
    JS_EXPORT_TYPE(UIImagePickerController);
    JS_EXPORT_TYPE(UIInputViewController);
    JS_EXPORT_GLOBALS(UIViewControllerTransitioning); // globals
    JS_EXPORT_PROTOCOL(UIViewControllerTransitionCoordinatorContext); // NSObject
    JS_EXPORT_PROTOCOL(UIViewControllerTransitionCoordinator); // NSObject<UIViewControllerTransitionCoordinator>
    JS_EXPORT_TYPE(UIPresentationController);
    JS_EXPORT_TYPE(UIPopoverPresentationController);
    JS_EXPORT_TYPE(UIAlertController);
    JS_EXPORT_TYPE(UIView);
    JS_EXPORT_TYPE(UITableViewHeaderFooterView); // : UIView
    JS_EXPORT_TYPE(UIWindow);
    JS_EXPORT_TYPE(UIScreen);
    JS_EXPORT_TYPE(UIScreenMode);
    JS_EXPORT_TYPE(UIFocusSystem);
    JS_EXPORT_TYPE(UILocalNotification);
    JS_EXPORT_TYPE(UIUserNotificationSettings);
    JS_EXPORT_TYPE(UICollectionReusableView);
    JS_EXPORT_TYPE(UIControl);
    JS_EXPORT_TYPE(UISlider);
    JS_EXPORT_TYPE(UIRefreshControl);
    JS_EXPORT_TYPE(UISwitch);
    JS_EXPORT_TYPE(UIStoryboard);
    JS_EXPORT_TYPE(UIButton);
    JS_EXPORT_TYPE(UIKeyCommand);
    JS_EXPORT_TYPE(UIStoryboardSegue);
    JS_EXPORT_TYPE(UIStoryboardUnwindSegueSource);
    JS_EXPORT_TYPE(UITextInput);
    JS_EXPORT_TYPE(UITextInputStringTokenizer);
    JS_EXPORT_TYPE(UITextInputAssistantItem);
    JS_EXPORT_TYPE(UITextInputMode);
    JS_EXPORT_TYPE(UITextInputPasswordRules);
    JS_EXPORT_TYPE(UITextSelectionRect);
    JS_EXPORT_TYPE(UITextRange);
    JS_EXPORT_TYPE(UITextPosition);
    JS_EXPORT_TYPE(UITextField);
    JS_EXPORT_TYPE(UITextFieldDelegate);
    JS_EXPORT_TYPE(UITextInputDelegate);
    JS_EXPORT_TYPE(UIStepper);
    JS_EXPORT_TYPE(UISegmentedControl);
    
    JS_EXPORT_TYPE(UIGraphicsRendererFormat);
    JS_EXPORT_TYPE(UIGraphicsImageRendererFormat);
    JS_EXPORT_TYPE(UIImageAsset);
    JS_EXPORT_TYPE(UITraitCollection);
    JS_EXPORT_TYPE(UIToolbar);
    
    JS_EXPORT_TYPE(UIImage);
    JS_EXPORT_TYPE(UIImageView);
    JS_EXPORT_TYPE(UIVisualEffect);
    JS_EXPORT_TYPE(UIBlurEffect);
    JS_EXPORT_TYPE(UIVisualEffectView);
    JS_EXPORT_TYPE(UIFont);
    JS_EXPORT_TYPE(UILabel);
    JS_EXPORT_TYPE(UITableViewCell);
    JS_EXPORT_TYPE(UIScrollView);
    JS_EXPORT_TYPE(UITableView);
    JS_EXPORT_TYPE(UICollectionView);
    JS_EXPORT_TYPE(UICollectionViewCell);
    JS_EXPORT_TYPE(UICollectionViewManager);
    JS_EXPORT_TYPE(UICollectionViewLayout);
    JS_EXPORT_TYPE(UICollectionViewLayoutAttributes);
    JS_EXPORT_TYPE(UICollectionViewLayoutInvalidationContext);
    JS_EXPORT_TYPE(UICollectionViewUpdateItem);
    JS_EXPORT_TYPE(UICollectionViewFlowLayout);
    JS_EXPORT_TYPE(UICollectionViewFlowLayoutInvalidationContext);
    JS_EXPORT_TYPE(UICollectionViewTransitionLayout);
    JS_EXPORT_TYPE(UIDictationPhrase);
    JS_EXPORT_TYPE(UIDevice);
    JS_EXPORT_TYPE(UINib);
    JS_EXPORT_TYPE(UILexicon);
    JS_EXPORT_TYPE(UILexiconEntry);
    JS_EXPORT_TYPE(UIEvent);
    JS_EXPORT_TYPE(UIPressesEvent);
    JS_EXPORT_TYPE(UITouch);
    JS_EXPORT_TYPE(UIPress);
    JS_EXPORT_TYPE(UIPageControl);
    JS_EXPORT_TYPE(UIPickerView);
    JS_EXPORT_TYPE(UIProgressView);
    JS_EXPORT_TYPE(UIDatePicker);
    JS_EXPORT_TYPE(UITabBar);
    JS_EXPORT_TYPE(UIStackView);
    JS_EXPORT_TYPE(UIInputView);
    JS_EXPORT_TYPE_AS(UIKitGlobals, "UIKit", NSObject);

    // UIKit delegates

    JS_EXPORT_PROTOCOL(UIAdaptivePresentationControllerDelegate);
    JS_EXPORT_PROTOCOL(UIPopoverPresentationControllerDelegate);
    JS_EXPORT_TYPE(UIPickerViewManager);
    JS_EXPORT_PROTOCOL(UIScrollViewDelegate);
    JS_EXPORT_PROTOCOL(UITableViewDelegate);
    JS_EXPORT_PROTOCOL(UITableViewDataSource);
    JS_EXPORT_PROTOCOL(UITableViewDataSourcePrefetching);
    JS_EXPORT_PROTOCOL(UITableViewDragDelegate);
    JS_EXPORT_PROTOCOL(UITableViewDropCoordinator);
    JS_EXPORT_PROTOCOL(UITableViewDropDelegate);
    JS_EXPORT_PROTOCOL(UITableViewDropItem);
    JS_EXPORT_PROTOCOL(UIDragAnimating);
    JS_EXPORT_PROTOCOL(UITableViewDropPlaceholderContext); // <UIDragAnimating>
    JS_EXPORT_PROTOCOL(UIDragDropSession);
    JS_EXPORT_PROTOCOL(UIDragSession);
    JS_EXPORT_PROTOCOL(UIDropSession);
    JS_EXPORT_PROTOCOL(UIDragInteractionDelegate);
    JS_EXPORT_PROTOCOL(UIDropInteractionDelegate);
    JS_EXPORT_TYPE(UIImagePickerControllerDelegate);
    JS_EXPORT_TYPE(UIViewControllerTransitioningDelegate);
    JS_EXPORT_PROTOCOL(UIBarPositioning);
    JS_EXPORT_PROTOCOL(UIBarPositioningDelegate);
    JS_EXPORT_PROTOCOL(UINavigationBarDelegate);
    JS_EXPORT_TYPE(UINavigationBar);
    JS_EXPORT_TYPE(UINavigationItem);
    
    // WebKit

    JS_EXPORT_TYPE(WKWebView);
    JS_EXPORT_TYPE(WKNavigation);
    JS_EXPORT_TYPE(WKNavigationDelegate);
    
    // Core Graphics

    JS_EXPORT_TYPE_AS(CoreGraphicsGlobals, "CoreGraphics", NSObject);
    JS_EXPORT_GLOBALS(CGColorSpace);
    JS_EXPORT_GLOBALS(CGContext);
    JS_EXPORT_GLOBALS(CGFont);
    JS_EXPORT_GLOBALS(CGGradient);
    JS_EXPORT_GLOBALS(CGImage);
    JS_EXPORT_GLOBALS(CGPDFDocument);
    JS_EXPORT_GLOBALS(CGPDFPage);
    JS_EXPORT_GLOBALS(CGPath);
    JS_EXPORT_GLOBALS(CGPattern);
    JS_EXPORT_GLOBALS(CGShading);

    // ImageIO

    JS_EXPORT_GLOBALS(CGImageProperties);

    // Vision

    JS_EXPORT_GLOBALS(VNTypes);
    JS_EXPORT_TYPE(VNRequest);
    JS_EXPORT_TYPE_INHERITS(VNImageBasedRequest, VNRequest);
    JS_EXPORT_TYPE_INHERITS(VNDetectTextRectanglesRequest, VNImageBasedRequest);
    JS_EXPORT_TYPE_INHERITS(VNDetectFaceRectanglesRequest, VNImageBasedRequest);
    JS_EXPORT_PROTOCOL_INHERITS(VNFaceObservationAccepting, NSObject);
    JS_EXPORT_TYPE_INHERITS(VNDetectFaceLandmarksRequest, VNImageBasedRequest);
    JS_EXPORT_TYPE_INHERITS(VNRecognizeTextRequest, VNImageBasedRequest);
    JS_EXPORT_PROTOCOL(VNRequestProgressProviding);
    JS_EXPORT_TYPE(VNImageRequestHandler);
    JS_EXPORT_TYPE(VNSequenceRequestHandler);
    JS_EXPORT_TYPE(VNObservation);
    JS_EXPORT_TYPE_INHERITS(VNDetectedObjectObservation, VNObservation);
    JS_EXPORT_TYPE_INHERITS(VNFaceObservation, VNDetectedObjectObservation);
    JS_EXPORT_TYPE_INHERITS(VNClassificationObservation, VNObservation);
    JS_EXPORT_TYPE_INHERITS(VNRecognizedObjectObservation, VNDetectedObjectObservation);
    JS_EXPORT_TYPE_INHERITS(VNCoreMLFeatureValueObservation, VNObservation);
    JS_EXPORT_TYPE_INHERITS(VNPixelBufferObservation, VNObservation);
    JS_EXPORT_TYPE_INHERITS(VNRectangleObservation, VNDetectedObjectObservation);
    JS_EXPORT_TYPE_INHERITS(VNTextObservation, VNRectangleObservation);
    JS_EXPORT_TYPE(VNRecognizedText);
    JS_EXPORT_TYPE_INHERITS(VNRecognizedTextObservation, VNRectangleObservation);
    JS_EXPORT_TYPE_INHERITS(VNBarcodeObservation, VNRectangleObservation);
    JS_EXPORT_TYPE_INHERITS(VNHorizonObservation, VNObservation);
    JS_EXPORT_TYPE_INHERITS(VNImageAlignmentObservation, VNObservation);
    JS_EXPORT_TYPE_INHERITS(VNImageTranslationAlignmentObservation, VNImageAlignmentObservation);
    JS_EXPORT_TYPE_INHERITS(VNImageHomographicAlignmentObservation, VNImageAlignmentObservation);
    JS_EXPORT_TYPE_INHERITS(VNSaliencyImageObservation, VNPixelBufferObservation);
    JS_EXPORT_TYPE_INHERITS(VNFeaturePrintObservation, VNObservation);

    // CoreVideo
 
    JS_EXPORT_GLOBALS(CVBase);
    JS_EXPORT_GLOBALS(CVBuffer);
    JS_EXPORT_GLOBALS(CVImageBuffer);
    JS_EXPORT_GLOBALS(CVPixelBuffer);

    // CoreMedia

    JS_EXPORT_GLOBALS(CMFormatDescription);
    JS_EXPORT_GLOBALS(CMTime);
    JS_EXPORT_GLOBALS(CMSync);
    JS_EXPORT_GLOBALS(CMTimeRange);
    JS_EXPORT_GLOBALS(CMAttachment);
    JS_EXPORT_GLOBALS(CMSampleBuffer);
    
    // Audio Toolbox

    JS_EXPORT_GLOBALS(AudioComponent);
    JS_EXPORT_GLOBALS(AudioUnitProperties);
    JS_EXPORT_GLOBALS(AUComponent);
    JS_EXPORT_TYPE(AUAudioUnit);
    JS_EXPORT_TYPE(AUParameterNode);
    JS_EXPORT_TYPE(AUParameterGroup);
    JS_EXPORT_TYPE(AUParameterTree);
    JS_EXPORT_TYPE(AUAudioUnitPreset);

    // CoreAudio

    JS_EXPORT_GLOBALS(CoreAudioBaseTypes);

    // AVFoundation

    JS_EXPORT_GLOBALS(AVAudioTypes);
    JS_EXPORT_TYPE(AVAudioPlayer);
    JS_EXPORT_TYPE(AVAudioFormat);
    JS_EXPORT_TYPE(AVAudioSession);
    JS_EXPORT_TYPE(AVAudioSessionChannelDescription);
    JS_EXPORT_TYPE(AVAudioSessionDataSourceDescription);
    JS_EXPORT_TYPE(AVAudioSessionPortDescription);
    JS_EXPORT_TYPE(AVAudioSessionRouteDescription);
    JS_EXPORT_TYPE(AVAudioEngine);
    JS_EXPORT_TYPE(AVAudioNode);
    JS_EXPORT_TYPE(AVAudioTime);
    JS_EXPORT_TYPE(AVAudioConnectionPoint);
    JS_EXPORT_TYPE(AVAudioBuffer);
    JS_EXPORT_TYPE(AVAudioCompressedBuffer);
    JS_EXPORT_TYPE(AVAudioPCMBuffer);
    JS_EXPORT_TYPE(AVAudioIONode);
    JS_EXPORT_TYPE(AVAudioOutputNode);
    JS_EXPORT_TYPE(AVAudioInputNode);
    JS_EXPORT_TYPE(AVAudioMixerNode);
    JS_EXPORT_TYPE(AVAudioPlayerNode);
    JS_EXPORT_TYPE(AVAudioFile);
    JS_EXPORT_TYPE(AVAudioChannelLayout);

    JS_EXPORT_PROTOCOL(AVAudioStereoMixing); // <NSObject>
    JS_EXPORT_PROTOCOL(AVAudio3DMixing); // <NSObject>
    JS_EXPORT_PROTOCOL(AVAudioMixing); // <AVAudioStereoMixing, AVAudio3DMixing>
    JS_EXPORT_TYPE(AVAudioMixingDestination); // : NSObject <AVAudioMixing>
    JS_EXPORT_TYPE(AVAudioEnvironmentNode); // : AVAudioNode <AVAudioMixing>
    JS_EXPORT_TYPE(AVAudioEnvironmentDistanceAttenuationParameters); // : NSObject
    JS_EXPORT_TYPE(AVAudioEnvironmentReverbParameters); // : NSObject

    JS_EXPORT_TYPE(AVAudioUnit); // : AVAudioNode
    JS_EXPORT_TYPE(AVAudioUnitEffect); // : AVAudioUnit
    JS_EXPORT_TYPE(AVAudioUnitEQFilterParameters); // : NSObject
    JS_EXPORT_TYPE(AVAudioUnitEQ); // : AVAudioUnitEffect
    JS_EXPORT_TYPE(AVAudioUnitReverb); // : AVAudioUnitEffect

    JS_EXPORT_TYPE(AVDepthData);
    JS_EXPORT_TYPE(AVPortraitEffectsMatte);
    JS_EXPORT_TYPE(AVCameraCalibrationData);

    JS_EXPORT_TYPE_INHERITS(AVCaptureSession, NSObject);
    #if TARGET_OS_IPHONE_13_0
      JS_EXPORT_TYPE_INHERITS(AVCaptureMultiCamSession, AVCaptureSession);
    #endif
    JS_EXPORT_TYPE_INHERITS(AVCaptureConnection, NSObject);
    JS_EXPORT_TYPE_INHERITS(AVCaptureAudioChannel, NSObject);
    JS_EXPORT_TYPE_INHERITS(AVCaptureOutput, NSObject);
    JS_EXPORT_TYPE_INHERITS(AVMetadataObject, NSObject);
    JS_EXPORT_TYPE_INHERITS(AVMetadataFaceObject, AVMetadataObject);
    JS_EXPORT_TYPE_INHERITS(AVMetadataMachineReadableCodeObject, AVMetadataObject);
    JS_EXPORT_GLOBALS(AVMediaFormat);
    JS_EXPORT_GLOBALS(AVCaptureSessionPreset);
    JS_EXPORT_TYPE_INHERITS(AVCaptureInput, NSObject);
    JS_EXPORT_TYPE_INHERITS(AVCaptureInputPort, NSObject);
    JS_EXPORT_TYPE_INHERITS(AVCaptureDeviceInput, AVCaptureInput);
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
    JS_EXPORT_TYPE_INHERITS(AVCaptureScreenInput, AVCaptureInput);
#endif
    JS_EXPORT_TYPE_INHERITS(AVCaptureMetadataInput, AVCaptureInput);
    JS_EXPORT_TYPE_INHERITS(AVCaptureDevice, NSObject);
    JS_EXPORT_TYPE_INHERITS(AVCaptureDeviceDiscoverySession, NSObject);
    JS_EXPORT_TYPE_INHERITS(AVFrameRateRange, NSObject);
    JS_EXPORT_TYPE_INHERITS(AVCaptureDeviceFormat, NSObject);
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
    JS_EXPORT_TYPE_INHERITS(AVCaptureDeviceInputSource, NSObject);
#endif
    JS_EXPORT_TYPE_INHERITS(AVMetadataGroup, NSObject);
    JS_EXPORT_TYPE_INHERITS(AVTimedMetadataGroup, AVMetadataGroup);
    JS_EXPORT_TYPE_INHERITS(AVMutableTimedMetadataGroup, AVTimedMetadataGroup);
    JS_EXPORT_TYPE_INHERITS(AVDateRangeMetadataGroup, AVMetadataGroup);
    JS_EXPORT_TYPE_INHERITS(AVMutableDateRangeMetadataGroup, AVDateRangeMetadataGroup);
    JS_EXPORT_TYPE_INHERITS(AVCaptureSystemPressureState, NSObject);
    JS_EXPORT_GLOBALS(AVAnimation);
    JS_EXPORT_GLOBALS(AVVideoSettings);
    JS_EXPORT_TYPE_INHERITS(AVCaptureVideoDataOutput, NSObject);
    JS_EXPORT_PROTOCOL(AVCaptureVideoDataOutputSampleBufferDelegate);
    
    // MediaPlayer

    JS_EXPORT_TYPE(MPMediaEntity);
    JS_EXPORT_TYPE(MPMediaItem);
    JS_EXPORT_TYPE(MPMediaItemCollection);
    JS_EXPORT_TYPE(MPMediaPlaylist);
    JS_EXPORT_TYPE(MPMediaQuery);
    JS_EXPORT_TYPE(MPMusicPlayerController);
    JS_EXPORT_TYPE(MPMusicPlayerApplicationController);
    JS_EXPORT_TYPE(MPMusicPlayerQueueDescriptor);

    // Core Location

    JS_EXPORT_TYPE(CLHeading);
    JS_EXPORT_TYPE(CLFloor);
    JS_EXPORT_TYPE(CLLocation);
    JS_EXPORT_TYPE(CLLocationManager);
    JS_EXPORT_PROTOCOL(CLLocationManagerDelegate);
    JS_EXPORT_TYPE(CLGeocoder);
    JS_EXPORT_TYPE(CLPlacemark);
    JS_EXPORT_TYPE(CLVisit);
    JS_EXPORT_TYPE(CLRegion);
    JS_EXPORT_TYPE(CLBeacon);
    JS_EXPORT_TYPE(CLBeaconRegion);

    // Contacts

    JS_EXPORT_TYPE(CNPostalAddress);
    
    // ReplayKit

    JS_EXPORT_TYPE(RPScreenRecorder);
    JS_EXPORT_PROTOCOL(RPScreenRecorderDelegate);
    JS_EXPORT_TYPE(RPPreviewViewController);
    JS_EXPORT_PROTOCOL(RPPreviewViewControllerDelegate);

    // UIKit Custom

    JS_EXPORT_TYPE(GifManager);
    JS_EXPORT_TYPE(Gif);
    JS_EXPORT_TYPE(GifView);

    // CoreAnimation

    JS_EXPORT_TYPE(CADisplayLink);
    JS_EXPORT_TYPE(CATransaction);
    JS_EXPORT_TYPE(CAMediaTimingFunction);
    JS_EXPORT_TYPE(CAValueFunction);
    JS_EXPORT_TYPE(CAAnimation);
    JS_EXPORT_TYPE(CAAnimationGroup);
    JS_EXPORT_TYPE(CATransition);
    JS_EXPORT_TYPE(CAPropertyAnimation);
    JS_EXPORT_TYPE(CAKeyframeAnimation);
    JS_EXPORT_TYPE(CABasicAnimation);
    JS_EXPORT_TYPE(CASpringAnimation);

    JS_EXPORT_PROTOCOL(CAAction);
    JS_EXPORT_PROTOCOL(CALayerDelegate);
    JS_EXPORT_TYPE(CALayer);
    JS_EXPORT_TYPE_INHERITS(AVCaptureVideoPreviewLayer, CALayer); // TODO: move this.
#if !TARGET_OS_SIMULATOR
    JS_EXPORT_PROTOCOL(CAMetalDrawable);
    JS_EXPORT_TYPE(CAMetalLayer);
#endif
    JS_EXPORT_TYPE(CAGradientLayer);
    JS_EXPORT_TYPE(CAShapeLayer);

    JS_EXPORT_TYPE(CAEmitterCell);
    JS_EXPORT_TYPE(CAEmitterLayer);

    // OpenGLES

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
    JS_EXPORT_TYPE(EAGLContext);
    JS_EXPORT_TYPE(EAGLSharegroup);
#endif
    
    // WebGL
    
#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC // TODO: mac
    auto webGL = WebGLRenderingContext::Initialize(isolate);
    exports->Set(JS_STR("WebGLRenderingContext"), webGL.first);
    exports->Set(JS_STR("WebGL2RenderingContext"), WebGL2RenderingContext::Initialize(isolate, webGL.second).first);
#endif

    // GLKit

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
    JS_EXPORT_PROTOCOL(GLKViewControllerDelegate);
    JS_EXPORT_PROTOCOL(GLKViewDelegate);
    JS_EXPORT_TYPE(GLKViewController);
    JS_EXPORT_TYPE(GLKView);
#endif
    
    // ModelIO

    JS_EXPORT_TYPE(MDLAsset);
    JS_EXPORT_TYPE(MDLObject);
    JS_EXPORT_TYPE(MDLCamera);
    JS_EXPORT_TYPE(MDLLight);
    JS_EXPORT_TYPE(MDLMesh);
    JS_EXPORT_TYPE(MDLMeshBufferData);
    JS_EXPORT_TYPE(MDLMeshBufferDataAllocator);
    JS_EXPORT_TYPE(MDLMeshBufferMap);
    JS_EXPORT_TYPE(MDLVertexBufferLayout);
    JS_EXPORT_TYPE(MDLVertexAttribute);
    JS_EXPORT_TYPE(MDLVertexAttributeData);
    JS_EXPORT_TYPE(MDLVertexDescriptor);
    JS_EXPORT_TYPE(MDLSubmesh);
    JS_EXPORT_TYPE(MDLSubmeshTopology);
    JS_EXPORT_TYPE(MDLTransform);
    JS_EXPORT_TYPE(MDLTexture);
    JS_EXPORT_TYPE(MDLTextureFilter);
    JS_EXPORT_TYPE(MDLTextureSampler);
    JS_EXPORT_TYPE(MDLScatteringFunction);
    JS_EXPORT_TYPE(MDLPhysicallyPlausibleScatteringFunction);
    JS_EXPORT_TYPE(MDLMaterialProperty);
    JS_EXPORT_TYPE(MDLMaterial);

    // SpriteKit

#if !TARGET_OS_SIMULATOR
    JS_EXPORT_TYPE(SKRenderer);
#endif
    JS_EXPORT_TYPE(SKPhysicsContact);
    JS_EXPORT_TYPE(SKView);
    JS_EXPORT_TYPE(SKPhysicsBody);
    JS_EXPORT_TYPE(SKPhysicsJoint);
    JS_EXPORT_TYPE(SKPhysicsJointFixed);
    JS_EXPORT_TYPE(SKPhysicsJointLimit);
    JS_EXPORT_TYPE(SKPhysicsJointPin);
    JS_EXPORT_TYPE(SKPhysicsJointSliding);
    JS_EXPORT_TYPE(SKPhysicsJointSpring);
    JS_EXPORT_TYPE(SKNode);
    JS_EXPORT_TYPE(SKTransformNode);
    JS_EXPORT_TYPE(SKEmitterNode);
    JS_EXPORT_TYPE(SKSpriteNode);
    JS_EXPORT_TYPE(SKLabelNode);
    JS_EXPORT_TYPE(SKCameraNode);
    JS_EXPORT_TYPE(SKScene);
    JS_EXPORT_TYPE(SKTransition);
    JS_EXPORT_TYPE(SKAction);
    JS_EXPORT_TYPE(SKTexture);
    JS_EXPORT_TYPE(SKPhysicsWorld);
    JS_EXPORT_TYPE(SKPhysicsContactDelegate);

    // SceneKit

    JS_EXPORT_TYPE(SceneKitTypes);
    JS_EXPORT_TYPE(SCNPhysicsField);
    JS_EXPORT_PROTOCOL(SCNSceneRendererDelegate);
    JS_EXPORT_PROTOCOL(SCNSceneRenderer);
    JS_EXPORT_TYPE(SCNRenderer); // : SCNSceneRenderer
    JS_EXPORT_TYPE(SCNAction);
    JS_EXPORT_TYPE(SCNCamera);
    JS_EXPORT_TYPE(SCNCameraController);
    JS_EXPORT_TYPE(SCNMaterialProperty);
    JS_EXPORT_TYPE(SCNMaterial);
    JS_EXPORT_TYPE(SCNPhysicsBody);
    JS_EXPORT_TYPE(SCNHitTestResult);
    JS_EXPORT_TYPE(SCNGeometry);
    JS_EXPORT_TYPE(SCNGeometrySource);
    JS_EXPORT_TYPE(SCNGeometryElement);
#if SCN_ENABLE_METAL
    JS_EXPORT_TYPE(SCNGeometryTessellator);
#endif
    JS_EXPORT_TYPE(SCNBox);
    JS_EXPORT_TYPE(SCNCapsule);
    JS_EXPORT_TYPE(SCNCone);
    JS_EXPORT_TYPE(SCNCylinder);
    JS_EXPORT_TYPE(SCNFloor);
    JS_EXPORT_TYPE(SCNPlane);
    JS_EXPORT_TYPE(SCNPyramid);
    JS_EXPORT_TYPE(SCNSphere);
    JS_EXPORT_TYPE(SCNTorus);
    JS_EXPORT_TYPE(SCNTube);
    JS_EXPORT_TYPE(SCNText);
    JS_EXPORT_TYPE(SCNShape);
    JS_EXPORT_PROTOCOL(SCNNodeRendererDelegate);
    JS_EXPORT_TYPE(SCNNode);
    JS_EXPORT_TYPE(SCNAudioPlayer);
    JS_EXPORT_TYPE(SCNAudioSource);
    JS_EXPORT_TYPE(SCNScene);
    JS_EXPORT_TYPE(SCNSceneSource);
    JS_EXPORT_TYPE(SCNSkinner);
    JS_EXPORT_TYPE(SCNMorpher);
    JS_EXPORT_TYPE(SCNPhysicsBehavior);
    JS_EXPORT_TYPE(SCNPhysicsHingeJoint); // : SCNPhysicsBehavior
    JS_EXPORT_TYPE(SCNPhysicsBallSocketJoint); // : SCNPhysicsBehavior
    JS_EXPORT_TYPE(SCNPhysicsSliderJoint); // : SCNPhysicsBehavior
    JS_EXPORT_TYPE(SCNPhysicsConeTwistJoint); // : SCNPhysicsBehavior
    JS_EXPORT_TYPE(SCNPhysicsVehicleWheel);
    JS_EXPORT_TYPE(SCNPhysicsVehicle); // : SCNPhysicsBehavior
    JS_EXPORT_TYPE(SCNPhysicsShape);
    JS_EXPORT_TYPE(SCNPhysicsWorld);
    JS_EXPORT_TYPE(SCNView);
    JS_EXPORT_TYPE(SCNLight);
    JS_EXPORT_TYPE(SCNParticleSystem);
    JS_EXPORT_TYPE(SCNParticlePropertyController);

    // Metal

    JS_EXPORT_GLOBALS(MTLPixelFormat);
    JS_EXPORT_GLOBALS(MTLDepthStencil);
    JS_EXPORT_GLOBALS(MTLTypes);

    JS_EXPORT_PROTOCOL(MTLResource); // <MTLResource>
    JS_EXPORT_PROTOCOL(MTLTexture); // <MTLResource>
    JS_EXPORT_PROTOCOL(MTLDevice); // <NSObject>

    JS_EXPORT_TYPE(MTLType); // : NSObject
    JS_EXPORT_TYPE(MTLStructMember); // : NSObject
    JS_EXPORT_TYPE(MTLStructType); // : MTLType
    JS_EXPORT_TYPE(MTLArrayType); // : MTLType
    JS_EXPORT_TYPE(MTLPointerType); // : MTLType
    JS_EXPORT_TYPE(MTLTextureReferenceType); // : MTLType
    JS_EXPORT_TYPE(MTLArgument); // : NSObject

    JS_EXPORT_TYPE(MTLArgumentDescriptor); // : NSObject <NSCopying>

    JS_EXPORT_TYPE(MTLTextureDescriptor); // : NSObject <NSCopying>

    JS_EXPORT_TYPE(MTLRenderPassAttachmentDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_TYPE(MTLRenderPassColorAttachmentDescriptor); // : MTLRenderPassAttachmentDescriptor
    JS_EXPORT_TYPE(MTLRenderPassDepthAttachmentDescriptor); // : MTLRenderPassAttachmentDescriptor
    JS_EXPORT_TYPE(MTLRenderPassStencilAttachmentDescriptor); // : MTLRenderPassAttachmentDescriptor
    JS_EXPORT_TYPE(MTLRenderPassColorAttachmentDescriptorArray); // : NSObject
    JS_EXPORT_TYPE(MTLRenderPassDescriptor); // : NSObject <NSCopying>

    JS_EXPORT_PROTOCOL(MTLCommandQueue); // <NSObject>
    JS_EXPORT_TYPE(MTLHeapDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_PROTOCOL(MTLHeap); // <NSObject>
    JS_EXPORT_PROTOCOL(MTLBuffer); // <MTLResource>

    JS_EXPORT_TYPE(MTLSamplerDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_PROTOCOL(MTLSamplerState); // <NSObject>

    JS_EXPORT_TYPE(MTLStencilDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_TYPE(MTLDepthStencilDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_PROTOCOL(MTLDepthStencilState); // <NSObject>

    JS_EXPORT_TYPE(MTLVertexAttribute); // : NSObject
    JS_EXPORT_TYPE(MTLAttribute); // : NSObject
    JS_EXPORT_TYPE(MTLFunctionConstant); // : NSObject
    JS_EXPORT_TYPE(MTLCompileOptions); // : NSObject <NSCopying>
    JS_EXPORT_PROTOCOL(MTLFunction); // <NSObject>
    JS_EXPORT_PROTOCOL(MTLLibrary); // <NSObject>

    JS_EXPORT_TYPE(MTLRenderPipelineColorAttachmentDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_TYPE(MTLRenderPipelineReflection); // : NSObject
    JS_EXPORT_TYPE(MTLRenderPipelineDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_TYPE(MTLRenderPipelineColorAttachmentDescriptorArray); // : NSObject
#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
    JS_EXPORT_TYPE(MTLTileRenderPipelineColorAttachmentDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_TYPE(MTLTileRenderPipelineColorAttachmentDescriptorArray); // : NSObject
    JS_EXPORT_TYPE(MTLTileRenderPipelineDescriptor); // : NSObject <NSCopying>
#endif
    JS_EXPORT_PROTOCOL(MTLRenderPipelineState); // <NSObject>

    JS_EXPORT_TYPE(MTLVertexBufferLayoutDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_TYPE(MTLVertexBufferLayoutDescriptorArray); // : NSObject
    JS_EXPORT_TYPE(MTLVertexAttributeDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_TYPE(MTLVertexAttributeDescriptorArray); // : NSObject
    JS_EXPORT_TYPE(MTLVertexDescriptor); // : NSObject <NSCopying>

    JS_EXPORT_TYPE(MTLComputePipelineReflection); // : NSObject
    JS_EXPORT_TYPE(MTLComputePipelineDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_PROTOCOL(MTLComputePipelineState); // <NSObject>

    JS_EXPORT_PROTOCOL(MTLFence); // <NSObject>
    JS_EXPORT_PROTOCOL(MTLArgumentEncoder); // <NSObject>

    JS_EXPORT_TYPE(MTLIndirectCommandBufferDescriptor); // : NSObject
    JS_EXPORT_PROTOCOL(MTLIndirectCommandBuffer); // <MTLResource>
    JS_EXPORT_PROTOCOL(MTLIndirectRenderCommand); // <NSObject>
    JS_EXPORT_PROTOCOL(MTLCommandEncoder); // <NSObject>
    JS_EXPORT_PROTOCOL(MTLRenderCommandEncoder); // <MTLCommandEncoder>

    JS_EXPORT_TYPE(MTLBufferLayoutDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_TYPE(MTLBufferLayoutDescriptorArray); // : NSObject
    JS_EXPORT_TYPE(MTLAttributeDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_TYPE(MTLAttributeDescriptorArray); // : NSObject
    JS_EXPORT_TYPE(MTLStageInputOutputDescriptor); // : NSObject <NSCopying>

    JS_EXPORT_PROTOCOL(MTLEvent); // <NSObject>
    JS_EXPORT_PROTOCOL(MTLSharedEvent); // <MTLEvent>
    JS_EXPORT_TYPE(MTLSharedEventListener); // : NSObject
    JS_EXPORT_TYPE(MTLSharedEventHandle); // : NSObject <NSSecureCoding>

    JS_EXPORT_TYPE(MTLFunctionConstantValues); // : NSObject <NSCopying>

    JS_EXPORT_PROTOCOL(MTLCommandBuffer); // <NSObject>
    JS_EXPORT_PROTOCOL(MTLDrawable); // <NSObject>

    JS_EXPORT_PROTOCOL(MTLBlitCommandEncoder); // <MTLCommandEncoder>
    JS_EXPORT_PROTOCOL(MTLParallelRenderCommandEncoder); // <MTLCommandEncoder>
    JS_EXPORT_PROTOCOL(MTLComputeCommandEncoder); // <MTLCommandEncoder>

    JS_EXPORT_GLOBALS(MTLPipeline);
    JS_EXPORT_TYPE(MTLPipelineBufferDescriptor); // : NSObject <NSCopying>
    JS_EXPORT_TYPE(MTLPipelineBufferDescriptorArray); // : NSObject

    // MetalKit
    
    JS_EXPORT_TYPE(MTKView);
    JS_EXPORT_TYPE(MTKViewDelegate);
    
#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
    // ARKit

    JS_EXPORT_TYPE(ARLightEstimate);
    JS_EXPORT_TYPE(ARSKView);
    JS_EXPORT_TYPE(ARSCNView);
    JS_EXPORT_TYPE(ARHitTestResult);
    JS_EXPORT_TYPE(ARSession);
    JS_EXPORT_TYPE(ARConfiguration);
    JS_EXPORT_TYPE(ARWorldTrackingConfiguration);
    JS_EXPORT_TYPE(ARFaceTrackingConfiguration);
    JS_EXPORT_TYPE(ARImageTrackingConfiguration);
    JS_EXPORT_TYPE(ARObjectScanningConfiguration);
    JS_EXPORT_TYPE(AROrientationTrackingConfiguration);
    JS_EXPORT_TYPE(ARPointCloud);
    JS_EXPORT_TYPE(ARReferenceImage);
    JS_EXPORT_TYPE(ARReferenceObject);
    JS_EXPORT_TYPE(ARVideoFormat);
    JS_EXPORT_TYPE(ARWorldMap);
    JS_EXPORT_TYPE(ARCamera);
    JS_EXPORT_TYPE(ARFrame);
    JS_EXPORT_TYPE(ARAnchor);
    JS_EXPORT_TYPE(ARCollaborationData);
    JS_EXPORT_TYPE(ARTrackedRaycast);
    JS_EXPORT_PROTOCOL(ARSessionObserver);
    JS_EXPORT_PROTOCOL(ARSessionDelegate);
    JS_EXPORT_PROTOCOL(ARSessionProviding);
    JS_EXPORT_TYPE(ARRaycastQuery);
    JS_EXPORT_TYPE(ARRaycastResult);
    JS_EXPORT_PROTOCOL(ARSKViewDelegate);
    JS_EXPORT_PROTOCOL(ARSCNViewDelegate);
#endif

    // MapKit

    JS_EXPORT_TYPE(MKMapView);
    JS_EXPORT_TYPE(MKAnnotation);
    JS_EXPORT_TYPE(MKClusterAnnotation);
    JS_EXPORT_TYPE(MKAnnotationView);
    JS_EXPORT_TYPE(MKMapViewDelegate);
    JS_EXPORT_TYPE(MKMapCamera);
    JS_EXPORT_TYPE(MKOverlayRenderer);
    JS_EXPORT_TYPE(MKOverlayView);
    JS_EXPORT_TYPE(MKUserLocation);

    // core image

    JS_EXPORT_TYPE(CIColor);
    JS_EXPORT_TYPE(CIImage);
    JS_EXPORT_TYPE(CIFilter);
    JS_EXPORT_TYPE(CIKernel);
    JS_EXPORT_TYPE(CIColorKernel); // : CIKernel
    JS_EXPORT_TYPE(CIWarpKernel); // : CIKernel
    JS_EXPORT_TYPE(CIBlendKernel); // : CIColorKernel
}

Nan::Persistent<FunctionTemplate>& NNSObject::GetNSObjectType(NSObject* obj, Nan::Persistent<FunctionTemplate>& unset) {
  if (obj != nullptr) {
    //auto wrapper = (Nan::Persistent<FunctionTemplate>**)[obj associatedWrapperForKey:@"sweetiekit.type"];
    
    NSObjectWrapper* wrapper = objc_getAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"]);
    if (wrapper != nullptr) {
      Nan::Persistent<FunctionTemplate>** p = (Nan::Persistent<FunctionTemplate>**)wrapper.ptr;
      if (p != nullptr && *p != nullptr) {
        return **p;
      }
    }
    if (wrapper == nullptr) {
    
#define JS_RETURN_TYPE_FROM(Type, ObjcType, inherits) \
      if ([obj isKindOfClass:[ObjcType class]]) { \
        return N##Type::type; \
      }

#define JS_RETURN_TYPE_INHERITS(Type, inherits) \
      JS_RETURN_TYPE_FROM(Type, Type, inherits)

#define JS_RETURN_TYPE(Type) \
      JS_RETURN_TYPE_FROM(Type, Type, NSObject)

#define JS_RETURN_PROTOCOL_FROM(Type, ObjcType, inherits) \
      if ([obj conformsToProtocol:ObjcType##Protocol]) { \
        return N##Type::type; \
      }

#define JS_RETURN_PROTOCOL_INHERITS(Type, inherits) \
      JS_RETURN_PROTOCOL_FROM(Type, Type, inherits)

#define JS_RETURN_PROTOCOL(Type) \
      JS_RETURN_PROTOCOL_FROM(Type, Type, NSObject)

      // GLKit

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC // TODO: mac
      JS_RETURN_TYPE(GLKViewController);
      JS_RETURN_TYPE(GLKView);
#endif

      // Core Animation

      JS_RETURN_TYPE(CAEmitterCell);
      JS_RETURN_TYPE(CAEmitterLayer);

      JS_RETURN_TYPE(CAShapeLayer);
      JS_RETURN_TYPE(CAGradientLayer);
#if !TARGET_OS_SIMULATOR
      JS_RETURN_TYPE(CAMetalLayer);
#endif
      JS_RETURN_TYPE_INHERITS(AVCaptureVideoPreviewLayer, CALayer); // TODO: move this.
      JS_RETURN_TYPE(CALayer);

      JS_RETURN_TYPE(CASpringAnimation);
      JS_RETURN_TYPE(CABasicAnimation);
      JS_RETURN_TYPE(CAKeyframeAnimation);
      JS_RETURN_TYPE(CAPropertyAnimation);
      JS_RETURN_TYPE(CATransition);
      JS_RETURN_TYPE(CAAnimationGroup);
      JS_RETURN_TYPE(CAAnimation);
      JS_RETURN_TYPE(CAValueFunction);
      JS_RETURN_TYPE(CAMediaTimingFunction);
      JS_RETURN_TYPE(CATransaction);
      JS_RETURN_TYPE(CADisplayLink);
      
      // Core Image

      JS_RETURN_TYPE(CIBlendKernel); // : CIColorKernel
      JS_RETURN_TYPE(CIWarpKernel); // : CIKernel
      JS_RETURN_TYPE(CIColorKernel); // : CIKernel
      JS_RETURN_TYPE(CIKernel);
      JS_RETURN_TYPE(CIFilter);
      JS_RETURN_TYPE(CIImage);
      JS_RETURN_TYPE(CIColor);

      // MapKit

      JS_RETURN_TYPE(MKUserLocation);
      JS_RETURN_TYPE(MKOverlayView);
      JS_RETURN_TYPE(MKOverlayRenderer);
      JS_RETURN_TYPE(MKMapCamera);
      JS_RETURN_TYPE(MKMapView);
      JS_RETURN_TYPE(MKAnnotationView);
      JS_RETURN_TYPE(MKClusterAnnotation);
      JS_RETURN_TYPE(MKAnnotation);
      
      // MetalKit
    
      JS_RETURN_TYPE(MTKView);

      // Metal

      JS_RETURN_TYPE(MTLPipelineBufferDescriptorArray); // : NSObject
      JS_RETURN_TYPE(MTLPipelineBufferDescriptor); // : NSObject <NSCopying>

      JS_RETURN_TYPE(MTLFunctionConstantValues); // : NSObject <NSCopying>

      JS_RETURN_TYPE(MTLSharedEventHandle); // : NSObject <NSSecureCoding>
      JS_RETURN_TYPE(MTLSharedEventListener); // : NSObject

      JS_RETURN_TYPE(MTLStageInputOutputDescriptor); // : NSObject <NSCopying>
      JS_RETURN_TYPE(MTLAttributeDescriptorArray); // : NSObject
      JS_RETURN_TYPE(MTLAttributeDescriptor); // : NSObject <NSCopying>
      JS_RETURN_TYPE(MTLBufferLayoutDescriptorArray); // : NSObject
      JS_RETURN_TYPE(MTLBufferLayoutDescriptor); // : NSObject <NSCopying>

      JS_RETURN_TYPE(MTLIndirectCommandBufferDescriptor); // : NSObject

      JS_RETURN_TYPE(MTLComputePipelineDescriptor); // : NSObject <NSCopying>
      JS_RETURN_TYPE(MTLComputePipelineReflection); // : NSObject

      JS_RETURN_TYPE(MTLVertexDescriptor); // : NSObject <NSCopying>
      JS_RETURN_TYPE(MTLVertexAttributeDescriptorArray); // : NSObject
      JS_RETURN_TYPE(MTLVertexAttributeDescriptor); // : NSObject <NSCopying>
      JS_RETURN_TYPE(MTLVertexBufferLayoutDescriptorArray); // : NSObject
      JS_RETURN_TYPE(MTLVertexBufferLayoutDescriptor); // : NSObject <NSCopying>

      JS_RETURN_TYPE(MTLRenderPipelineColorAttachmentDescriptor); // : NSObject <NSCopying>
#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
      JS_RETURN_TYPE(MTLTileRenderPipelineDescriptor); // : NSObject <NSCopying>
      JS_RETURN_TYPE(MTLTileRenderPipelineColorAttachmentDescriptorArray); // : NSObject
      JS_RETURN_TYPE(MTLTileRenderPipelineColorAttachmentDescriptor); // : NSObject <NSCopying>
#endif
      JS_RETURN_TYPE(MTLRenderPipelineColorAttachmentDescriptorArray); // : NSObject
      JS_RETURN_TYPE(MTLRenderPipelineDescriptor); // : NSObject <NSCopying>
      JS_RETURN_TYPE(MTLRenderPipelineReflection); // : NSObject

      JS_RETURN_TYPE(MTLCompileOptions); // : NSObject <NSCopying>
      JS_RETURN_TYPE(MTLFunctionConstant); // : NSObject
      JS_RETURN_TYPE(MTLAttribute); // : NSObject
      JS_RETURN_TYPE(MTLVertexAttribute); // : NSObject

      JS_RETURN_TYPE(MTLDepthStencilDescriptor); // : NSObject <NSCopying>
      JS_RETURN_TYPE(MTLStencilDescriptor); // : NSObject <NSCopying>

      JS_RETURN_TYPE(MTLSamplerDescriptor); // : NSObject <NSCopying>

      JS_RETURN_TYPE(MTLHeapDescriptor); // : NSObject <NSCopying>

      JS_RETURN_TYPE(MTLRenderPassDescriptor); // : NSObject <NSCopying>
      JS_RETURN_TYPE(MTLRenderPassColorAttachmentDescriptorArray); // : NSObject
      JS_RETURN_TYPE(MTLRenderPassStencilAttachmentDescriptor); // : MTLRenderPassAttachmentDescriptor
      JS_RETURN_TYPE(MTLRenderPassDepthAttachmentDescriptor); // : MTLRenderPassAttachmentDescriptor
      JS_RETURN_TYPE(MTLRenderPassColorAttachmentDescriptor); // : MTLRenderPassAttachmentDescriptor
      JS_RETURN_TYPE(MTLRenderPassAttachmentDescriptor); // : NSObject <NSCopying>

      JS_RETURN_TYPE(MTLTextureDescriptor); // : NSObject <NSCopying>

      JS_RETURN_TYPE(MTLArgumentDescriptor); // : NSObject <NSCopying>

      JS_RETURN_TYPE(MTLArgument); // : NSObject
      JS_RETURN_TYPE(MTLTextureReferenceType); // : MTLType
      JS_RETURN_TYPE(MTLPointerType); // : MTLType
      JS_RETURN_TYPE(MTLArrayType); // : MTLType
      JS_RETURN_TYPE(MTLStructType); // : MTLType
      JS_RETURN_TYPE(MTLStructMember); // : NSObject
      JS_RETURN_TYPE(MTLType); // : NSObject

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
      // ARKit

      JS_RETURN_TYPE(ARLightEstimate);
      JS_RETURN_TYPE(ARCamera);
      JS_RETURN_TYPE(ARFrame);
      JS_RETURN_TYPE(ARTrackedRaycast);
      JS_RETURN_TYPE(ARCollaborationData);
      JS_RETURN_TYPE(ARAnchor);
      JS_RETURN_TYPE(ARSKView);
      JS_RETURN_TYPE(ARSCNView);
      JS_RETURN_TYPE(ARHitTestResult);
      JS_RETURN_TYPE(ARSession);
      JS_RETURN_TYPE(ARVideoFormat);
      JS_RETURN_TYPE(ARReferenceObject);
      JS_RETURN_TYPE(ARReferenceImage);
      JS_RETURN_TYPE(ARPointCloud);
      JS_RETURN_TYPE(AROrientationTrackingConfiguration);
      JS_RETURN_TYPE(ARObjectScanningConfiguration);
      JS_RETURN_TYPE(ARImageTrackingConfiguration);
      JS_RETURN_TYPE(ARFaceTrackingConfiguration);
      JS_RETURN_TYPE(ARWorldTrackingConfiguration);
      JS_RETURN_TYPE(ARConfiguration);
#endif

      //SceneKit

      JS_RETURN_TYPE(SceneKitTypes);
      JS_RETURN_TYPE(SCNPhysicsField);
      JS_RETURN_TYPE(SCNRenderer);
      JS_RETURN_TYPE(SCNParticleSystem);
      JS_RETURN_TYPE(SCNParticlePropertyController);
      JS_RETURN_TYPE(SCNAction);
      JS_RETURN_TYPE(SCNAudioPlayer);
      JS_RETURN_TYPE(SCNAudioSource);
      JS_RETURN_TYPE(SCNMaterial);
      JS_RETURN_TYPE(SCNMaterialProperty);
      JS_RETURN_TYPE(SCNCamera);
      JS_RETURN_TYPE(SCNCameraController);
      JS_RETURN_TYPE(SCNPhysicsBody);
      JS_RETURN_TYPE(SCNHitTestResult);
      JS_RETURN_TYPE(SCNBox);
      JS_RETURN_TYPE(SCNCapsule);
      JS_RETURN_TYPE(SCNCone);
      JS_RETURN_TYPE(SCNCylinder);
      JS_RETURN_TYPE(SCNFloor);
      JS_RETURN_TYPE(SCNPlane);
      JS_RETURN_TYPE(SCNPyramid);
      JS_RETURN_TYPE(SCNSphere);
      JS_RETURN_TYPE(SCNText);
      JS_RETURN_TYPE(SCNTorus);
      JS_RETURN_TYPE(SCNTube);
      JS_RETURN_TYPE(SCNText);
      JS_RETURN_TYPE(SCNShape);
#if SCN_ENABLE_METAL
      JS_RETURN_TYPE(SCNGeometryTessellator);
#endif
      JS_RETURN_TYPE(SCNGeometryElement);
      JS_RETURN_TYPE(SCNGeometrySource);
      JS_RETURN_TYPE(SCNGeometry);
      JS_RETURN_TYPE(SCNLight);
      JS_RETURN_TYPE(SCNPhysicsWorld);
      JS_RETURN_TYPE(SCNPhysicsShape);
      JS_RETURN_TYPE(SCNPhysicsVehicle); // : SCNPhysicsBehavior
      JS_RETURN_TYPE(SCNPhysicsVehicleWheel);
      JS_RETURN_TYPE(SCNPhysicsConeTwistJoint); // : SCNPhysicsBehavior
      JS_RETURN_TYPE(SCNPhysicsSliderJoint); // : SCNPhysicsBehavior
      JS_RETURN_TYPE(SCNPhysicsBallSocketJoint); // : SCNPhysicsBehavior
      JS_RETURN_TYPE(SCNPhysicsHingeJoint); // : SCNPhysicsBehavior
      JS_RETURN_TYPE(SCNPhysicsBehavior);
      JS_RETURN_TYPE(SCNMorpher);
      JS_RETURN_TYPE(SCNSkinner);
      JS_RETURN_TYPE(SCNSceneSource);
      JS_RETURN_TYPE(SCNScene);
      JS_RETURN_TYPE(SCNNode);
      JS_RETURN_TYPE(SCNView);
      
      // SpriteKit

      JS_RETURN_TYPE(SKTexture);
      JS_RETURN_TYPE(SKEmitterNode);
      JS_RETURN_TYPE(SKCameraNode);
      JS_RETURN_TYPE(SKPhysicsWorld);
      JS_RETURN_TYPE(SKPhysicsContact);
      if ([NSStringFromClass([obj class]) isEqual: @"PKPhysicsContact"]) {
        return NSKPhysicsContact::type;
      }
      JS_RETURN_TYPE(SKPhysicsContactDelegate);
      JS_RETURN_TYPE(SKPhysicsWorld);
      JS_RETURN_TYPE(SKPhysicsJointSpring);
      JS_RETURN_TYPE(SKPhysicsJointSliding);
      JS_RETURN_TYPE(SKPhysicsJointPin);
      JS_RETURN_TYPE(SKPhysicsJointLimit);
      JS_RETURN_TYPE(SKPhysicsJointFixed);
      JS_RETURN_TYPE(SKPhysicsJoint);
      JS_RETURN_TYPE(SKPhysicsBody);
      JS_RETURN_TYPE(SKSpriteNode);
      JS_RETURN_TYPE(SKTransition);
      JS_RETURN_TYPE(SKScene);
      JS_RETURN_TYPE(SKLabelNode);
      JS_RETURN_TYPE(SKTransformNode);
      JS_RETURN_TYPE(SKNode);
      JS_RETURN_TYPE(SKView);
      JS_RETURN_TYPE(SKAction);
#if !TARGET_OS_SIMULATOR
      JS_RETURN_TYPE(SKRenderer);
#endif

      // ModelIO

      JS_RETURN_TYPE(MDLMaterial);
      JS_RETURN_TYPE(MDLMaterialProperty);
      JS_RETURN_TYPE(MDLPhysicallyPlausibleScatteringFunction);
      JS_RETURN_TYPE(MDLScatteringFunction);
      JS_RETURN_TYPE(MDLTextureSampler);
      JS_RETURN_TYPE(MDLTextureFilter);
      JS_RETURN_TYPE(MDLTexture);
      JS_RETURN_TYPE(MDLTransform);
      JS_RETURN_TYPE(MDLMeshBufferDataAllocator);
      JS_RETURN_TYPE(MDLMeshBufferData);
      JS_RETURN_TYPE(MDLMeshBufferMap);
      JS_RETURN_TYPE(MDLVertexDescriptor);
      JS_RETURN_TYPE(MDLVertexBufferLayout);
      JS_RETURN_TYPE(MDLVertexAttribute);
      JS_RETURN_TYPE(MDLVertexAttributeData);
      JS_RETURN_TYPE(MDLCamera);
      JS_RETURN_TYPE(MDLLight);
      JS_RETURN_TYPE(MDLMesh);
      JS_RETURN_TYPE(MDLSubmeshTopology);
      JS_RETURN_TYPE(MDLSubmesh);
      JS_RETURN_TYPE(MDLObject);
      JS_RETURN_TYPE(MDLAsset);

      // OpenGLES

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
      JS_RETURN_TYPE(EAGLContext);
      JS_RETURN_TYPE(EAGLSharegroup);
#endif

      // Custom UIKit

      JS_RETURN_TYPE(GifManager);
      JS_RETURN_TYPE(Gif);
      JS_RETURN_TYPE(GifView);

      // Core Location

      JS_RETURN_TYPE(CLBeaconRegion);
      JS_RETURN_TYPE(CLBeacon);
      JS_RETURN_TYPE(CLRegion);
      JS_RETURN_TYPE(CLVisit);
      JS_RETURN_TYPE(CLGeocoder);
      JS_RETURN_TYPE(CLPlacemark);
      JS_RETURN_TYPE(CLLocation);
      JS_RETURN_TYPE(CLFloor);
      JS_RETURN_TYPE(CLHeading);
      JS_RETURN_TYPE(CLLocationManager);
      
      // ReplayKit

      JS_RETURN_TYPE(RPScreenRecorder);
      JS_RETURN_TYPE(RPPreviewViewController);
      
      // MediaPlayer

      JS_RETURN_TYPE(MPMusicPlayerQueueDescriptor);
      JS_RETURN_TYPE(MPMusicPlayerApplicationController);
      JS_RETURN_TYPE(MPMusicPlayerController);
      JS_RETURN_TYPE(MPMediaQuery);
      JS_RETURN_TYPE(MPMediaPlaylist);
      JS_RETURN_TYPE(MPMediaItemCollection);
      JS_RETURN_TYPE(MPMediaItem);
      JS_RETURN_TYPE(MPMediaEntity);
      
      // Audio Toolbox

      JS_RETURN_TYPE(AUAudioUnit);
      JS_RETURN_TYPE(AUAudioUnitPreset);
      JS_RETURN_TYPE(AUParameterTree);
      JS_RETURN_TYPE(AUParameterGroup);
      JS_RETURN_TYPE(AUParameterNode);

      // CoreMedia

      // Vision

      JS_RETURN_TYPE_INHERITS(VNFeaturePrintObservation, VNObservation);
      JS_RETURN_TYPE_INHERITS(VNSaliencyImageObservation, VNPixelBufferObservation);
      JS_RETURN_TYPE_INHERITS(VNImageHomographicAlignmentObservation, VNImageAlignmentObservation);
      JS_RETURN_TYPE_INHERITS(VNImageTranslationAlignmentObservation, VNImageAlignmentObservation);
      JS_RETURN_TYPE_INHERITS(VNImageAlignmentObservation, VNObservation);
      JS_RETURN_TYPE_INHERITS(VNHorizonObservation, VNObservation);
      JS_RETURN_TYPE_INHERITS(VNBarcodeObservation, VNRectangleObservation);
      JS_RETURN_TYPE_INHERITS(VNRecognizedTextObservation, VNRectangleObservation);
      JS_RETURN_TYPE(VNRecognizedText);
      JS_RETURN_TYPE_INHERITS(VNTextObservation, VNRectangleObservation);
      JS_RETURN_TYPE_INHERITS(VNRectangleObservation, VNDetectedObjectObservation);
      JS_RETURN_TYPE_INHERITS(VNPixelBufferObservation, VNObservation);
      JS_RETURN_TYPE_INHERITS(VNCoreMLFeatureValueObservation, VNObservation);
      JS_RETURN_TYPE_INHERITS(VNRecognizedObjectObservation, VNDetectedObjectObservation);
      JS_RETURN_TYPE_INHERITS(VNClassificationObservation, VNObservation);
      JS_RETURN_TYPE_INHERITS(VNFaceObservation, VNDetectedObjectObservation);
      JS_RETURN_TYPE_INHERITS(VNDetectedObjectObservation, VNObservation);
      JS_RETURN_TYPE(VNObservation);
      JS_RETURN_TYPE(VNSequenceRequestHandler);
      JS_RETURN_TYPE(VNImageRequestHandler);
      JS_RETURN_TYPE_INHERITS(VNRecognizeTextRequest, VNImageBasedRequest);
      JS_RETURN_TYPE_INHERITS(VNDetectFaceLandmarksRequest, VNImageBasedRequest);
      JS_RETURN_TYPE_INHERITS(VNDetectFaceRectanglesRequest, VNImageBasedRequest);
      JS_RETURN_TYPE_INHERITS(VNDetectTextRectanglesRequest, VNImageBasedRequest);
      JS_RETURN_TYPE_INHERITS(VNImageBasedRequest, VNRequest);
      JS_RETURN_TYPE(VNRequest);

      // AVFoundation

      JS_RETURN_TYPE_INHERITS(AVCaptureVideoDataOutput, NSObject);
      JS_RETURN_TYPE_INHERITS(AVCaptureSystemPressureState, NSObject);
      JS_RETURN_TYPE_INHERITS(AVMutableDateRangeMetadataGroup, AVDateRangeMetadataGroup);
      JS_RETURN_TYPE_INHERITS(AVDateRangeMetadataGroup, AVMetadataGroup);
      JS_RETURN_TYPE_INHERITS(AVMutableTimedMetadataGroup, AVTimedMetadataGroup);
      JS_RETURN_TYPE_INHERITS(AVTimedMetadataGroup, AVMetadataGroup);
      JS_RETURN_TYPE_INHERITS(AVMetadataGroup, NSObject);
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
      JS_RETURN_TYPE_INHERITS(AVCaptureDeviceInputSource, NSObject);
#endif
      JS_RETURN_TYPE_INHERITS(AVCaptureDeviceFormat, NSObject);
      JS_RETURN_TYPE_INHERITS(AVFrameRateRange, NSObject);
      JS_RETURN_TYPE_INHERITS(AVCaptureDeviceDiscoverySession, NSObject);
      JS_RETURN_TYPE_INHERITS(AVCaptureDevice, NSObject);
      JS_RETURN_TYPE_INHERITS(AVCaptureMetadataInput, AVCaptureInput);
#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV
      JS_RETURN_TYPE_INHERITS(AVCaptureScreenInput, AVCaptureInput);
#endif
      JS_RETURN_TYPE_INHERITS(AVCaptureDeviceInput, AVCaptureInput);
      JS_RETURN_TYPE_INHERITS(AVCaptureInputPort, NSObject);
      JS_RETURN_TYPE_INHERITS(AVCaptureInput, NSObject);
      JS_RETURN_TYPE_INHERITS(AVMetadataMachineReadableCodeObject, AVMetadataObject);
      JS_RETURN_TYPE_INHERITS(AVMetadataFaceObject, AVMetadataObject);
      JS_RETURN_TYPE_INHERITS(AVMetadataObject, NSObject);
      JS_RETURN_TYPE_INHERITS(AVCaptureOutput, NSObject);
      JS_RETURN_TYPE_INHERITS(AVCaptureAudioChannel, NSObject);
      JS_RETURN_TYPE_INHERITS(AVCaptureConnection, NSObject);
#if TARGET_OS_IPHONE_13_0
      JS_RETURN_TYPE_INHERITS(AVCaptureMultiCamSession, AVCaptureSession);
#endif
      JS_RETURN_TYPE_INHERITS(AVCaptureSession, NSObject);

      JS_RETURN_TYPE(AVCameraCalibrationData);
      JS_RETURN_TYPE(AVPortraitEffectsMatte);
      JS_RETURN_TYPE(AVDepthData);

      JS_RETURN_TYPE(AVAudioPlayer);
      JS_RETURN_TYPE(AVAudioFormat);
      JS_RETURN_TYPE(AVAudioSession);
      JS_RETURN_TYPE(AVAudioSessionChannelDescription);
      JS_RETURN_TYPE(AVAudioSessionDataSourceDescription);
      JS_RETURN_TYPE(AVAudioSessionPortDescription);
      JS_RETURN_TYPE(AVAudioSessionRouteDescription);

      JS_RETURN_TYPE(AVAudioUnitReverb); // : AVAudioUnitEffect
      JS_RETURN_TYPE(AVAudioUnitEQ); // : AVAudioUnitEffect
      JS_RETURN_TYPE(AVAudioUnitEQFilterParameters); // : NSObject
      JS_RETURN_TYPE(AVAudioUnitEffect); // : AVAudioUnit
      JS_RETURN_TYPE(AVAudioUnit); // : AVAudioNode

      JS_RETURN_TYPE(AVAudioEnvironmentReverbParameters); // : NSObject
      JS_RETURN_TYPE(AVAudioEnvironmentDistanceAttenuationParameters); // : NSObject
      JS_RETURN_TYPE(AVAudioEnvironmentNode); // : AVAudioNode <AVAudioMixing>
      JS_RETURN_TYPE(AVAudioMixingDestination); // : NSObject <AVAudioMixing>

      JS_RETURN_TYPE(AVAudioChannelLayout);
      JS_RETURN_TYPE(AVAudioFile);
      JS_RETURN_TYPE(AVAudioPlayerNode);
      JS_RETURN_TYPE(AVAudioMixerNode);
      JS_RETURN_TYPE(AVAudioInputNode);
      JS_RETURN_TYPE(AVAudioOutputNode);
      JS_RETURN_TYPE(AVAudioIONode);
      JS_RETURN_TYPE(AVAudioPCMBuffer);
      JS_RETURN_TYPE(AVAudioCompressedBuffer);
      JS_RETURN_TYPE(AVAudioBuffer);
      JS_RETURN_TYPE(AVAudioConnectionPoint);
      JS_RETURN_TYPE(AVAudioTime);
      JS_RETURN_TYPE(AVAudioNode);
      JS_RETURN_TYPE(AVAudioEngine);

      // WebKit

      JS_RETURN_TYPE(WKNavigationDelegate);
      JS_RETURN_TYPE(WKNavigation);
      JS_RETURN_TYPE(WKWebView);

      // UIKit

      JS_RETURN_TYPE(UICubicTimingParameters);
      JS_RETURN_TYPE(UISpringTimingParameters);

      JS_RETURN_TYPE(UITargetedDragPreview);
      JS_RETURN_TYPE(UITableViewHeaderFooterView); // : UIView
      JS_RETURN_TYPE(UITableViewDropProposal); // : UIDropProposal
      JS_RETURN_TYPE(UITableViewDropPlaceholder);
      JS_RETURN_TYPE(UITableViewPlaceholder);
      JS_RETURN_TYPE(UIDragPreviewTarget);
      JS_RETURN_TYPE(UIDragPreviewParameters);
      JS_RETURN_TYPE(UIDragItem);
      JS_RETURN_TYPE(UIDragInteraction);

      JS_RETURN_TYPE(UIDropProposal);
      JS_RETURN_TYPE(UIDropInteraction);
      JS_RETURN_TYPE(UIFocusAnimationCoordinator);
      JS_RETURN_TYPE(UITableViewFocusUpdateContext); // : NUIFocusUpdateContext
      JS_RETURN_TYPE(UIFocusUpdateContext);
      JS_RETURN_TYPE(UITableViewRowAction);
      JS_RETURN_TYPE(UIContextualAction);
      JS_RETURN_TYPE(UISwipeActionsConfiguration);
      
      // ======== controllers
      JS_RETURN_TYPE(UIAlertController);
      JS_RETURN_TYPE(UICollectionViewController);
      JS_RETURN_TYPE(UITableViewController);
      JS_RETURN_TYPE(UIImagePickerController);
      JS_RETURN_TYPE(UINavigationController);
      JS_RETURN_TYPE(UISearchController);
      JS_RETURN_TYPE(UISplitViewController);
      JS_RETURN_TYPE(UITabBarController);
      JS_RETURN_TYPE(UIPopoverPresentationController);
      JS_RETURN_TYPE(UIPresentationController);
      JS_RETURN_TYPE(UIInputViewController);
      JS_RETURN_TYPE(UIViewController);
      JS_RETURN_TYPE(UIViewPropertyAnimator);
      // ========= views
      JS_RETURN_TYPE(UIInputView);
      JS_RETURN_TYPE(UIStackView);
      JS_RETURN_TYPE(UITabBar);
      JS_RETURN_TYPE(UIDatePicker);
      JS_RETURN_TYPE(UIProgressView);
      JS_RETURN_TYPE(UIPickerView);
      JS_RETURN_TYPE(UINavigationItem);
      JS_RETURN_TYPE(UINavigationBar);
      JS_RETURN_TYPE(UIPageControl);
      JS_RETURN_TYPE(UISlider);
      JS_RETURN_TYPE(UICollectionViewTransitionLayout);
      JS_RETURN_TYPE(UICollectionViewFlowLayoutInvalidationContext);
      JS_RETURN_TYPE(UICollectionViewFlowLayout);
      JS_RETURN_TYPE(UICollectionViewUpdateItem);
      JS_RETURN_TYPE(UICollectionViewLayoutInvalidationContext);
      JS_RETURN_TYPE(UICollectionViewLayoutAttributes);
      JS_RETURN_TYPE(UICollectionViewLayout);
      JS_RETURN_TYPE(UICollectionViewCell);
      JS_RETURN_TYPE(UICollectionReusableView);
      JS_RETURN_TYPE(UICollectionView);
      JS_RETURN_TYPE(UITableView);
      JS_RETURN_TYPE(UIScrollView);
      JS_RETURN_TYPE(UITableViewCell);
      JS_RETURN_TYPE(UILabel);
      JS_RETURN_TYPE(UIFont);
      JS_RETURN_TYPE(UIButton);
      JS_RETURN_TYPE(UIStepper);
      JS_RETURN_TYPE(UISegmentedControl);
    
      JS_RETURN_TYPE(UIToolbar);
      JS_RETURN_TYPE(UITraitCollection);
      JS_RETURN_TYPE(UIImageAsset);
      JS_RETURN_TYPE(UIGraphicsImageRendererFormat);
      JS_RETURN_TYPE(UIGraphicsRendererFormat);
      
      JS_RETURN_TYPE(UIImageView);
      JS_RETURN_TYPE(UIImage);
      JS_RETURN_TYPE(UIVisualEffectView);
      JS_RETURN_TYPE(UIBlurEffect);
      JS_RETURN_TYPE(UIVisualEffect);
      JS_RETURN_TYPE(UIStoryboard);
      JS_RETURN_TYPE(UITextInputDelegate);
      JS_RETURN_TYPE(UITextFieldDelegate);
      JS_RETURN_TYPE(UITextField);
      JS_RETURN_TYPE(UITextSelectionRect);
      JS_RETURN_TYPE(UITextRange);
      JS_RETURN_TYPE(UITextPosition);
      JS_RETURN_TYPE(UITextInputPasswordRules);
      JS_RETURN_TYPE(UITextInputMode);
      JS_RETURN_TYPE(UITextInputStringTokenizer);
      JS_RETURN_TYPE(UITextInputAssistantItem);
//      JS_RETURN_TYPE(UITextInput);
      JS_RETURN_TYPE(UIStoryboardUnwindSegueSource);
      JS_RETURN_TYPE(UIStoryboardSegue);
      JS_RETURN_TYPE(UIKeyCommand);
      JS_RETURN_TYPE(UISwitch);
      JS_RETURN_TYPE(UIRefreshControl);
      JS_RETURN_TYPE(UIControl);
      JS_RETURN_TYPE(UIUserNotificationSettings);
      JS_RETURN_TYPE(UILocalNotification);
      JS_RETURN_TYPE(UIFocusSystem);
      JS_RETURN_TYPE(UIScreenMode);
      JS_RETURN_TYPE(UIScreen);
      JS_RETURN_TYPE(UIWindow);
      JS_RETURN_TYPE(UIView);
      JS_RETURN_TYPE(UITabBarItem);
      JS_RETURN_TYPE(UIBarButtonItem);
      JS_RETURN_TYPE(UIBarCommon);
      // ========= delegates
      JS_RETURN_TYPE_FROM(UIPickerViewManager, SUIPickerViewManager, NSObject);
      JS_RETURN_TYPE_FROM(UICollectionViewManager, SUICollectionViewManager, NSObject);
      JS_RETURN_TYPE(UIImagePickerControllerDelegate);
      JS_RETURN_TYPE(UIViewControllerTransitioningDelegate);
      // ========= objects
      JS_RETURN_TYPE(NSLayoutYAxisAnchor);
      JS_RETURN_TYPE(NSLayoutXAxisAnchor);
      JS_RETURN_TYPE(NSLayoutDimension);
      JS_RETURN_TYPE(NSLayoutConstraint);
      JS_RETURN_TYPE(NSLayoutAnchor);
            
      JS_RETURN_TYPE(UILongPressGestureRecognizer);
      JS_RETURN_TYPE(UIScreenEdgePanGestureRecognizer);
      JS_RETURN_TYPE(UIPanGestureRecognizer);
      JS_RETURN_TYPE(UISwipeGestureRecognizer);
      JS_RETURN_TYPE(UIRotationGestureRecognizer);
      JS_RETURN_TYPE(UIPinchGestureRecognizer);
      JS_RETURN_TYPE(UITapGestureRecognizer);
      JS_RETURN_TYPE(UIGestureRecognizer);

      JS_RETURN_TYPE(UIBezierPath);
      JS_RETURN_TYPE(UIMotionEffect);
      JS_RETURN_TYPE(UILayoutGuide);
      JS_RETURN_TYPE(UIApplication);
      JS_RETURN_TYPE(UIPress);
      JS_RETURN_TYPE(UITouch);
      JS_RETURN_TYPE(UIPressesEvent);
      JS_RETURN_TYPE(UIEvent);
      JS_RETURN_TYPE(UIResponder);
      JS_RETURN_TYPE(UIAlertAction);
      JS_RETURN_TYPE(UILexiconEntry);
      JS_RETURN_TYPE(UILexicon);
      JS_RETURN_TYPE(UINib);
      JS_RETURN_TYPE(UIDevice);
      JS_RETURN_TYPE(UIDictationPhrase);
      
      // Globals
      
      JS_RETURN_TYPE_FROM(UIKitGlobals, SUIKitGlobals, NSObject);
      JS_RETURN_TYPE_FROM(CoreGraphicsGlobals, SCoreGraphicsGlobals, NSObject);

      // Objects
      
      JS_RETURN_TYPE(NSUserActivityDelegate);
      JS_RETURN_TYPE(NSUserActivity);
      JS_RETURN_TYPE(NSUndoManager);
      JS_RETURN_TYPE(NSInvocationOperation); // : NSOperation
      JS_RETURN_TYPE(NSBlockOperation); // : NSOperation
      JS_RETURN_TYPE(NSOperationQueue);
      JS_RETURN_TYPE(NSOperation);
      JS_RETURN_TYPE(NSNotificationCenter);
      JS_RETURN_TYPE(NSNotification);
      JS_RETURN_TYPE(NSUUID);
      JS_RETURN_TYPE(NSCalendar);
      JS_RETURN_TYPE(NSDateComponents);
      JS_RETURN_TYPE(NSTimeZone);
      JS_RETURN_TYPE(NSMutableCharacterSet);
      JS_RETURN_TYPE(NSCharacterSet);
      JS_RETURN_TYPE(NSMutableAttributedString);
      JS_RETURN_TYPE(NSAttributedString);
      JS_RETURN_TYPE(NSMutableParagraphStyle);
      JS_RETURN_TYPE(NSParagraphStyle);
      JS_RETURN_TYPE(NSCache);
      JS_RETURN_TYPE(NSBundle);
      JS_RETURN_TYPE(NSOutputStream);
      JS_RETURN_TYPE(NSInputStream);
      JS_RETURN_TYPE(NSStream);
      JS_RETURN_TYPE(NSURLAuthenticationChallenge);
      JS_RETURN_TYPE(NSURLCredential);
      JS_RETURN_TYPE(NSURLProtectionSpace);
      JS_RETURN_TYPE(NSHTTPURLResponse);
      JS_RETURN_TYPE(NSURLResponse);
      JS_RETURN_TYPE(NSMutableURLRequest);
      JS_RETURN_TYPE(NSURLRequest);
      JS_RETURN_TYPE(NSURL);
      JS_RETURN_TYPE(NSCoder);
      JS_RETURN_TYPE(NSProgress);
      JS_RETURN_TYPE(NSItemProvider);
      JS_RETURN_TYPE(NSMutableIndexSet);
      JS_RETURN_TYPE(NSIndexSet);
      JS_RETURN_TYPE(NSUserDefaults);
      JS_RETURN_TYPE(NSInvocation);
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
      JS_RETURN_TYPE(NSMachPort);
#if TODO
      JS_RETURN_TYPE(NSSocketPort);
#endif
#endif
      JS_RETURN_TYPE(NSMessagePort);
      JS_RETURN_TYPE(NSPort);
      JS_RETURN_TYPE(NSTimer);
      JS_RETURN_TYPE(NSRunLoop);
#if TARGET_OS_UIKITFORMAC
      JS_RETURN_TYPE(NSOpenGLPixelBuffer);
      JS_RETURN_TYPE(NSOpenGLPixelFormat);
      JS_RETURN_TYPE(NSOpenGLContext);
#endif
      JS_RETURN_TYPE(NSTarget);
      JS_RETURN_TYPE(NSObjCRuntime);
      if (object_isClass(obj)) {
        return NClass::type;
      }

      // GLKit protocols

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
      JS_RETURN_PROTOCOL(GLKViewControllerDelegate);
      JS_RETURN_PROTOCOL(GLKViewDelegate);
#endif

      // Core Animation Protocols

#if !TARGET_OS_SIMULATOR
      JS_RETURN_PROTOCOL(CAMetalDrawable);
#endif
#if TARGET_OS_UIKITFORMAC
      // Work around uikitformac bug: https://twitter.com/theshawwn/status/1151309463565062145
      if ([NSStringFromClass([obj class]) isEqual: @"CaptureMTLDrawable"]) {
        return NCAMetalDrawable::type;
      }
#endif

      // ReplayKit protocols

      JS_RETURN_PROTOCOL(RPScreenRecorderDelegate);
      JS_RETURN_PROTOCOL(RPPreviewViewControllerDelegate);

      // Vision protocols

      JS_RETURN_PROTOCOL(VNRequestProgressProviding);
      JS_RETURN_PROTOCOL(VNFaceObservationAccepting);

      // AVFoundation Protocols

      JS_RETURN_PROTOCOL(AVAudioMixing); // <AVAudioStereoMixing, AVAudio3DMixing>
      JS_RETURN_PROTOCOL(AVAudio3DMixing); // <NSObject>
      JS_RETURN_PROTOCOL(AVAudioStereoMixing); // <NSObject>

      // MetalKit Protocols
      
      JS_RETURN_PROTOCOL(MTKViewDelegate);

      // Metal Protocols

      JS_RETURN_PROTOCOL(MTLComputeCommandEncoder); // <MTLCommandEncoder>
      JS_RETURN_PROTOCOL(MTLParallelRenderCommandEncoder); // <MTLCommandEncoder>
      JS_RETURN_PROTOCOL(MTLBlitCommandEncoder); // <MTLCommandEncoder>

      JS_RETURN_PROTOCOL(MTLDrawable); // <NSObject>
      JS_RETURN_PROTOCOL(MTLCommandBuffer); // <NSObject>

      JS_RETURN_PROTOCOL(MTLSharedEvent); // <MTLEvent>
      JS_RETURN_PROTOCOL(MTLEvent); // <NSObject>

      JS_RETURN_PROTOCOL(MTLRenderCommandEncoder); // <MTLCommandEncoder>

      JS_RETURN_PROTOCOL(MTLCommandEncoder); // <NSObject>

      JS_RETURN_PROTOCOL(MTLIndirectRenderCommand); // <NSObject>

      JS_RETURN_PROTOCOL(MTLIndirectCommandBuffer); // <MTLResource>

      JS_RETURN_PROTOCOL(MTLArgumentEncoder); // <NSObject>

      JS_RETURN_PROTOCOL(MTLFence); // <NSObject>

      JS_RETURN_PROTOCOL(MTLComputePipelineState); // <NSObject>

      JS_RETURN_PROTOCOL(MTLRenderPipelineState); // <NSObject>

      JS_RETURN_PROTOCOL(MTLLibrary); // <NSObject>
      JS_RETURN_PROTOCOL(MTLFunction); // <NSObject>

      JS_RETURN_PROTOCOL(MTLDepthStencilState); // <NSObject>

      JS_RETURN_PROTOCOL(MTLSamplerState); // <NSObject>

      JS_RETURN_PROTOCOL(MTLBuffer); // <MTLResource>
      JS_RETURN_PROTOCOL(MTLHeap); // <NSObject>
      JS_RETURN_PROTOCOL(MTLCommandQueue); // <NSObject>

      JS_RETURN_PROTOCOL(MTLDevice); // <NSObject>
      JS_RETURN_PROTOCOL(MTLTexture); // <MTLResource>
      JS_RETURN_PROTOCOL(MTLResource); // <MTLResource>
      
      // MapKit protocols
      
      JS_RETURN_PROTOCOL(MKMapViewDelegate);
      
#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
      // ARKit protocols
      
      JS_RETURN_PROTOCOL(ARSCNViewDelegate);
      JS_RETURN_PROTOCOL(ARSKViewDelegate);
      JS_RETURN_PROTOCOL(ARSessionProviding);
      JS_RETURN_PROTOCOL(ARSessionDelegate);
      JS_RETURN_PROTOCOL(ARSessionObserver);
#endif

      // SceneKit protocols

      JS_RETURN_PROTOCOL(SCNSceneRendererDelegate);
      JS_RETURN_PROTOCOL(SCNSceneRenderer);
      JS_RETURN_PROTOCOL(SCNNodeRendererDelegate);

      // Core Location protocols

      JS_RETURN_PROTOCOL(CLLocationManagerDelegate);

      // CoreAnimation protocols
      
      JS_RETURN_PROTOCOL(CALayerDelegate);
      JS_RETURN_PROTOCOL(CAAction);

      // AVFoundation protocols

      JS_RETURN_PROTOCOL(AVCaptureVideoDataOutputSampleBufferDelegate);

      // UIKit protocols

      JS_RETURN_PROTOCOL(UIViewImplicitlyAnimating);
      JS_RETURN_PROTOCOL(UIViewAnimating);
      JS_RETURN_PROTOCOL(UITimingCurveProvider);

      JS_RETURN_PROTOCOL(UIPopoverPresentationControllerDelegate);
      JS_RETURN_PROTOCOL(UIAdaptivePresentationControllerDelegate);
      JS_RETURN_PROTOCOL(UIViewControllerTransitionCoordinator); // NSObject<UIViewControllerTransitionCoordinatorContext>
      JS_RETURN_PROTOCOL(UIViewControllerTransitionCoordinatorContext); // NSObject

      JS_RETURN_PROTOCOL(UITableViewDragDelegate);
      JS_RETURN_PROTOCOL(UITableViewDropCoordinator);
      JS_RETURN_PROTOCOL(UITableViewDropDelegate);
      JS_RETURN_PROTOCOL(UITableViewDropItem);
      JS_RETURN_PROTOCOL(UITableViewDropPlaceholderContext); // <UIDragAnimating>
      JS_RETURN_PROTOCOL(UITableViewDataSourcePrefetching);
      JS_RETURN_PROTOCOL(UITableViewDataSource);
      JS_RETURN_PROTOCOL(UITableViewDelegate);
      JS_RETURN_PROTOCOL(UIScrollViewDelegate);
      JS_RETURN_PROTOCOL(UITabBarDelegate);
      JS_RETURN_PROTOCOL(UITabBarControllerDelegate);
      JS_RETURN_PROTOCOL(UINavigationControllerDelegate);
      JS_RETURN_PROTOCOL(UINavigationBarDelegate);
      JS_RETURN_PROTOCOL(UIBarPositioningDelegate);
      JS_RETURN_PROTOCOL(UIBarPositioning);
      JS_RETURN_PROTOCOL(UIFocusAnimationContext);
      JS_RETURN_PROTOCOL(UIDropInteractionDelegate);
      JS_RETURN_PROTOCOL(UIDragInteractionDelegate);
      JS_RETURN_PROTOCOL(UIDragAnimating);
      JS_RETURN_PROTOCOL(UIDragDropSession);
      JS_RETURN_PROTOCOL(UIDragSession);
      JS_RETURN_PROTOCOL(UIDropSession);

      // Foundation protocols

      JS_RETURN_PROTOCOL(NSItemProviderWriting);
      JS_RETURN_PROTOCOL(NSItemProviderReading);

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
      JS_RETURN_PROTOCOL(NSMachPortDelegate);
#endif
      JS_RETURN_PROTOCOL(NSPortDelegate);

      // Default types

      JS_RETURN_TYPE(NSObject);
      return Nid::type;
    }
  }
  return unset;
}
