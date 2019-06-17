//
//  UIPageControl.mm
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPageControl.h"

NUIPageControl::NUIPageControl() {}
NUIPageControl::~NUIPageControl() {}

JS_INIT_CLASS(UIPageControl, UIControl);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(updateCurrentPageDisplay);
  JS_ASSIGN_PROTO_METHOD(sizeForNumberOfPages);
  JS_ASSIGN_PROTO_PROP(numberOfPages);
  JS_ASSIGN_PROTO_PROP(currentPage);
  JS_ASSIGN_PROTO_PROP(hidesForSinglePage);
  JS_ASSIGN_PROTO_PROP(defersCurrentPageDisplay);
  JS_ASSIGN_PROTO_PROP(pageIndicatorTintColor);
  JS_ASSIGN_PROTO_PROP(currentPageIndicatorTintColor);
  // static members (ctor)
  JS_INIT_CTOR(UIPageControl, UIControl);
JS_INIT_CLASS_END(UIPageControl, UIControl);

NAN_METHOD(NUIPageControl::New) {
  JS_RECONSTRUCT(UIPageControl);
  @autoreleasepool {
    UIPageControl* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIPageControl *)(info[0].As<External>()->Value());
    } else if (info.Length() > 0 && is_value_CGRect(info[0])) {
      self = [[UIPageControl alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIPageControl alloc] init];
    }
    if (self) {
      NUIPageControl *wrapper = new NUIPageControl();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPageControl::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIPageControl::updateCurrentPageDisplay) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    [self updateCurrentPageDisplay];
  }
}

NAN_METHOD(NUIPageControl::sizeForNumberOfPages) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, pageCount);
    JS_SET_RETURN(js_value_CGSize([self sizeForNumberOfPages: pageCount]));
  }
}

NAN_GETTER(NUIPageControl::numberOfPagesGetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self numberOfPages]));
  }
}

NAN_SETTER(NUIPageControl::numberOfPagesSetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setNumberOfPages: input];
  }
}

NAN_GETTER(NUIPageControl::currentPageGetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self currentPage]));
  }
}

NAN_SETTER(NUIPageControl::currentPageSetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setCurrentPage: input];
  }
}

NAN_GETTER(NUIPageControl::hidesForSinglePageGetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesForSinglePage]));
  }
}

NAN_SETTER(NUIPageControl::hidesForSinglePageSetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesForSinglePage: input];
  }
}

NAN_GETTER(NUIPageControl::defersCurrentPageDisplayGetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self defersCurrentPageDisplay]));
  }
}

NAN_SETTER(NUIPageControl::defersCurrentPageDisplaySetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDefersCurrentPageDisplay: input];
  }
}

NAN_GETTER(NUIPageControl::pageIndicatorTintColorGetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self pageIndicatorTintColor]));
  }
}

NAN_SETTER(NUIPageControl::pageIndicatorTintColorSetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setPageIndicatorTintColor: input];
  }
}

NAN_GETTER(NUIPageControl::currentPageIndicatorTintColorGetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self currentPageIndicatorTintColor]));
  }
}

NAN_SETTER(NUIPageControl::currentPageIndicatorTintColorSetter) {
  JS_UNWRAP(UIPageControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setCurrentPageIndicatorTintColor: input];
  }
}
