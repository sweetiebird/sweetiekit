//
//  NUICollectionViewFlowLayout.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewFlowLayout.h"

#define instancetype UICollectionViewFlowLayout
#define js_value_instancetype js_value_UICollectionViewFlowLayout

NUICollectionViewFlowLayout::NUICollectionViewFlowLayout() {}
NUICollectionViewFlowLayout::~NUICollectionViewFlowLayout() {}

JS_INIT_CLASS(UICollectionViewFlowLayout, UICollectionViewLayout);
#if TODO
// UICollectionViewDelegateFlowLayout
  JS_ASSIGN_PROTO_METHOD(collectionViewLayoutSizeForItemAtIndexPath);
  JS_ASSIGN_PROTO_METHOD(collectionViewLayoutInsetForSectionAtIndex);
  JS_ASSIGN_PROTO_METHOD(collectionViewLayoutMinimumLineSpacingForSectionAtIndex);
  JS_ASSIGN_PROTO_METHOD(collectionViewLayoutMinimumInteritemSpacingForSectionAtIndex);
  JS_ASSIGN_PROTO_METHOD(collectionViewLayoutReferenceSizeForHeaderInSection);
  JS_ASSIGN_PROTO_METHOD(collectionViewLayoutReferenceSizeForFooterInSection);
#endif
// UICollectionViewFlowLayout
  JS_ASSIGN_PROTO_PROP(minimumLineSpacing);
  JS_ASSIGN_PROTO_PROP(minimumInteritemSpacing);
  JS_ASSIGN_PROTO_PROP(itemSize);
  JS_ASSIGN_PROTO_PROP(estimatedItemSize);
  JS_ASSIGN_PROTO_PROP(scrollDirection);
  JS_ASSIGN_PROTO_PROP(headerReferenceSize);
  JS_ASSIGN_PROTO_PROP(footerReferenceSize);
  JS_ASSIGN_PROTO_PROP(sectionInset);
  JS_ASSIGN_PROTO_PROP(sectionInsetReference);
  JS_ASSIGN_PROTO_PROP(sectionHeadersPinToVisibleBounds);
  JS_ASSIGN_PROTO_PROP(sectionFootersPinToVisibleBounds);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewFlowLayout, UICollectionViewLayout);
  // constant values (exports)

  JS_ASSIGN_ENUM(UICollectionElementKindSectionHeader, NSString); //  NS_AVAILABLE_IOS(6_0);
  JS_ASSIGN_ENUM(UICollectionElementKindSectionFooter, NSString); //  NS_AVAILABLE_IOS(6_0);
  JS_ASSIGN_ENUM(UICollectionViewFlowLayoutAutomaticSize, CGSize); //  NS_AVAILABLE_IOS(10_0);

  //typedef NS_ENUM(NSInteger, UICollectionViewScrollDirection) {
    JS_ASSIGN_ENUM(UICollectionViewScrollDirectionVertical, NSInteger);
    JS_ASSIGN_ENUM(UICollectionViewScrollDirectionHorizontal, NSInteger);
  //};

  //typedef NS_ENUM(NSInteger, UICollectionViewFlowLayoutSectionInsetReference) {
    JS_ASSIGN_ENUM(UICollectionViewFlowLayoutSectionInsetFromContentInset, NSInteger);
    JS_ASSIGN_ENUM(UICollectionViewFlowLayoutSectionInsetFromSafeArea, NSInteger);
    JS_ASSIGN_ENUM(UICollectionViewFlowLayoutSectionInsetFromLayoutMargins, NSInteger);
  //} API_AVAILABLE(ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);

JS_INIT_CLASS_END(UICollectionViewFlowLayout, UICollectionViewLayout);

NAN_METHOD(NUICollectionViewFlowLayout::New) {
  JS_RECONSTRUCT(UICollectionViewFlowLayout);
  @autoreleasepool {
    UICollectionViewFlowLayout* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UICollectionViewFlowLayout *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UICollectionViewFlowLayout alloc] init];
    }
    if (self) {
      NUICollectionViewFlowLayout *wrapper = new NUICollectionViewFlowLayout();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UICollectionViewFlowLayout::New: invalid arguments");
    }
  }
}

#if TODO
NAN_METHOD(NUICollectionViewDelegateFlowLayout::collectionViewLayoutSizeForItemAtIndexPath) {
  JS_UNWRAP(UICollectionViewDelegateFlowLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewLayout, collectionViewLayout);
    declare_pointer(NSIndexPath, indexPath);
    JS_SET_RETURN(js_value_CGSize([self collectionView: collectionView layout: collectionViewLayout sizeForItemAtIndexPath: indexPath]));
  }
}

NAN_METHOD(NUICollectionViewDelegateFlowLayout::collectionViewLayoutInsetForSectionAtIndex) {
  JS_UNWRAP(UICollectionViewDelegateFlowLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewLayout, collectionViewLayout);
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_UIEdgeInsets([self collectionView: collectionView layout: collectionViewLayout insetForSectionAtIndex: section]));
  }
}

NAN_METHOD(NUICollectionViewDelegateFlowLayout::collectionViewLayoutMinimumLineSpacingForSectionAtIndex) {
  JS_UNWRAP(UICollectionViewDelegateFlowLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewLayout, collectionViewLayout);
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_CGFloat([self collectionView: collectionView layout: collectionViewLayout minimumLineSpacingForSectionAtIndex: section]));
  }
}

NAN_METHOD(NUICollectionViewDelegateFlowLayout::collectionViewLayoutMinimumInteritemSpacingForSectionAtIndex) {
  JS_UNWRAP(UICollectionViewDelegateFlowLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewLayout, collectionViewLayout);
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_CGFloat([self collectionView: collectionView layout: collectionViewLayout minimumInteritemSpacingForSectionAtIndex: section]));
  }
}

NAN_METHOD(NUICollectionViewDelegateFlowLayout::collectionViewLayoutReferenceSizeForHeaderInSection) {
  JS_UNWRAP(UICollectionViewDelegateFlowLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewLayout, collectionViewLayout);
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_CGSize([self collectionView: collectionView layout: collectionViewLayout referenceSizeForHeaderInSection: section]));
  }
}

NAN_METHOD(NUICollectionViewDelegateFlowLayout::collectionViewLayoutReferenceSizeForFooterInSection) {
  JS_UNWRAP(UICollectionViewDelegateFlowLayout, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionView, collectionView);
    declare_pointer(UICollectionViewLayout, collectionViewLayout);
    declare_value(NSInteger, section);
    JS_SET_RETURN(js_value_CGSize([self collectionView: collectionView layout: collectionViewLayout referenceSizeForFooterInSection: section]));
  }
}
#endif

NAN_GETTER(NUICollectionViewFlowLayout::minimumLineSpacingGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minimumLineSpacing]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::minimumLineSpacingSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMinimumLineSpacing: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayout::minimumInteritemSpacingGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minimumInteritemSpacing]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::minimumInteritemSpacingSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMinimumInteritemSpacing: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayout::itemSizeGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self itemSize]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::itemSizeSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setItemSize: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayout::estimatedItemSizeGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self estimatedItemSize]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::estimatedItemSizeSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setEstimatedItemSize: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayout::scrollDirectionGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionViewScrollDirection([self scrollDirection]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::scrollDirectionSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UICollectionViewScrollDirection, input);
    [self setScrollDirection: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayout::headerReferenceSizeGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self headerReferenceSize]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::headerReferenceSizeSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setHeaderReferenceSize: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayout::footerReferenceSizeGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self footerReferenceSize]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::footerReferenceSizeSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setFooterReferenceSize: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayout::sectionInsetGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self sectionInset]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::sectionInsetSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIEdgeInsets, input);
    [self setSectionInset: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayout::sectionInsetReferenceGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionViewFlowLayoutSectionInsetReference([self sectionInsetReference]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::sectionInsetReferenceSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UICollectionViewFlowLayoutSectionInsetReference, input);
    [self setSectionInsetReference: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayout::sectionHeadersPinToVisibleBoundsGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self sectionHeadersPinToVisibleBounds]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::sectionHeadersPinToVisibleBoundsSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSectionHeadersPinToVisibleBounds: input];
  }
}

NAN_GETTER(NUICollectionViewFlowLayout::sectionFootersPinToVisibleBoundsGetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self sectionFootersPinToVisibleBounds]));
  }
}

NAN_SETTER(NUICollectionViewFlowLayout::sectionFootersPinToVisibleBoundsSetter) {
  JS_UNWRAP(UICollectionViewFlowLayout, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSectionFootersPinToVisibleBounds: input];
  }
}
