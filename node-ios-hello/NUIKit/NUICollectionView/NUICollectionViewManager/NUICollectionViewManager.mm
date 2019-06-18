//
//  NUICollectionViewManager.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionViewManager.h"

NUICollectionViewManager::NUICollectionViewManager() {}
NUICollectionViewManager::~NUICollectionViewManager() {}

JS_INIT_CLASS(UICollectionViewManager, NSObject);
  JS_ASSIGN_PROTO_PROP(didSelectItemAt);
  JS_ASSIGN_PROTO_PROP(didDeselectItemAt);
  JS_ASSIGN_PROTO_PROP(shouldSelectItemAt);
  JS_ASSIGN_PROTO_PROP(shouldDeselectItemAt);
  
  JS_ASSIGN_PROTO_PROP(didHighlightItemAt);
  JS_ASSIGN_PROTO_PROP(didUnhighlightItemAt);
  JS_ASSIGN_PROTO_PROP(shouldHighlightItemAt);
  JS_ASSIGN_PROTO_PROP(shouldUnhighlightItemAt);
  
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICollectionViewManager, NSObject);
JS_INIT_CLASS_END(UICollectionViewManager, NSObject);

#include "NUICollectionView.h"
#include "NUICollectionViewCell.h"

NAN_METHOD(NUICollectionViewManager::New) {
  JS_RECONSTRUCT(UICollectionViewManager);

  Local<Object> obj = info.This();

  NUICollectionViewManager *mgr = new NUICollectionViewManager();

  if (info[0]->IsExternal()) {
    mgr->SetNSObject((__bridge SUICollectionViewManager *)(info[0].As<External>()->Value()));
  } else if (info.Length() >= 2) {
    mgr->_numberItemsInSection.Reset(Local<Function>::Cast(info[0]));
    mgr->_cellForItemAt.Reset(Local<Function>::Cast(info[1]));

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        mgr->SetNSObject([[SUICollectionViewManager alloc] initWithNumberItemsInSection: ^ NSInteger (UICollectionView * _Nonnull collectionView, NSInteger section) {
          Nan::HandleScope scope;
          Local<Value> cvObj = sweetiekit::GetWrapperFor(collectionView, NUICollectionView::type);
          Local<Value> sectionVal = JS_NUM(section);
          Local<Value> resultVal = mgr->_numberItemsInSection("NUICollectionViewManager::New",
            cvObj, sectionVal);
          int result = resultVal->IsNumber() ? TO_INT32(resultVal) : 0;
          return result;
          return 1;
        } cellForItemAt: ^ UICollectionViewCell * _Nonnull (UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
          Nan::HandleScope scope;
          Local<Value> cvObj = sweetiekit::GetWrapperFor(collectionView, NUICollectionView::type);
          auto section = [indexPath section];
          auto row = [indexPath row];
          Local<Object> indexPathObj = Nan::New<Object>();
          Nan::Set(indexPathObj, JS_STR("section"), JS_NUM(section));
          Nan::Set(indexPathObj, JS_STR("row"), JS_NUM(row));
          Local<Value> result = mgr->_cellForItemAt("NUITableViewManager::New", cvObj, indexPathObj);
          JS_UNWRAPPED(JS_OBJ(result), UICollectionViewCell, cell);
          return cell;
        }]);
      });
    }
  } else {
    // throw error
    // two callback function arguments required
  }

  mgr->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NUICollectionViewManager::didSelectItemAtGetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"NUICollectionViewManager::DidSelectItemAtSetter");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NUICollectionViewManager::didSelectItemAtSetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"NUICollectionViewManager::DidSelectItemAtSetter");
    [self setDidSelectItemAtCallback: ^ (UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
      dispatch_main(^{
        get_persistent_function(self, callback, @"NUICollectionViewManager::DidSelectItemAtSetter");
        if (callback) {
          [callback jsFunction]->Call("NUICollectionViewManager::DidSelectItemAtSetter",
            js_value_UICollectionView(collectionView),
            js_value_NSIndexPath(indexPath));
        }
      });
    }];
  }
}

NAN_GETTER(NUICollectionViewManager::didDeselectItemAtGetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"NUICollectionViewManager::DidDeselectItemAtSetter");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NUICollectionViewManager::didDeselectItemAtSetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"NUICollectionViewManager::DidDeselectItemAtSetter");
    [self setDidDeselectItemAtCallback: ^ (UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
      dispatch_main(^{
        get_persistent_function(self, callback, @"NUICollectionViewManager::DidDeselectItemAtSetter");
        if (callback) {
          [callback jsFunction]->Call("NUICollectionViewManager::DidDeselectItemAtSetter",
            js_value_UICollectionView(collectionView),
            js_value_NSIndexPath(indexPath));
        }
      });
    }];
  }
}

NAN_GETTER(NUICollectionViewManager::shouldSelectItemAtGetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"NUICollectionViewManager::ShouldSelectItemAtSetter");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NUICollectionViewManager::shouldSelectItemAtSetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"NUICollectionViewManager::ShouldSelectItemAtSetter");
    [self setShouldSelectItemAtCallback: ^ BOOL(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
      __block BOOL result = YES;
      dispatch_main(^{
        get_persistent_function(self, callback, @"NUICollectionViewManager::ShouldSelectItemAtSetter");
        if (callback) {
          result = to_value_BOOL(
            [callback jsFunction]->Call("NUICollectionViewManager::ShouldSelectItemAtSetter",
              js_value_UICollectionView(collectionView),
              js_value_NSIndexPath(indexPath)));
        }
      });
      return result;
    }];
  }
}

NAN_GETTER(NUICollectionViewManager::shouldDeselectItemAtGetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"NUICollectionViewManager::ShouldDeselectItemAtSetter");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NUICollectionViewManager::shouldDeselectItemAtSetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"NUICollectionViewManager::ShouldDeselectItemAtSetter");
    [self setShouldDeselectItemAtCallback: ^ BOOL(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
      __block BOOL result = YES;
      dispatch_main(^{
        get_persistent_function(self, callback, @"NUICollectionViewManager::ShouldDeselectItemAtSetter");
        if (callback) {
          result = to_value_BOOL(
            [callback jsFunction]->Call("NUICollectionViewManager::ShouldDeselectItemAtSetter",
              js_value_UICollectionView(collectionView),
              js_value_NSIndexPath(indexPath)));
        }
      });
      return result;
    }];
  }
}




NAN_GETTER(NUICollectionViewManager::didHighlightItemAtGetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"NUICollectionViewManager::DidHighlightItemAtSetter");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NUICollectionViewManager::didHighlightItemAtSetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"NUICollectionViewManager::DidHighlightItemAtSetter");
    [self setDidHighlightItemAtCallback: ^ (UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
      dispatch_main(^{
        get_persistent_function(self, callback, @"NUICollectionViewManager::DidHighlightItemAtSetter");
        if (callback) {
          [callback jsFunction]->Call("NUICollectionViewManager::DidHighlightItemAtSetter",
            js_value_UICollectionView(collectionView),
            js_value_NSIndexPath(indexPath));
        }
      });
    }];
  }
}

NAN_GETTER(NUICollectionViewManager::didUnhighlightItemAtGetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"NUICollectionViewManager::DidUnhighlightItemAtSetter");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NUICollectionViewManager::didUnhighlightItemAtSetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"NUICollectionViewManager::DidUnhighlightItemAtSetter");
    [self setDidUnhighlightItemAtCallback: ^ (UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
      dispatch_main(^{
        get_persistent_function(self, callback, @"NUICollectionViewManager::DidUnhighlightItemAtSetter");
        if (callback) {
          [callback jsFunction]->Call("NUICollectionViewManager::DidUnhighlightItemAtSetter",
            js_value_UICollectionView(collectionView),
            js_value_NSIndexPath(indexPath));
        }
      });
    }];
  }
}

NAN_GETTER(NUICollectionViewManager::shouldHighlightItemAtGetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"NUICollectionViewManager::ShouldHighlightItemAtSetter");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NUICollectionViewManager::shouldHighlightItemAtSetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"NUICollectionViewManager::ShouldHighlightItemAtSetter");
    [self setShouldHighlightItemAtCallback: ^ BOOL(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
      __block BOOL result = YES;
      dispatch_main(^{
        get_persistent_function(self, callback, @"NUICollectionViewManager::ShouldHighlightItemAtSetter");
        if (callback) {
          result = to_value_BOOL(
            [callback jsFunction]->Call("NUICollectionViewManager::ShouldHighlightItemAtSetter",
              js_value_UICollectionView(collectionView),
              js_value_NSIndexPath(indexPath)));
        }
      });
      return result;
    }];
  }
}

NAN_GETTER(NUICollectionViewManager::shouldUnhighlightItemAtGetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"NUICollectionViewManager::ShouldUnhighlightItemAtSetter");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NUICollectionViewManager::shouldUnhighlightItemAtSetter) {
  JS_UNWRAP_SWIFT(UICollectionViewManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"NUICollectionViewManager::ShouldUnhighlightItemAtSetter");
    [self setShouldUnhighlightItemAtCallback: ^ BOOL(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
      __block BOOL result = YES;
      dispatch_main(^{
        get_persistent_function(self, callback, @"NUICollectionViewManager::ShouldUnhighlightItemAtSetter");
        if (callback) {
          result = to_value_BOOL(
            [callback jsFunction]->Call("NUICollectionViewManager::ShouldUnhighlightItemAtSetter",
              js_value_UICollectionView(collectionView),
              js_value_NSIndexPath(indexPath)));
        }
      });
      return result;
    }];
  }
}
