//
//  UINavigationBar.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUINavigationBar.h"

NUINavigationBar::NUINavigationBar() {}
NUINavigationBar::~NUINavigationBar() {}

JS_INIT_CLASS(UINavigationBar, UIView);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(pushNavigationItemAnimated);
  JS_ASSIGN_PROTO_METHOD(popNavigationItemAnimated);
  JS_ASSIGN_PROTO_METHOD(setItemsAnimated);
  JS_ASSIGN_PROTO_METHOD(setBackgroundImageForBarPositionBarMetrics);
  JS_ASSIGN_PROTO_METHOD(backgroundImageForBarPositionBarMetrics);
  JS_ASSIGN_PROTO_METHOD(setBackgroundImageForBarMetrics);
  JS_ASSIGN_PROTO_METHOD(backgroundImageForBarMetrics);
  JS_ASSIGN_PROTO_METHOD(setTitleVerticalPositionAdjustmentForBarMetrics);
  JS_ASSIGN_PROTO_METHOD(titleVerticalPositionAdjustmentForBarMetrics);
#if TODO
// UINavigationBarDelegate
  JS_ASSIGN_PROTO_METHOD(navigationBarShouldPushItem);
  JS_ASSIGN_PROTO_METHOD(navigationBarDidPushItem);
  JS_ASSIGN_PROTO_METHOD(navigationBarShouldPopItem);
  JS_ASSIGN_PROTO_METHOD(navigationBarDidPopItem);
#endif
// UINavigationBar
  JS_ASSIGN_PROTO_PROP(barStyle);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(isTranslucent);
  JS_ASSIGN_PROTO_PROP_READONLY(topItem);
  JS_ASSIGN_PROTO_PROP_READONLY(backItem);
  JS_ASSIGN_PROTO_PROP(items);
  JS_ASSIGN_PROTO_PROP(prefersLargeTitles);
  JS_ASSIGN_PROTO_PROP(tintColor);
  JS_ASSIGN_PROTO_PROP(barTintColor);
  JS_ASSIGN_PROTO_PROP(shadowImage);
  JS_ASSIGN_PROTO_PROP(titleTextAttributes);
  JS_ASSIGN_PROTO_PROP(largeTitleTextAttributes);
  JS_ASSIGN_PROTO_PROP(backIndicatorImage);
  JS_ASSIGN_PROTO_PROP(backIndicatorTransitionMaskImage);
  // static members (ctor)
  JS_INIT_CTOR(UINavigationBar, UIView);
JS_INIT_CLASS_END(UINavigationBar, UIView);

NAN_METHOD(NUINavigationBar::New) {
  JS_RECONSTRUCT(UINavigationBar);

  Local<Object> obj = info.This();

  NUINavigationBar *ui = new NUINavigationBar();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UINavigationBar *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UINavigationBar alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

#include "NUINavigationItem.h"

NAN_METHOD(NUINavigationBar::pushNavigationItemAnimated) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UINavigationItem, item);
    declare_value(BOOL, animated);
    [self pushNavigationItem: item animated: animated];
  }
}

NAN_METHOD(NUINavigationBar::popNavigationItemAnimated) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, animated);
    JS_SET_RETURN(js_value_UINavigationItem([self popNavigationItemAnimated: animated]));
  }
}

NAN_METHOD(NUINavigationBar::setItemsAnimated) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSArray<UINavigationItem*>, items);
    declare_value(BOOL, animated);
    [self setItems: items animated: animated];
  }
}

#include "NUIImage.h"
#include "NUIBarCommon.h"

NAN_METHOD(NUINavigationBar::setBackgroundImageForBarPositionBarMetrics) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, backgroundImage);
    declare_value(UIBarPosition, barPosition);
    declare_value(UIBarMetrics, barMetrics);
    [self setBackgroundImage: backgroundImage forBarPosition: barPosition barMetrics: barMetrics];
  }
}

NAN_METHOD(NUINavigationBar::backgroundImageForBarPositionBarMetrics) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIBarPosition, barPosition);
    declare_value(UIBarMetrics, barMetrics);
    JS_SET_RETURN(js_value_UIImage([self backgroundImageForBarPosition: barPosition barMetrics: barMetrics]));
  }
}

NAN_METHOD(NUINavigationBar::setBackgroundImageForBarMetrics) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, backgroundImage);
    declare_value(UIBarMetrics, barMetrics);
    [self setBackgroundImage: backgroundImage forBarMetrics: barMetrics];
  }
}

NAN_METHOD(NUINavigationBar::backgroundImageForBarMetrics) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIBarMetrics, barMetrics);
    JS_SET_RETURN(js_value_UIImage([self backgroundImageForBarMetrics: barMetrics]));
  }
}

NAN_METHOD(NUINavigationBar::setTitleVerticalPositionAdjustmentForBarMetrics) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, adjustment);
    declare_value(UIBarMetrics, barMetrics);
    [self setTitleVerticalPositionAdjustment: adjustment forBarMetrics: barMetrics];
  }
}

NAN_METHOD(NUINavigationBar::titleVerticalPositionAdjustmentForBarMetrics) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIBarMetrics, barMetrics);
    JS_SET_RETURN(js_value_CGFloat([self titleVerticalPositionAdjustmentForBarMetrics: barMetrics]));
  }
}

#if TODO
NAN_METHOD(NUINavigationBarDelegate::navigationBarShouldPushItem) {
  JS_UNWRAP(UINavigationBarDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UINavigationBar, navigationBar);
    declare_pointer(UINavigationItem, item);
    JS_SET_RETURN(js_value_BOOL([self navigationBar: navigationBar shouldPushItem: item]));
  }
}

NAN_METHOD(NUINavigationBarDelegate::navigationBarDidPushItem) {
  JS_UNWRAP(UINavigationBarDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UINavigationBar, navigationBar);
    declare_pointer(UINavigationItem, item);
    [self navigationBar: navigationBar didPushItem: item];
  }
}

NAN_METHOD(NUINavigationBarDelegate::navigationBarShouldPopItem) {
  JS_UNWRAP(UINavigationBarDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UINavigationBar, navigationBar);
    declare_pointer(UINavigationItem, item);
    JS_SET_RETURN(js_value_BOOL([self navigationBar: navigationBar shouldPopItem: item]));
  }
}

NAN_METHOD(NUINavigationBarDelegate::navigationBarDidPopItem) {
  JS_UNWRAP(UINavigationBarDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UINavigationBar, navigationBar);
    declare_pointer(UINavigationItem, item);
    [self navigationBar: navigationBar didPopItem: item];
  }
}
#endif

NAN_GETTER(NUINavigationBar::barStyleGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarStyle([self barStyle]));
  }
}

NAN_SETTER(NUINavigationBar::barStyleSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIBarStyle, input);
    [self setBarStyle: input];
  }
}

NAN_GETTER(NUINavigationBar::delegateGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UINavigationBarDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUINavigationBar::delegateSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UINavigationBarDelegate>*/, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NUINavigationBar::isTranslucentGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isTranslucent]));
  }
}

NAN_SETTER(NUINavigationBar::isTranslucentSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setTranslucent: input];
  }
}

NAN_GETTER(NUINavigationBar::topItemGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationItem([self topItem]));
  }
}

NAN_GETTER(NUINavigationBar::backItemGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationItem([self backItem]));
  }
}

NAN_GETTER(NUINavigationBar::itemsGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UINavigationItem*>([self items]));
  }
}

NAN_SETTER(NUINavigationBar::itemsSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UINavigationItem*>, input);
    [self setItems: input];
  }
}

NAN_GETTER(NUINavigationBar::prefersLargeTitlesGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self prefersLargeTitles]));
  }
}

NAN_SETTER(NUINavigationBar::prefersLargeTitlesSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPrefersLargeTitles: input];
  }
}

NAN_GETTER(NUINavigationBar::tintColorGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self tintColor]));
  }
}

NAN_SETTER(NUINavigationBar::tintColorSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setTintColor: input];
  }
}

NAN_GETTER(NUINavigationBar::barTintColorGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self barTintColor]));
  }
}

NAN_SETTER(NUINavigationBar::barTintColorSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setBarTintColor: input];
  }
}

NAN_GETTER(NUINavigationBar::shadowImageGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self shadowImage]));
  }
}

NAN_SETTER(NUINavigationBar::shadowImageSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setShadowImage: input];
  }
}

NAN_GETTER(NUINavigationBar::titleTextAttributesGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey, id>*/([self titleTextAttributes]));
  }
}

NAN_SETTER(NUINavigationBar::titleTextAttributesSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, input);
    [self setTitleTextAttributes: input];
  }
}

NAN_GETTER(NUINavigationBar::largeTitleTextAttributesGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey, id>*/([self largeTitleTextAttributes]));
  }
}

NAN_SETTER(NUINavigationBar::largeTitleTextAttributesSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, input);
    [self setLargeTitleTextAttributes: input];
  }
}

NAN_GETTER(NUINavigationBar::backIndicatorImageGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self backIndicatorImage]));
  }
}

NAN_SETTER(NUINavigationBar::backIndicatorImageSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setBackIndicatorImage: input];
  }
}

NAN_GETTER(NUINavigationBar::backIndicatorTransitionMaskImageGetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self backIndicatorTransitionMaskImage]));
  }
}

NAN_SETTER(NUINavigationBar::backIndicatorTransitionMaskImageSetter) {
  JS_UNWRAP(UINavigationBar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setBackIndicatorTransitionMaskImage: input];
  }
}

