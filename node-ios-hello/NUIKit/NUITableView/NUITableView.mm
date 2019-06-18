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
  // constants (exports)
  
//typedef NS_ENUM(NSInteger, UITableViewStyle) {
  JS_ASSIGN_ENUM(UITableViewStylePlain, NSInteger);          // regular table view
  JS_ASSIGN_ENUM(UITableViewStyleGrouped, NSInteger);        // preferences style table view
//};

//typedef NS_ENUM(NSInteger, UITableViewScrollPosition) {
  JS_ASSIGN_ENUM(UITableViewScrollPositionNone, NSInteger);
  JS_ASSIGN_ENUM(UITableViewScrollPositionTop, NSInteger);    
  JS_ASSIGN_ENUM(UITableViewScrollPositionMiddle, NSInteger);   
  JS_ASSIGN_ENUM(UITableViewScrollPositionBottom, NSInteger);
//};                // scroll so row of interest is completely visible at top/center/bottom of view

//typedef NS_ENUM(NSInteger, UITableViewRowAnimation) {
  JS_ASSIGN_ENUM(UITableViewRowAnimationFade, NSInteger);
  JS_ASSIGN_ENUM(UITableViewRowAnimationRight, NSInteger);           // slide in from right (or out to right)
  JS_ASSIGN_ENUM(UITableViewRowAnimationLeft, NSInteger);
  JS_ASSIGN_ENUM(UITableViewRowAnimationTop, NSInteger);
  JS_ASSIGN_ENUM(UITableViewRowAnimationBottom, NSInteger);
  JS_ASSIGN_ENUM(UITableViewRowAnimationNone, NSInteger);            // available in iOS 3.0
  JS_ASSIGN_ENUM(UITableViewRowAnimationMiddle, NSInteger);          // available in iOS 3.2.  attempts to keep cell centered in the space it will/did occupy
  JS_ASSIGN_ENUM(UITableViewRowAnimationAutomatic, NSInteger); // = 100  // available in iOS 5.0.  chooses an appropriate animation style for you
//};

// Including this constant string in the array of strings returned by sectionIndexTitlesForTableView: will cause a magnifying glass icon to be displayed at that location in the index.
// This should generally only be used as the first title in the index.
//UIKIT_EXTERN NSString *const UITableViewIndexSearch NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED;
  JS_ASSIGN_ENUM(UITableViewIndexSearch, NSString);

// Returning this value from tableView:heightForHeaderInSection: or tableView:heightForFooterInSection: results in a height that fits the value returned from
// tableView:titleForHeaderInSection: or tableView:titleForFooterInSection: if the title is not nil.
//UIKIT_EXTERN const CGFloat UITableViewAutomaticDimension NS_AVAILABLE_IOS(5_0);
  JS_ASSIGN_ENUM(UITableViewAutomaticDimension, CGFloat);

//typedef NS_ENUM(NSInteger, UITableViewRowActionStyle) {
  JS_ASSIGN_ENUM(UITableViewRowActionStyleDefault, NSInteger); //  = 0,
  JS_ASSIGN_ENUM(UITableViewRowActionStyleDestructive, NSInteger); //  = UITableViewRowActionStyleDefault,
  JS_ASSIGN_ENUM(UITableViewRowActionStyleNormal, NSInteger);
//} NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;

//typedef NS_ENUM(NSInteger, UITableViewRowActionStyle) {
  JS_ASSIGN_ENUM(UITableViewRowActionStyleDefault, NSInteger); //  = 0,
  JS_ASSIGN_ENUM(UITableViewRowActionStyleDestructive, NSInteger); //  = UITableViewRowActionStyleDefault,
  JS_ASSIGN_ENUM(UITableViewRowActionStyleNormal, NSInteger);
//} NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;

//typedef NS_ENUM(NSInteger, UITableViewSeparatorInsetReference) {
  // The value set to the separatorInset property is interpreted as an offset from the edges of the cell.
  JS_ASSIGN_ENUM(UITableViewSeparatorInsetFromCellEdges, NSInteger);
  
  // The value set to the separatorInset property is interpreted as an offset from the automatic separator insets.
  JS_ASSIGN_ENUM(UITableViewSeparatorInsetFromAutomaticInsets, NSInteger);
//} API_AVAILABLE(ios(11.0), tvos(11.0));

//typedef NS_ENUM(NSInteger, UITableViewDropIntent) {
  // Table view will accept the drop, but the location is not yet known and will be determined later.
  // Will not open a gap. You may wish to provide some visual treatment to communicate this to the user.
  JS_ASSIGN_ENUM(UITableViewDropIntentUnspecified, NSInteger);
  
  // The drop will be placed in row(s) inserted at the destination index path.
  // Opens a gap at the specified location simulating the final dropped layout.
  JS_ASSIGN_ENUM(UITableViewDropIntentInsertAtDestinationIndexPath, NSInteger);
  
  // The drop will be placed inside the row at the destination index path (e.g. the row is a container of other items).
  // Will not open a gap. Table view will highlight the row at the destination index path.
  JS_ASSIGN_ENUM(UITableViewDropIntentInsertIntoDestinationIndexPath, NSInteger);
  
  // The table view will automatically choose between .insertAtDestinationIndexPath and
  // .insertIntoDestinationIndexPath depending on the position of the drop. This should be used instead
  // of .insertIntoDestinationIndexPath when the item being dropped can either be placed inside the row
  // at the destination index path or inserted in a new row at the index path of the container row.
  JS_ASSIGN_ENUM(UITableViewDropIntentAutomatic, NSInteger);
//} API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);

JS_INIT_CLASS_END(UITableView, UIScrollView);

NAN_METHOD(NUITableView::New) {
  JS_RECONSTRUCT(UITableView);

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
  JS_UNWRAP(UITableView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSIndexPath, indexPath);
    declare_value(UITableViewScrollPosition, scrollPosition);
    declare_value(BOOL, animated);
    [self scrollToRowAtIndexPath: indexPath atScrollPosition: scrollPosition animated: animated];
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
