//
//  NUICollectionView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUICollectionView.h"
#include "NUIScrollView.h"
#include "NUITableViewDataSource.h"
#include "NUINib.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUICollectionView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUICollectionView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIScrollView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UICollectionView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "visibleCells", VisibleCells);
  JS_SET_PROP_READONLY(proto, "indexPathsForSelectedItems", IndexPathsForSelectedItems);
  JS_SET_PROP(proto, "backgroundView", BackgroundView);
  Nan::SetMethod(proto, "registerNibForCellWithReuseIdentifier", RegisterNibForCellWithReuseIdentifier);
  Nan::SetMethod(proto, "scrollToItemAtIndexPath", ScrollToItemAtIndexPath);
  Nan::SetMethod(proto, "reloadData", ReloadData);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUICollectionView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUICollectionView *view = new NUICollectionView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UICollectionView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      dispatch_sync(dispatch_get_main_queue(), ^ {
          view->SetNSObject([[UICollectionView alloc] initWithFrame:frame]);
      });
    }
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        view->SetNSObject([[UICollectionView alloc] init]);
      });
    }
  }
  view->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NUICollectionView::NUICollectionView () {}
NUICollectionView::~NUICollectionView () {}

NAN_METHOD(NUICollectionView::RegisterNibForCellWithReuseIdentifier) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionView, ui);

  NUINib *nibObj = ObjectWrap::Unwrap<NUINib>(Local<Object>::Cast(info[0]));
  
  std::string identifier;
  if (info[1]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[1]));
    identifier = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }

  @autoreleasepool {
    NSString *reuseIdentifier = [NSString stringWithUTF8String:identifier.c_str()];
    [ui registerNib:nibObj->As<UINib>() forCellWithReuseIdentifier:reuseIdentifier];
  }
}

NAN_METHOD(NUICollectionView::ScrollToItemAtIndexPath) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionView, ui);

  int section = TO_UINT32(JS_OBJ(info[0])->Get(JS_STR("section")));
  int row = TO_UINT32(JS_OBJ(info[0])->Get(JS_STR("row")));

  std::string position;
  if (info[1]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[1]));
    position = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  NSString *str = [NSString stringWithUTF8String:position.c_str()];
  UICollectionViewScrollPosition pos = UICollectionViewScrollPositionCenteredVertically;

  if ([str isEqualToString:@"CenteredHorizontally"]) {
    pos = UICollectionViewScrollPositionCenteredHorizontally;
  } else if ([str isEqualToString:@"Top"]) {
    pos = UICollectionViewScrollPositionTop;
  } else if ([str isEqualToString:@"Bottom"]) {
    pos = UICollectionViewScrollPositionBottom;
  } else if ([str isEqualToString:@"Left"]) {
    pos = UICollectionViewScrollPositionLeft;
  } else if ([str isEqualToString:@"Right"]) {
    pos = UICollectionViewScrollPositionRight;
  } else if ([str isEqualToString:@"None"]) {
    pos = UICollectionViewScrollPositionNone;
  }

  bool animated = TO_BOOL(info[2]);

  @autoreleasepool {
    NSUInteger indexes[2];
    indexes[0] = section;
    indexes[1] = row;
    NSIndexPath* path = [[NSIndexPath alloc] initWithIndexes:indexes length:2];
    [ui scrollToItemAtIndexPath:path atScrollPosition:pos animated:animated];
  }
}

NAN_METHOD(NUICollectionView::ReloadData) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionView, ui);

  [ui reloadData];
}

NAN_GETTER(NUICollectionView::VisibleCellsGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionView, ui);
  
  __block NSArray* cells = nullptr;
  __block NSInteger count = 0;

  @autoreleasepool {
    cells = [ui visibleCells];
    count = [cells count];
  }
  
  auto result = Nan::New<Array>();

  for (NSInteger i = 0; i < count; i++) {
    UIView* cell = [cells objectAtIndex:i];
    if (cell != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)cell)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(cell, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      Nan::Set(result, static_cast<uint32_t>(i), value);
    }
  }

  JS_SET_RETURN(result);
}

NAN_GETTER(NUICollectionView::IndexPathsForSelectedItemsGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionView, ui);
  
  __block NSArray* paths = nullptr;
  __block NSInteger count = 0;

  @autoreleasepool {
    paths = [ui indexPathsForSelectedItems];
    count = [paths count];
  }
  
  auto result = Nan::New<Array>();

  for (NSInteger i = 0; i < count; i++) {
    NSIndexPath *path = [paths objectAtIndex:i];
    Local<Object> resultVal = Object::New(Isolate::GetCurrent());
    resultVal->Set(JS_STR("section"), JS_NUM([path section]));
    resultVal->Set(JS_STR("row"), JS_NUM([path row]));
    Nan::Set(result, static_cast<uint32_t>(i), resultVal);
  }

  JS_SET_RETURN(result);
}

NAN_GETTER(NUICollectionView::BackgroundViewGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionView, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui backgroundView], NUIView::type)));
}

NAN_SETTER(NUICollectionView::BackgroundViewSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionView, ui);

  NUIView *bgViewObj = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(value));

  @autoreleasepool {
    [ui setBackgroundView:bgViewObj->As<UIView>()];
  }
}

