//
//  NUITableViewController.mm
//
//  Created by Emily Kolar on 4/20/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewController.h"

#define instancetype UITableViewController
#define js_value_instancetype js_value_UITableViewController

NUITableViewController::NUITableViewController() {}
NUITableViewController::~NUITableViewController() {}

JS_INIT_CLASS(UITableViewController, UIViewController);
  JS_ASSIGN_PROTO_METHOD(initWithStyle);
  JS_ASSIGN_PROTO_METHOD(initWithNibNameBundle);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_PROP(tableView);
  JS_ASSIGN_PROTO_PROP(clearsSelectionOnViewWillAppear);
  JS_ASSIGN_PROTO_PROP(refreshControl);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewController, UIViewController);
JS_INIT_CLASS_END(UITableViewController, UIViewController);

NAN_METHOD(NUITableViewController::New) {
  JS_RECONSTRUCT(UITableViewController);
  @autoreleasepool {
    UITableViewController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITableViewController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITableViewController alloc] init];
    }
    if (self) {
      NUITableViewController *wrapper = new NUITableViewController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewController::New: invalid arguments");
    }
  }
}

#include "NUITableView.h"

NAN_METHOD(NUITableViewController::initWithStyle) {
  JS_UNWRAP_OR_ALLOC(UITableViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UITableViewStyle, style);
    JS_SET_RETURN(js_value_instancetype([self initWithStyle: style]));
  }
}

#include "NNSBundle.h"

NAN_METHOD(NUITableViewController::initWithNibNameBundle) {
  JS_UNWRAP_OR_ALLOC(UITableViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, nibNameOrNil);
    declare_nullable_pointer(NSBundle, nibBundleOrNil);
    JS_SET_RETURN(js_value_instancetype([self initWithNibName: nibNameOrNil bundle: nibBundleOrNil]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUITableViewController::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UITableViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_GETTER(NUITableViewController::tableViewGetter) {
  JS_UNWRAP(UITableViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableView([self tableView]));
  }
}

#include "NUITableView.h"

NAN_SETTER(NUITableViewController::tableViewSetter) {
  JS_UNWRAP(UITableViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UITableView, input);
    [self setTableView: input];
  }
}

NAN_GETTER(NUITableViewController::clearsSelectionOnViewWillAppearGetter) {
  JS_UNWRAP(UITableViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self clearsSelectionOnViewWillAppear]));
  }
}

NAN_SETTER(NUITableViewController::clearsSelectionOnViewWillAppearSetter) {
  JS_UNWRAP(UITableViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setClearsSelectionOnViewWillAppear: input];
  }
}

#include "NUIRefreshControl.h"

NAN_GETTER(NUITableViewController::refreshControlGetter) {
  JS_UNWRAP(UITableViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIRefreshControl([self refreshControl]));
  }
}

NAN_SETTER(NUITableViewController::refreshControlSetter) {
  JS_UNWRAP(UITableViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIRefreshControl, input);
    [self setRefreshControl: input];
  }
}

