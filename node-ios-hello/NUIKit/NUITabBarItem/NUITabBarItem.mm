//
//  NUITabBarItem.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITabBarItem.h"

#define instancetype UITabBarItem
#define js_value_instancetype js_value_UITabBarItem

NUITabBarItem::NUITabBarItem() {}
NUITabBarItem::~NUITabBarItem() {}

JS_INIT_CLASS(UITabBarItem, NSObject);
  JS_ASSIGN_PROTO_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(initWithTitleImageTag);
  JS_ASSIGN_PROTO_METHOD(initWithTitleImageSelectedImage);
  JS_ASSIGN_PROTO_METHOD(initWithTabBarSystemItemTag);
  JS_ASSIGN_PROTO_METHOD(setFinishedSelectedImageWithFinishedUnselectedImage);
  JS_ASSIGN_PROTO_METHOD(finishedSelectedImage);
  JS_ASSIGN_PROTO_METHOD(finishedUnselectedImage);
  JS_ASSIGN_PROTO_METHOD(setBadgeTextAttributesForState);
  JS_ASSIGN_PROTO_METHOD(badgeTextAttributesForState);
  JS_ASSIGN_PROTO_PROP(selectedImage);
  JS_ASSIGN_PROTO_PROP(badgeValue);
  JS_ASSIGN_PROTO_PROP(titlePositionAdjustment);
  JS_ASSIGN_PROTO_PROP(badgeColor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITabBarItem, NSObject);
  // constants (exports)

  //typedef NS_ENUM(NSInteger, UITabBarSystemItem) {
    JS_ASSIGN_ENUM(UITabBarSystemItemMore, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemFavorites, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemFeatured, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemTopRated, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemRecents, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemContacts, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemHistory, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemBookmarks, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemSearch, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemDownloads, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemMostRecent, NSInteger);
    JS_ASSIGN_ENUM(UITabBarSystemItemMostViewed, NSInteger);
  //};

JS_INIT_CLASS_END(UITabBarItem, NSObject);

#include "NUIImage.h"

NAN_METHOD(NUITabBarItem::New) {
  JS_RECONSTRUCT(UITabBarItem);
  @autoreleasepool {
    UITabBarItem* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UITabBarItem *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_NSString(info[0])) {
      declare_args();
      declare_pointer(NSString, title);
      declare_nullable_pointer(UIImage, image);
      declare_nullable_pointer(UIImage, selectedImage);
      self = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    } else if (info.Length() <= 0) {
      self = [[UITabBarItem alloc] init];
    }
    if (self) {
      NUITabBarItem *wrapper = new NUITabBarItem();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITabBarItem::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUITabBarItem::init) {
  JS_UNWRAP_OR_ALLOC(UITabBarItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([self init]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUITabBarItem::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UITabBarItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

#include "NUIImage.h"

NAN_METHOD(NUITabBarItem::initWithTitleImageTag) {
  JS_UNWRAP_OR_ALLOC(UITabBarItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, title);
    declare_nullable_pointer(UIImage, image);
    declare_value(NSInteger, tag);
    JS_SET_RETURN(js_value_instancetype([self initWithTitle: title image: image tag: tag]));
  }
}

NAN_METHOD(NUITabBarItem::initWithTitleImageSelectedImage) {
  JS_UNWRAP_OR_ALLOC(UITabBarItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, title);
    declare_nullable_pointer(UIImage, image);
    declare_nullable_pointer(UIImage, selectedImage);
    JS_SET_RETURN(js_value_instancetype([self initWithTitle: title image: image selectedImage: selectedImage]));
  }
}

NAN_METHOD(NUITabBarItem::initWithTabBarSystemItemTag) {
  JS_UNWRAP_OR_ALLOC(UITabBarItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UITabBarSystemItem, systemItem);
    declare_value(NSInteger, tag);
    JS_SET_RETURN(js_value_instancetype([self initWithTabBarSystemItem: systemItem tag: tag]));
  }
}

NAN_METHOD(NUITabBarItem::setFinishedSelectedImageWithFinishedUnselectedImage) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, selectedImage);
    declare_nullable_pointer(UIImage, unselectedImage);
    [self setFinishedSelectedImage: selectedImage withFinishedUnselectedImage: unselectedImage];
  }
}

NAN_METHOD(NUITabBarItem::finishedSelectedImage) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self finishedSelectedImage]));
  }
}

NAN_METHOD(NUITabBarItem::finishedUnselectedImage) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self finishedUnselectedImage]));
  }
}

#include "NUIControl.h"

NAN_METHOD(NUITabBarItem::setBadgeTextAttributesForState) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, textAttributes);
    declare_value(UIControlState, state);
    [self setBadgeTextAttributes: textAttributes forState: state];
  }
}

NAN_METHOD(NUITabBarItem::badgeTextAttributesForState) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey, id>*/([self badgeTextAttributesForState: state]));
  }
}

NAN_GETTER(NUITabBarItem::selectedImageGetter) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self selectedImage]));
  }
}

NAN_SETTER(NUITabBarItem::selectedImageSetter) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setSelectedImage: input];
  }
}

NAN_GETTER(NUITabBarItem::badgeValueGetter) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self badgeValue]));
  }
}

NAN_SETTER(NUITabBarItem::badgeValueSetter) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setBadgeValue: input];
  }
}

NAN_GETTER(NUITabBarItem::titlePositionAdjustmentGetter) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIOffset([self titlePositionAdjustment]));
  }
}

NAN_SETTER(NUITabBarItem::titlePositionAdjustmentSetter) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIOffset, input);
    [self setTitlePositionAdjustment: input];
  }
}

NAN_GETTER(NUITabBarItem::badgeColorGetter) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self badgeColor]));
  }
}

NAN_SETTER(NUITabBarItem::badgeColorSetter) {
  JS_UNWRAP(UITabBarItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setBadgeColor: input];
  }
}
