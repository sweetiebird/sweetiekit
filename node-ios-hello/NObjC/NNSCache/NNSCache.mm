//
//  NNSCache.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSCache.h"

#define instancetype NSCache
#define js_value_instancetype js_value_NSCache


#define js_value_KeyType js_value_id
#define to_value_KeyType to_value_id
#define is_value_KeyType is_value_id

#define js_value_ObjectType js_value_id
#define to_value_ObjectType to_value_id
#define is_value_ObjectType is_value_id

#define KeyType id
#define ObjectType id

NNSCache::NNSCache() {}
NNSCache::~NNSCache() {}

JS_INIT_CLASS(NSCache, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(objectForKey);
  JS_ASSIGN_PROTO_METHOD(setObjectForKey);
  JS_ASSIGN_PROTO_METHOD(setObjectForKeyCost);
  JS_ASSIGN_PROTO_METHOD(removeObjectForKey);
  JS_ASSIGN_PROTO_METHOD(removeAllObjects);
#if TODO
// NSCacheDelegate
  JS_ASSIGN_PROTO_METHOD(cacheWillEvictObject);
#endif
// NSCache
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(totalCostLimit);
  JS_ASSIGN_PROTO_PROP(countLimit);
  JS_ASSIGN_PROTO_PROP(evictsObjectsWithDiscardedContent);
  // static members (ctor)
  JS_INIT_CTOR(NSCache, NSObject);
JS_INIT_CLASS_END(NSCache, NSObject);

NAN_METHOD(NNSCache::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'NSCache(...)', turn into construct call.
      JS_SET_RETURN_NEW(NSCache, info);
      return;
    }

    NSCache* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge NSCache *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSCache alloc] init];
    }
    if (self) {
      NNSCache *wrapper = new NNSCache();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSCache::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSCache::objectForKey) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(KeyType, key);
    JS_SET_RETURN(js_value_ObjectType([self objectForKey: key]));
  }
}

NAN_METHOD(NNSCache::setObjectForKey) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(ObjectType, obj);
    declare_value(KeyType, key);
    [self setObject: obj forKey: key];
  }
}

NAN_METHOD(NNSCache::setObjectForKeyCost) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(ObjectType, obj);
    declare_value(KeyType, key);
    declare_value(NSUInteger, g);
    [self setObject: obj forKey: key cost: g];
  }
}

NAN_METHOD(NNSCache::removeObjectForKey) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(KeyType, key);
    [self removeObjectForKey: key];
  }
}

NAN_METHOD(NNSCache::removeAllObjects) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    [self removeAllObjects];
  }
}

#if TODO
NAN_METHOD(NNSCacheDelegate::cacheWillEvictObject) {
  JS_UNWRAP(NSCacheDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCache, cache);
    declare_value(id, obj);
    [self cache: cache willEvictObject: obj];
  }
}
#endif

NAN_GETTER(NNSCache::nameGetter) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NNSCache::nameSetter) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

NAN_GETTER(NNSCache::delegateGetter) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <NSCacheDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NNSCache::delegateSetter) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <NSCacheDelegate>*/, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NNSCache::totalCostLimitGetter) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self totalCostLimit]));
  }
}

NAN_SETTER(NNSCache::totalCostLimitSetter) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setTotalCostLimit: input];
  }
}

NAN_GETTER(NNSCache::countLimitGetter) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self countLimit]));
  }
}

NAN_SETTER(NNSCache::countLimitSetter) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setCountLimit: input];
  }
}
NAN_GETTER(NNSCache::evictsObjectsWithDiscardedContentGetter) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self evictsObjectsWithDiscardedContent]));
  }
}

NAN_SETTER(NNSCache::evictsObjectsWithDiscardedContentSetter) {
  JS_UNWRAP(NSCache, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEvictsObjectsWithDiscardedContent: input];
  }
}


