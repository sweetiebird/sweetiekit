//
//  NUITableView.mm
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableView.h"

NUITableView::NUITableView() {}
NUITableView::~NUITableView() {}

JS_INIT_CLASS(UITableView, UIScrollView);
  // instance members (proto)
  JS_SET_PROP(proto, "dataSource", DataSource);
  JS_SET_PROP(proto, "rowHeight", RowHeight);
  JS_SET_PROP(proto, "estimatedRowHeight", EstimatedRowHeight);
  JS_SET_PROP(proto, "refreshControl", RefreshControl);
  JS_ASSIGN_PROP(proto, separatorStyle);
  JS_SET_METHOD(proto, "reloadData", ReloadData);
  JS_SET_METHOD(proto, "cellForRowAt", CellForRowAt);
  JS_SET_METHOD(proto, "scrollToRowAt", ScrollToRowAt);
  // static members (ctor)
  JS_INIT_CTOR(UITableView, UIScrollView);
JS_INIT_CLASS_END(UITableView, UIScrollView);

NAN_METHOD(NUITableView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUITableView *tbl = new NUITableView();

  if (info[0]->IsExternal()) {
    tbl->SetNSObject((__bridge UITableView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      dispatch_sync(dispatch_get_main_queue(), ^ {
          tbl->SetNSObject([[UITableView alloc] initWithFrame:frame]);
      });
    }
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        tbl->SetNSObject([[UITableView alloc] init]);
      });
    }
  }
  tbl->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NUITableView::DequeueReusableCell) {
  JS_UNWRAP(UITableView, tv);

  std::string identifier;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    identifier = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument: identifier");
  }

  __block UITableViewCell* cell;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      NSString* str = [NSString stringWithUTF8String:identifier.c_str()];
      cell = [tv dequeueReusableCellWithIdentifier:str];
    });
  }
  
  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)cell)
  };

  Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(cell, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  JS_SET_RETURN(value);
}

NAN_METHOD(NUITableView::DequeueReusableCellWithIdentifierForIndexPath) {
  JS_UNWRAP(UITableView, tv);

  std::string identifier;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    identifier = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument: identifier");
  }
  
  int section = TO_UINT32(JS_OBJ(info[1])->Get(JS_STR("section")));
  int row = TO_UINT32(JS_OBJ(info[1])->Get(JS_STR("row")));

  __block UITableViewCell* cell;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      NSString* str = [NSString stringWithUTF8String:identifier.c_str()];
      NSUInteger indexes[2];
      indexes[0] = section;
      indexes[1] = row;
      NSIndexPath* path = [[NSIndexPath alloc] initWithIndexes:indexes length:2];
      cell = [tv dequeueReusableCellWithIdentifier:str forIndexPath: path];
    });
  }
  
  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)cell)
  };

  Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(cell, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  JS_SET_RETURN(value);
}

#include "NUITableViewDataSource.h"

NAN_GETTER(NUITableView::DataSourceGetter) {
  Nan::HandleScope scope;

  NUITableView *view = ObjectWrap::Unwrap<NUITableView>(info.This());

  Nan::ThrowError("Not implemented");
  //info.GetReturnValue().Set(JS_STR([[view->As<UITextField>() text] UTF8String]));
}

NAN_SETTER(NUITableView::DataSourceSetter) {
  Nan::HandleScope scope;

  NUITableView *tv = ObjectWrap::Unwrap<NUITableView>(info.This());
  NUITableViewDataSource *ds = ObjectWrap::Unwrap<NUITableViewDataSource>(Local<Object>::Cast(value));
  auto dataSource = ds->As<SUITableViewDataSource>();
  tv->_dataSource.Reset(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      auto ui = tv->As<UITableView>();
      [ui associateValue:dataSource withKey:@"sweetiekit.datasource"];
      [ui setDataSource:dataSource];
      [ui setDelegate:dataSource];
    });
  }
}

NAN_GETTER(NUITableView::RowHeightGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UITableView, tv);
  
  __block CGFloat result = 0;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      result = [tv rowHeight];
    });
  }
  JS_SET_RETURN(JS_FLOAT(result));
}

NAN_SETTER(NUITableView::RowHeightSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UITableView, tv);
  
  CGFloat height = TO_FLOAT(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [tv setRowHeight:height];
    });
  }
}

NAN_GETTER(NUITableView::EstimatedRowHeightGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UITableView, tv);
  
  __block CGFloat result = 0;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      result = [tv estimatedRowHeight];
    });
  }
  JS_SET_RETURN(JS_FLOAT(result));
}

NAN_SETTER(NUITableView::EstimatedRowHeightSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UITableView, tv);
  
  CGFloat height = TO_FLOAT(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [tv setEstimatedRowHeight:height];
      [tv setRowHeight:UITableViewAutomaticDimension];
    });
  }
}

#include "NUIRefreshControl.h"
NAN_GETTER(NUITableView::RefreshControlGetter) {
  Nan::HandleScope scope;

  NUITableView *view = ObjectWrap::Unwrap<NUITableView>(info.This());
  
  Nan::ThrowError("Not implemented");

  //info.GetReturnValue().Set(JS_STR([[view->As<UITextField>() text] UTF8String]));
}

NAN_SETTER(NUITableView::RefreshControlSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableView, ui);
  JS_UNWRAPPED(JS_OBJ(value), UIRefreshControl, refresh);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui setRefreshControl:refresh];
    });
  }
}

NAN_METHOD(NUITableView::ReloadData) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableView, ui);
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui reloadData];
    });
  }
}

NAN_METHOD(NUITableView::CellForRowAt) {
  JS_UNWRAP(UITableView, tv);
  
  int section = TO_UINT32(JS_OBJ(info[0])->Get(JS_STR("section")));
  int row = TO_UINT32(JS_OBJ(info[0])->Get(JS_STR("row")));

  __block UITableViewCell* cell;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      NSUInteger indexes[2];
      indexes[0] = section;
      indexes[1] = row;
      NSIndexPath* path = [[NSIndexPath alloc] initWithIndexes:indexes length:2];
      cell = [tv cellForRowAtIndexPath:path];
    });
  }
  
  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)cell)
  };

  Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(cell, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  JS_SET_RETURN(value);
}

NAN_METHOD(NUITableView::ScrollToRowAt) {
  JS_UNWRAP(UITableView, tv);
  
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
  UITableViewScrollPosition pos = UITableViewScrollPositionTop;

  if ([str isEqualToString:@"Bottom"]) {
    pos = UITableViewScrollPositionBottom;
  } else if ([str isEqualToString:@"Middle"]) {
    pos = UITableViewScrollPositionMiddle;
  } else if ([str isEqualToString:@"None"]) {
    pos = UITableViewScrollPositionNone;
  }

  bool animated = TO_BOOL(info[2]);

  @autoreleasepool {
    NSUInteger indexes[2];
    indexes[0] = section;
    indexes[1] = row;
    NSIndexPath* path = [[NSIndexPath alloc] initWithIndexes:indexes length:2];
    [tv scrollToRowAtIndexPath:path atScrollPosition:pos animated:animated];
  }
}

NAN_GETTER(NUITableView::separatorStyleGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableView, ui);
  
  UITableViewCellSeparatorStyle style = [ui separatorStyle];
  int styleInt = 0;

  if (style == UITableViewCellSeparatorStyleSingleLine) {
    styleInt = 1;
  }

  JS_SET_RETURN(JS_NUM(styleInt));
}

NAN_SETTER(NUITableView::separatorStyleSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableView, ui);
  
  double styleVal = TO_DOUBLE(value);
  UITableViewCellSeparatorStyle style = UITableViewCellSeparatorStyle(styleVal);

  @autoreleasepool {
    [ui setSeparatorStyle:style];
  }
}
