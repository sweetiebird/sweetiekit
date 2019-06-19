//
//  NUICollectionViewController.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewController.h"

#define instancetype UICollectionViewController
#define js_value_instancetype js_value_UICollectionViewController

NUICollectionViewController::NUICollectionViewController() {}
NUICollectionViewController::~NUICollectionViewController() {}

JS_INIT_CLASS(UICollectionViewController, UIViewController);
  JS_ASSIGN_PROTO_METHOD(initWithCollectionViewLayout);
  JS_ASSIGN_PROTO_METHOD(initWithNibNameBundle);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_PROP(collectionView);
  JS_ASSIGN_PROTO_PROP(clearsSelectionOnViewWillAppear);
  JS_ASSIGN_PROTO_PROP(useLayoutToLayoutNavigationTransitions);
  JS_ASSIGN_PROTO_PROP_READONLY(collectionViewLayout);
  JS_ASSIGN_PROTO_PROP(installsStandardGestureForInteractiveMovement);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewController, UIViewController);
JS_INIT_CLASS_END(UICollectionViewController, UIViewController);

NAN_METHOD(NUICollectionViewController::New) {
  JS_RECONSTRUCT(UICollectionViewController);

  Local<Object> ctrlObj = info.This();

  NUICollectionViewController *ctrl = new NUICollectionViewController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UICollectionViewController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          ctrl->SetNSObject([UICollectionViewController alloc]);
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

#include "NUICollectionViewLayout.h"

NAN_METHOD(NUICollectionViewController::initWithCollectionViewLayout) {
  JS_UNWRAP_OR_ALLOC(UICollectionViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UICollectionViewLayout, layout);
    JS_SET_RETURN(js_value_instancetype([self initWithCollectionViewLayout: layout]));
  }
}

#include "NNSBundle.h"

NAN_METHOD(NUICollectionViewController::initWithNibNameBundle) {
  JS_UNWRAP_OR_ALLOC(UICollectionViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, nibNameOrNil);
    declare_nullable_pointer(NSBundle, nibBundleOrNil);
    JS_SET_RETURN(js_value_instancetype([self initWithNibName: nibNameOrNil bundle: nibBundleOrNil]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUICollectionViewController::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UICollectionViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

#include "NUICollectionView.h"

NAN_GETTER(NUICollectionViewController::collectionViewGetter) {
  JS_UNWRAP(UICollectionViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionView([self collectionView]));
  }
}

NAN_SETTER(NUICollectionViewController::collectionViewSetter) {
  JS_UNWRAP(UICollectionViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UICollectionView, input);
    [self setCollectionView: input];
  }
}

NAN_GETTER(NUICollectionViewController::clearsSelectionOnViewWillAppearGetter) {
  JS_UNWRAP(UICollectionViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self clearsSelectionOnViewWillAppear]));
  }
}

NAN_SETTER(NUICollectionViewController::clearsSelectionOnViewWillAppearSetter) {
  JS_UNWRAP(UICollectionViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setClearsSelectionOnViewWillAppear: input];
  }
}

NAN_GETTER(NUICollectionViewController::useLayoutToLayoutNavigationTransitionsGetter) {
  JS_UNWRAP(UICollectionViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self useLayoutToLayoutNavigationTransitions]));
  }
}

NAN_SETTER(NUICollectionViewController::useLayoutToLayoutNavigationTransitionsSetter) {
  JS_UNWRAP(UICollectionViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUseLayoutToLayoutNavigationTransitions: input];
  }
}

NAN_GETTER(NUICollectionViewController::collectionViewLayoutGetter) {
  JS_UNWRAP(UICollectionViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UICollectionViewLayout([self collectionViewLayout]));
  }
}

NAN_GETTER(NUICollectionViewController::installsStandardGestureForInteractiveMovementGetter) {
  JS_UNWRAP(UICollectionViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self installsStandardGestureForInteractiveMovement]));
  }
}

NAN_SETTER(NUICollectionViewController::installsStandardGestureForInteractiveMovementSetter) {
  JS_UNWRAP(UICollectionViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setInstallsStandardGestureForInteractiveMovement: input];
  }
}
