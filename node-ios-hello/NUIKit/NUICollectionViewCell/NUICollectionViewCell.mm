//
//  NUICollectionViewCell.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewCell.h"

NUICollectionViewCell::NUICollectionViewCell() {}
NUICollectionViewCell::~NUICollectionViewCell() {}

JS_INIT_CLASS(UICollectionViewCell, UICollectionReusableView);
  // instance members (proto)
  JS_SET_PROP_READONLY(proto, "contentView", ContentView);
  JS_SET_PROP(proto, "backgroundView", BackgroundView);
  JS_SET_PROP(proto, "selectedBackgroundView", SelectedBackgroundView);
  JS_SET_PROP(proto, "isSelected", IsSelected);
  JS_SET_PROP(proto, "isHighlighted", IsHighlighted);
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewCell, UICollectionReusableView);
JS_INIT_CLASS_END(UICollectionViewCell, UICollectionReusableView);

NAN_METHOD(NUICollectionViewCell::New) {
  JS_RECONSTRUCT(UICollectionViewCell);

  Local<Object> obj = info.This();

  NUICollectionViewCell *view = new NUICollectionViewCell();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UICollectionViewCell *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      UICollectionViewCell* cell = [[UICollectionViewCell alloc] initWithFrame:frame];
      [cell setValue:@"sweetiekit.UICollectionViewCell" forKey:@"reuseIdentifier"];
      Ivar ivar = class_getInstanceVariable([UICollectionViewCell self], "_reusableViewFlags");
      ptrdiff_t offset = ivar_getOffset(ivar);
      unsigned char* bytes = (unsigned char *)(__bridge void*)cell;
      NSInteger flags = *((NSInteger *)(bytes+offset));
      flags |= 0x1;
      ((void (*)(id, Ivar, NSInteger))object_setIvar)(cell, ivar, flags);
      view->SetNSObject(cell);
    }
  } else {
    @autoreleasepool {
      UICollectionViewCell* cell = [[UICollectionViewCell alloc] init];
      [cell setValue:@"sweetiekit.UICollectionViewCell" forKey:@"reuseIdentifier"];
      Ivar ivar = class_getInstanceVariable([UICollectionViewCell self], "_reusableViewFlags");
      ptrdiff_t offset = ivar_getOffset(ivar);
      unsigned char* bytes = (unsigned char *)(__bridge void*)cell;
      NSInteger flags = *((NSInteger *)(bytes+offset));
      flags |= 0x1;
      ((void (*)(id, Ivar, NSInteger))object_setIvar)(cell, ivar, flags);
      view->SetNSObject(cell);
    }
  }
  view->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NUICollectionViewCell::ContentViewGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionViewCell, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui contentView], NUIView::type));
}

NAN_GETTER(NUICollectionViewCell::BackgroundViewGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionViewCell, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui backgroundView], NUIView::type));
}

NAN_SETTER(NUICollectionViewCell::BackgroundViewSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionViewCell, ui);

  NUIView *bgViewObj = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(value));

  @autoreleasepool {
    [ui setBackgroundView:bgViewObj->As<UIView>()];
  }
}

NAN_GETTER(NUICollectionViewCell::SelectedBackgroundViewGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionViewCell, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui selectedBackgroundView], NUIView::type));
}

NAN_SETTER(NUICollectionViewCell::SelectedBackgroundViewSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionViewCell, ui);

  NUIView *bgViewObj = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(value));

  @autoreleasepool {
    [ui setSelectedBackgroundView:bgViewObj->As<UIView>()];
  }
}

NAN_GETTER(NUICollectionViewCell::IsSelectedGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionViewCell, ui);
  
  JS_SET_RETURN(JS_BOOL([ui isSelected]));
}

NAN_SETTER(NUICollectionViewCell::IsSelectedSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionViewCell, ui);

  [ui setSelected:TO_BOOL(value)];
}

NAN_GETTER(NUICollectionViewCell::IsHighlightedGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionViewCell, ui);
  
  JS_SET_RETURN(JS_BOOL([ui isHighlighted]));
}

NAN_SETTER(NUICollectionViewCell::IsHighlightedSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionViewCell, ui);

  [ui setHighlighted:TO_BOOL(value)];
}
