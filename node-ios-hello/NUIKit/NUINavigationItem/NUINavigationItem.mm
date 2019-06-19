//
//  UINavigationItem.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUINavigationItem.h"

#define instancetype UINavigationItem
#define js_value_instancetype js_value_UINavigationItem

NUINavigationItem::NUINavigationItem() {}
NUINavigationItem::~NUINavigationItem() {}

JS_INIT_CLASS(UINavigationItem, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(initWithTitle);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(setHidesBackButtonAnimated);
  JS_ASSIGN_PROTO_METHOD(setLeftBarButtonItemsAnimated);
  JS_ASSIGN_PROTO_METHOD(setRightBarButtonItemsAnimated);
  JS_ASSIGN_PROTO_METHOD(setLeftBarButtonItemAnimated);
  JS_ASSIGN_PROTO_METHOD(setRightBarButtonItemAnimated);
  JS_ASSIGN_PROTO_PROP(title);
  JS_ASSIGN_PROTO_PROP(titleView);
  JS_ASSIGN_PROTO_PROP(prompt);
  JS_ASSIGN_PROTO_PROP(backBarButtonItem);
  JS_ASSIGN_PROTO_PROP(hidesBackButton);
  JS_ASSIGN_PROTO_PROP(leftBarButtonItems);
  JS_ASSIGN_PROTO_PROP(rightBarButtonItems);
  JS_ASSIGN_PROTO_PROP(leftItemsSupplementBackButton);
  JS_ASSIGN_PROTO_PROP(leftBarButtonItem);
  JS_ASSIGN_PROTO_PROP(rightBarButtonItem);
  JS_ASSIGN_PROTO_PROP(largeTitleDisplayMode);
  JS_ASSIGN_PROTO_PROP(searchController);
  JS_ASSIGN_PROTO_PROP(hidesSearchBarWhenScrolling);
  // static members (ctor)
  JS_INIT_CTOR(UINavigationItem, NSObject);
  // global members (exports)
/*
typedef NS_ENUM(NSInteger, UINavigationItemLargeTitleDisplayMode) {
    /// Automatically use the large out-of-line title based on the state of the previous item in the navigation bar. An item with largeTitleDisplayMode=Automatic will show or hide the large title based on the request of the previous navigation item. If the first item pushed is set to Automatic, then it will show the large title if the navigation bar has prefersLargeTitles=YES.
    UINavigationItemLargeTitleDisplayModeAutomatic,
    /// Always use a larger title when this item is top most.
    UINavigationItemLargeTitleDisplayModeAlways,
    /// Never use a larger title when this item is top most.
    UINavigationItemLargeTitleDisplayModeNever,
} NS_SWIFT_NAME(UINavigationItem.LargeTitleDisplayMode);
*/
  JS_ASSIGN_ENUM(UINavigationItemLargeTitleDisplayModeAutomatic, NSInteger);
  JS_ASSIGN_ENUM(UINavigationItemLargeTitleDisplayModeAlways, NSInteger);
  JS_ASSIGN_ENUM(UINavigationItemLargeTitleDisplayModeNever, NSInteger);
  
JS_INIT_CLASS_END(UINavigationItem, NSObject);

NAN_METHOD(NUINavigationItem::New) {
  JS_RECONSTRUCT(UINavigationItem);

  Local<Object> obj = info.This();

  NUINavigationItem *ui = new NUINavigationItem();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UINavigationItem *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UINavigationItem alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUINavigationItem::initWithTitle) {
  JS_UNWRAP_OR_ALLOC(UINavigationItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, title);
    JS_SET_RETURN(js_value_instancetype([self initWithTitle: title]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUINavigationItem::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UINavigationItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, coder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: coder]));
  }
}

NAN_METHOD(NUINavigationItem::setHidesBackButtonAnimated) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, hidesBackButton);
    declare_value(BOOL, animated);
    [self setHidesBackButton: hidesBackButton animated: animated];
  }
}

NAN_METHOD(NUINavigationItem::setLeftBarButtonItemsAnimated) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSArray<UIBarButtonItem*>, items);
    declare_value(BOOL, animated);
    [self setLeftBarButtonItems: items animated: animated];
  }
}

NAN_METHOD(NUINavigationItem::setRightBarButtonItemsAnimated) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSArray<UIBarButtonItem*>, items);
    declare_value(BOOL, animated);
    [self setRightBarButtonItems: items animated: animated];
  }
}

#include "NUIBarButtonItem.h"

NAN_METHOD(NUINavigationItem::setLeftBarButtonItemAnimated) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIBarButtonItem, item);
    declare_value(BOOL, animated);
    [self setLeftBarButtonItem: item animated: animated];
  }
}

NAN_METHOD(NUINavigationItem::setRightBarButtonItemAnimated) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIBarButtonItem, item);
    declare_value(BOOL, animated);
    [self setRightBarButtonItem: item animated: animated];
  }
}

NAN_GETTER(NUINavigationItem::titleGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString ([self title]));
  }
}

NAN_SETTER(NUINavigationItem::titleSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString , input);
    [self setTitle: input];
  }
}

#include "NUIView.h"

NAN_GETTER(NUINavigationItem::titleViewGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView ([self titleView]));
  }
}

NAN_SETTER(NUINavigationItem::titleViewSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView , input);
    [self setTitleView: input];
  }
}

NAN_GETTER(NUINavigationItem::promptGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self prompt]));
  }
}

NAN_SETTER(NUINavigationItem::promptSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPrompt: input];
  }
}

NAN_GETTER(NUINavigationItem::backBarButtonItemGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarButtonItem([self backBarButtonItem]));
  }
}

NAN_SETTER(NUINavigationItem::backBarButtonItemSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIBarButtonItem, input);
    [self setBackBarButtonItem: input];
  }
}

NAN_GETTER(NUINavigationItem::hidesBackButtonGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBackButton]));
  }
}

NAN_SETTER(NUINavigationItem::hidesBackButtonSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBackButton: input];
  }
}

NAN_GETTER(NUINavigationItem::leftBarButtonItemsGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIBarButtonItem*>([self leftBarButtonItems]));
  }
}

NAN_SETTER(NUINavigationItem::leftBarButtonItemsSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIBarButtonItem*>, input);
    [self setLeftBarButtonItems: input];
  }
}

NAN_GETTER(NUINavigationItem::rightBarButtonItemsGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIBarButtonItem*>([self rightBarButtonItems]));
  }
}

NAN_SETTER(NUINavigationItem::rightBarButtonItemsSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIBarButtonItem*>, input);
    [self setRightBarButtonItems: input];
  }
}

NAN_GETTER(NUINavigationItem::leftItemsSupplementBackButtonGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self leftItemsSupplementBackButton]));
  }
}

NAN_SETTER(NUINavigationItem::leftItemsSupplementBackButtonSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLeftItemsSupplementBackButton: input];
  }
}

NAN_GETTER(NUINavigationItem::leftBarButtonItemGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarButtonItem([self leftBarButtonItem]));
  }
}

NAN_SETTER(NUINavigationItem::leftBarButtonItemSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIBarButtonItem, input);
    [self setLeftBarButtonItem: input];
  }
}

NAN_GETTER(NUINavigationItem::rightBarButtonItemGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarButtonItem([self rightBarButtonItem]));
  }
}

NAN_SETTER(NUINavigationItem::rightBarButtonItemSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIBarButtonItem, input);
    [self setRightBarButtonItem: input];
  }
}

NAN_GETTER(NUINavigationItem::largeTitleDisplayModeGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationItemLargeTitleDisplayMode([self largeTitleDisplayMode]));
  }
}

NAN_SETTER(NUINavigationItem::largeTitleDisplayModeSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UINavigationItemLargeTitleDisplayMode, input);
    [self setLargeTitleDisplayMode: input];
  }
}

#include "NUISearchController.h"

NAN_GETTER(NUINavigationItem::searchControllerGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISearchController([self searchController]));
  }
}

NAN_SETTER(NUINavigationItem::searchControllerSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UISearchController, input);
    [self setSearchController: input];
  }
}

NAN_GETTER(NUINavigationItem::hidesSearchBarWhenScrollingGetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesSearchBarWhenScrolling]));
  }
}

NAN_SETTER(NUINavigationItem::hidesSearchBarWhenScrollingSetter) {
  JS_UNWRAP(UINavigationItem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesSearchBarWhenScrolling: input];
  }
}
