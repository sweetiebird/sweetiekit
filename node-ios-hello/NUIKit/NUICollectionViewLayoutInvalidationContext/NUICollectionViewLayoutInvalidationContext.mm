//
//  NUICollectionViewLayoutInvalidationContext.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewLayoutInvalidationContext.h"

#define instancetype UICollectionViewLayoutInvalidationContext
#define js_value_instancetype js_value_UICollectionViewLayoutInvalidationContext

NUICollectionViewLayoutInvalidationContext::NUICollectionViewLayoutInvalidationContext() {}
NUICollectionViewLayoutInvalidationContext::~NUICollectionViewLayoutInvalidationContext() {}

JS_INIT_CLASS(UICollectionViewLayoutInvalidationContext, NSObject);
  JS_ASSIGN_PROTO_METHOD(invalidateItemsAtIndexPaths);
  JS_ASSIGN_PROTO_METHOD(invalidateSupplementaryElementsOfKindAtIndexPaths);
  JS_ASSIGN_PROTO_METHOD(invalidateDecorationElementsOfKindAtIndexPaths);
  JS_ASSIGN_PROTO_PROP_READONLY(invalidateEverything);
  JS_ASSIGN_PROTO_PROP_READONLY(invalidateDataSourceCounts);
  JS_ASSIGN_PROTO_PROP_READONLY(invalidatedItemIndexPaths);
  JS_ASSIGN_PROTO_PROP_READONLY(invalidatedSupplementaryIndexPaths);
  JS_ASSIGN_PROTO_PROP_READONLY(invalidatedDecorationIndexPaths);
  JS_ASSIGN_PROTO_PROP(contentOffsetAdjustment);
  JS_ASSIGN_PROTO_PROP(contentSizeAdjustment);
  JS_ASSIGN_PROTO_PROP_READONLY(previousIndexPathsForInteractivelyMovingItems);
  JS_ASSIGN_PROTO_PROP_READONLY(targetIndexPathsForInteractivelyMovingItems);
  JS_ASSIGN_PROTO_PROP_READONLY(interactiveMovementTarget);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewLayoutInvalidationContext, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UICollectionViewLayoutInvalidationContext, NSObject);

NAN_METHOD(NUICollectionViewLayoutInvalidationContext::New) {
  JS_RECONSTRUCT(UICollectionViewLayoutInvalidationContext);
  @autoreleasepool {
    UICollectionViewLayoutInvalidationContext* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UICollectionViewLayoutInvalidationContext *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UICollectionViewLayoutInvalidationContext alloc] init];
    }
    if (self) {
      NUICollectionViewLayoutInvalidationContext *wrapper = new NUICollectionViewLayoutInvalidationContext();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UICollectionViewLayoutInvalidationContext::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUICollectionViewLayoutInvalidationContext::invalidateItemsAtIndexPaths) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    [self invalidateItemsAtIndexPaths: indexPaths];
  }
}

NAN_METHOD(NUICollectionViewLayoutInvalidationContext::invalidateSupplementaryElementsOfKindAtIndexPaths) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    [self invalidateSupplementaryElementsOfKind: elementKind atIndexPaths: indexPaths];
  }
}

NAN_METHOD(NUICollectionViewLayoutInvalidationContext::invalidateDecorationElementsOfKindAtIndexPaths) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSArray<NSIndexPath*>, indexPaths);
    [self invalidateDecorationElementsOfKind: elementKind atIndexPaths: indexPaths];
  }
}

NAN_GETTER(NUICollectionViewLayoutInvalidationContext::invalidateEverythingGetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self invalidateEverything]));
  }
}

NAN_GETTER(NUICollectionViewLayoutInvalidationContext::invalidateDataSourceCountsGetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self invalidateDataSourceCounts]));
  }
}

NAN_GETTER(NUICollectionViewLayoutInvalidationContext::invalidatedItemIndexPathsGetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self invalidatedItemIndexPaths]));
  }
}

NAN_GETTER(NUICollectionViewLayoutInvalidationContext::invalidatedSupplementaryIndexPathsGetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, NSArray<NSIndexPath*>*>*/([self invalidatedSupplementaryIndexPaths]));
  }
}

NAN_GETTER(NUICollectionViewLayoutInvalidationContext::invalidatedDecorationIndexPathsGetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, NSArray<NSIndexPath*>*>*/([self invalidatedDecorationIndexPaths]));
  }
}

NAN_GETTER(NUICollectionViewLayoutInvalidationContext::contentOffsetAdjustmentGetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self contentOffsetAdjustment]));
  }
}

NAN_SETTER(NUICollectionViewLayoutInvalidationContext::contentOffsetAdjustmentSetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setContentOffsetAdjustment: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutInvalidationContext::contentSizeAdjustmentGetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self contentSizeAdjustment]));
  }
}

NAN_SETTER(NUICollectionViewLayoutInvalidationContext::contentSizeAdjustmentSetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setContentSizeAdjustment: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutInvalidationContext::previousIndexPathsForInteractivelyMovingItemsGetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self previousIndexPathsForInteractivelyMovingItems]));
  }
}

NAN_GETTER(NUICollectionViewLayoutInvalidationContext::targetIndexPathsForInteractivelyMovingItemsGetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSIndexPath*>([self targetIndexPathsForInteractivelyMovingItems]));
  }
}

NAN_GETTER(NUICollectionViewLayoutInvalidationContext::interactiveMovementTargetGetter) {
  JS_UNWRAP(UICollectionViewLayoutInvalidationContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self interactiveMovementTarget]));
  }
}
