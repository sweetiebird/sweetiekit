//
//  NUICollectionViewLayoutAttributes.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewLayoutAttributes.h"

#define instancetype UICollectionViewLayoutAttributes
#define js_value_instancetype js_value_UICollectionViewLayoutAttributes

NUICollectionViewLayoutAttributes::NUICollectionViewLayoutAttributes() {}
NUICollectionViewLayoutAttributes::~NUICollectionViewLayoutAttributes() {}

JS_INIT_CLASS(UICollectionViewLayoutAttributes, NSObject);
  JS_ASSIGN_STATIC_METHOD(layoutAttributesForCellWithIndexPath);
  JS_ASSIGN_STATIC_METHOD(layoutAttributesForSupplementaryViewOfKindWithIndexPath);
  JS_ASSIGN_STATIC_METHOD(layoutAttributesForDecorationViewOfKindWithIndexPath);
  JS_ASSIGN_PROTO_PROP(frame);
  JS_ASSIGN_PROTO_PROP(center);
  JS_ASSIGN_PROTO_PROP(size);
  JS_ASSIGN_PROTO_PROP(transform3D);
  JS_ASSIGN_PROTO_PROP(bounds);
  JS_ASSIGN_PROTO_PROP(transform);
  JS_ASSIGN_PROTO_PROP(alpha);
  JS_ASSIGN_PROTO_PROP(zIndex);
  JS_ASSIGN_PROTO_PROP(isHidden);
  JS_ASSIGN_PROTO_PROP(indexPath);
  JS_ASSIGN_PROTO_PROP_READONLY(representedElementCategory);
  JS_ASSIGN_PROTO_PROP_READONLY(representedElementKind);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewLayoutAttributes, NSObject);
  // constant values (exports)
  
  //typedef NS_ENUM(NSUInteger, UICollectionElementCategory) {
    JS_ASSIGN_ENUM(UICollectionElementCategoryCell, NSUInteger);
    JS_ASSIGN_ENUM(UICollectionElementCategorySupplementaryView, NSUInteger);
    JS_ASSIGN_ENUM(UICollectionElementCategoryDecorationView, NSUInteger);
  //};

JS_INIT_CLASS_END(UICollectionViewLayoutAttributes, NSObject);

NAN_METHOD(NUICollectionViewLayoutAttributes::New) {
  JS_RECONSTRUCT(UICollectionViewLayoutAttributes);
  @autoreleasepool {
    UICollectionViewLayoutAttributes* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UICollectionViewLayoutAttributes *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UICollectionViewLayoutAttributes alloc] init];
    }
    if (self) {
      NUICollectionViewLayoutAttributes *wrapper = new NUICollectionViewLayoutAttributes();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UICollectionViewLayoutAttributes::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUICollectionViewLayoutAttributes::layoutAttributesForCellWithIndexPath) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_instancetype([UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayoutAttributes::layoutAttributesForSupplementaryViewOfKindWithIndexPath) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, elementKind);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_instancetype([UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind: elementKind withIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewLayoutAttributes::layoutAttributesForDecorationViewOfKindWithIndexPath) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, decorationViewKind);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_instancetype([UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind: decorationViewKind withIndexPath: indexPath]));
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::frameGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self frame]));
  }
}

NAN_SETTER(NUICollectionViewLayoutAttributes::frameSetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setFrame: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::centerGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self center]));
  }
}

NAN_SETTER(NUICollectionViewLayoutAttributes::centerSetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setCenter: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::sizeGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self size]));
  }
}

NAN_SETTER(NUICollectionViewLayoutAttributes::sizeSetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setSize: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::transform3DGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CATransform3D([self transform3D]));
  }
}

NAN_SETTER(NUICollectionViewLayoutAttributes::transform3DSetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CATransform3D, input);
    [self setTransform3D: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::boundsGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self bounds]));
  }
}

NAN_SETTER(NUICollectionViewLayoutAttributes::boundsSetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setBounds: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::transformGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGAffineTransform([self transform]));
  }
}

NAN_SETTER(NUICollectionViewLayoutAttributes::transformSetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGAffineTransform, input);
    [self setTransform: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::alphaGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self alpha]));
  }
}

NAN_SETTER(NUICollectionViewLayoutAttributes::alphaSetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setAlpha: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::zIndexGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self zIndex]));
  }
}

NAN_SETTER(NUICollectionViewLayoutAttributes::zIndexSetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setZIndex: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::isHiddenGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isHidden]));
  }
}

NAN_SETTER(NUICollectionViewLayoutAttributes::isHiddenSetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidden: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::indexPathGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSIndexPath([self indexPath]));
  }
}

NAN_SETTER(NUICollectionViewLayoutAttributes::indexPathSetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSIndexPath, input);
    [self setIndexPath: input];
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::representedElementCategoryGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionElementCategory([self representedElementCategory]));
  }
}

NAN_GETTER(NUICollectionViewLayoutAttributes::representedElementKindGetter) {
  JS_UNWRAP(UICollectionViewLayoutAttributes, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self representedElementKind]));
  }
}
