//
//  UITabBar.mm
//
//  Created by Emily Kolar on 2019-5-20.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITabBar.h"

NUITabBar::NUITabBar() {}
NUITabBar::~NUITabBar() {}

JS_INIT_CLASS(UITabBar, UIView);
  JS_ASSIGN_PROTO_METHOD(setItemsAnimated);
  JS_ASSIGN_PROTO_METHOD(beginCustomizingItems);
  JS_ASSIGN_PROTO_METHOD(endCustomizingAnimated);
  JS_ASSIGN_PROTO_METHOD(isCustomizing);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(items);
  JS_ASSIGN_PROTO_PROP(selectedItem);
  JS_ASSIGN_PROTO_PROP_READONLY(isCustomizing);
  JS_ASSIGN_PROTO_PROP(tintColor);
  JS_ASSIGN_PROTO_PROP(barTintColor);
  JS_ASSIGN_PROTO_PROP(unselectedItemTintColor);
  JS_ASSIGN_PROTO_PROP(selectedImageTintColor);
  JS_ASSIGN_PROTO_PROP(backgroundImage);
  JS_ASSIGN_PROTO_PROP(selectionIndicatorImage);
  JS_ASSIGN_PROTO_PROP(shadowImage);
  JS_ASSIGN_PROTO_PROP(itemPositioning);
  JS_ASSIGN_PROTO_PROP(itemWidth);
  JS_ASSIGN_PROTO_PROP(itemSpacing);
  JS_ASSIGN_PROTO_PROP(barStyle);
  JS_ASSIGN_PROTO_PROP(isTranslucent);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITabBar, UIView);
  // constants (exports)

  //typedef NS_ENUM(NSInteger, UITabBarItemPositioning) {
    JS_ASSIGN_ENUM(UITabBarItemPositioningAutomatic, NSInteger);
    JS_ASSIGN_ENUM(UITabBarItemPositioningFill, NSInteger);
    JS_ASSIGN_ENUM(UITabBarItemPositioningCentered, NSInteger);
  //} NS_ENUM_AVAILABLE_IOS(7_0);

JS_INIT_CLASS_END(UITabBar, UIView);

NAN_METHOD(NUITabBar::New) {
  JS_RECONSTRUCT(UITabBar);
  @autoreleasepool {
    UITabBar* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UITabBar *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITabBar alloc] init];
    }
    if (self) {
      NUITabBar *wrapper = new NUITabBar();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITabBar::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUITabBar::setItemsAnimated) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSArray<UITabBarItem*>, items);
    declare_value(BOOL, animated);
    [self setItems: items animated: animated];
  }
}

NAN_METHOD(NUITabBar::beginCustomizingItems) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<UITabBarItem*>, items);
    [self beginCustomizingItems: items];
  }
}

NAN_METHOD(NUITabBar::endCustomizingAnimated) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, animated);
    JS_SET_RETURN(js_value_BOOL([self endCustomizingAnimated: animated]));
  }
}

NAN_METHOD(NUITabBar::isCustomizing) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCustomizing]));
  }
}

#include "NUITabBarDelegate.h"

NAN_GETTER(NUITabBar::delegateGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITabBarDelegate([self delegate]));
  }
}

NAN_SETTER(NUITabBar::delegateSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(UITabBarDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NUITabBar::delegate"];
  }
}

NAN_GETTER(NUITabBar::itemsGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UITabBarItem*>([self items]));
  }
}

NAN_SETTER(NUITabBar::itemsSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UITabBarItem*>, input);
    [self setItems: input];
  }
}

#include "NUITabBarItem.h"

NAN_GETTER(NUITabBar::selectedItemGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITabBarItem([self selectedItem]));
  }
}

NAN_SETTER(NUITabBar::selectedItemSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UITabBarItem, input);
    [self setSelectedItem: input];
  }
}

NAN_GETTER(NUITabBar::isCustomizingGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCustomizing]));
  }
}

NAN_GETTER(NUITabBar::tintColorGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self tintColor]));
  }
}

NAN_SETTER(NUITabBar::tintColorSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setTintColor: input];
  }
}

NAN_GETTER(NUITabBar::barTintColorGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self barTintColor]));
  }
}

NAN_SETTER(NUITabBar::barTintColorSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setBarTintColor: input];
  }
}

NAN_GETTER(NUITabBar::unselectedItemTintColorGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self unselectedItemTintColor]));
  }
}

NAN_SETTER(NUITabBar::unselectedItemTintColorSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setUnselectedItemTintColor: input];
  }
}

NAN_GETTER(NUITabBar::selectedImageTintColorGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self selectedImageTintColor]));
  }
}

NAN_SETTER(NUITabBar::selectedImageTintColorSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setSelectedImageTintColor: input];
  }
}

#include "NUIImage.h"

NAN_GETTER(NUITabBar::backgroundImageGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self backgroundImage]));
  }
}

NAN_SETTER(NUITabBar::backgroundImageSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setBackgroundImage: input];
  }
}

NAN_GETTER(NUITabBar::selectionIndicatorImageGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self selectionIndicatorImage]));
  }
}

NAN_SETTER(NUITabBar::selectionIndicatorImageSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setSelectionIndicatorImage: input];
  }
}

NAN_GETTER(NUITabBar::shadowImageGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self shadowImage]));
  }
}

NAN_SETTER(NUITabBar::shadowImageSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setShadowImage: input];
  }
}

NAN_GETTER(NUITabBar::itemPositioningGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITabBarItemPositioning([self itemPositioning]));
  }
}

NAN_SETTER(NUITabBar::itemPositioningSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITabBarItemPositioning, input);
    [self setItemPositioning: input];
  }
}

NAN_GETTER(NUITabBar::itemWidthGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self itemWidth]));
  }
}

NAN_SETTER(NUITabBar::itemWidthSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setItemWidth: input];
  }
}

NAN_GETTER(NUITabBar::itemSpacingGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self itemSpacing]));
  }
}

NAN_SETTER(NUITabBar::itemSpacingSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setItemSpacing: input];
  }
}

NAN_GETTER(NUITabBar::barStyleGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarStyle([self barStyle]));
  }
}

NAN_SETTER(NUITabBar::barStyleSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIBarStyle, input);
    [self setBarStyle: input];
  }
}

NAN_GETTER(NUITabBar::isTranslucentGetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isTranslucent]));
  }
}

NAN_SETTER(NUITabBar::isTranslucentSetter) {
  JS_UNWRAP(UITabBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setTranslucent: input];
  }
}
