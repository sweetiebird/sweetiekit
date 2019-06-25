//
//  NUITableViewManager.mm
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewManager.h"

NUITableViewManager::NUITableViewManager() {}
NUITableViewManager::~NUITableViewManager() {}

JS_INIT_CLASS(UITableViewManager, NSObject);
  // instance members (proto)
  JS_SET_PROP(proto, "didSelectRowAt", DidSelectRowAt);
  JS_SET_PROP(proto, "numberOfSections", NumberOfSections);
  JS_ASSIGN_PROP(proto, heightForRowAtIndexPath);
  JS_ASSIGN_PROP(proto, titleForHeaderInSection);
  // static members (ctor)
  JS_INIT_CTOR(UITableViewManager, NSObject);
JS_INIT_CLASS_END(UITableViewManager, NSObject);

#include "NUITableView.h"
#include "NUITableViewCell.h"

NAN_METHOD(NUITableViewManager::New) {
  JS_RECONSTRUCT(UITableViewManager);

  Local<Object> obj = info.This();

  NUITableViewManager *mgr = new NUITableViewManager();

  if (info[0]->IsExternal()) {
    mgr->SetNSObject((__bridge SUITableViewManager *)(info[0].As<External>()->Value()));
  } else if (info.Length() >= 2) {
    mgr->_numberRowsInSection.Reset(Local<Function>::Cast(info[0]));
    mgr->_cellForRowAt.Reset(Local<Function>::Cast(info[1]));

    @autoreleasepool {
      mgr->SetNSObject([[SUITableViewManager alloc] initWithGetNumberOfRowsInSection: ^ NSInteger (UITableView * _Nonnull tableView, NSInteger section) {
        __block int result = 0;
        dispatch_main(^{
          Local<Value> tableViewObj = sweetiekit::GetWrapperFor(tableView, NUITableView::type);
          Local<Value> sectionVal = JS_NUM(section);
          Local<Value> resultVal = mgr->_numberRowsInSection("NUITableViewManager::New",
            tableViewObj, sectionVal);
          result = resultVal->IsNumber() ? TO_INT32(resultVal) : 0;
        });
        return result;
      } getCellForRowAt: ^ UITableViewCell * _Nonnull (UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        __block UITableViewCell* returning = nil;
        dispatch_main(^{
          Local<Value> tableViewObj = sweetiekit::GetWrapperFor(tableView, NUITableView::type);
          auto section = [indexPath section];
          auto row = [indexPath row];
          Local<Object> indexPathObj = Nan::New<Object>();
          Nan::Set(indexPathObj, JS_STR("section"), JS_INT(section));
          Nan::Set(indexPathObj, JS_STR("row"), JS_INT(row));
          Local<Value> result = mgr->_cellForRowAt("NUITableViewManager::New",
            tableViewObj, indexPathObj);
          JS_UNWRAPPED(JS_OBJ(result), UITableViewCell, cell);
          returning = cell;
        });
        return returning;
      }]);
    }
  } else {
    // throw error
    // two callback function arguments required
  }

  mgr->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NUITableViewManager::DidSelectRowAtGetter) {
  Nan::HandleScope scope;

  NUITableViewManager *mgr = ObjectWrap::Unwrap<NUITableViewManager>(info.This());
  SUITableViewManager* sMgr = mgr->As<SUITableViewManager>(); sMgr = sMgr;

  Nan::ThrowError("TODO NUITableViewManager::DidSelectRowAtGetter");
}

NAN_SETTER(NUITableViewManager::DidSelectRowAtSetter) {
  Nan::HandleScope scope;

  NUITableViewManager *mgr = ObjectWrap::Unwrap<NUITableViewManager>(info.This());
  SUITableViewManager* sMgr = mgr->As<SUITableViewManager>(); sMgr = sMgr;

  mgr->_didSelectRowAt.Reset(Local<Function>::Cast(value));
  
  [sMgr setDidSelectRowAtCallback: ^ (UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
    dispatch_main(^{
      Local<Value> tableViewObj = sweetiekit::GetWrapperFor(tableView, NUITableView::type);
      auto section = [indexPath section];
      auto row = [indexPath row];
      Local<Object> indexPathObj = Nan::New<Object>();
      Nan::Set(indexPathObj, JS_STR("section"), JS_INT(section));
      Nan::Set(indexPathObj, JS_STR("row"), JS_INT(row));
      mgr->_didSelectRowAt("NUITableViewManager::New", tableViewObj, indexPathObj);
    });
  }];
}

NAN_GETTER(NUITableViewManager::NumberOfSectionsGetter) {
  Nan::HandleScope scope;

  NUITableViewManager *mgr = ObjectWrap::Unwrap<NUITableViewManager>(info.This());
  SUITableViewManager* sMgr = mgr->As<SUITableViewManager>();

  Nan::ThrowError("TODO NUITableViewManager::NumberOfSectionsGetter");
}

NAN_SETTER(NUITableViewManager::NumberOfSectionsSetter) {
  Nan::HandleScope scope;

  NUITableViewManager *mgr = ObjectWrap::Unwrap<NUITableViewManager>(info.This());
  SUITableViewManager* sMgr = mgr->As<SUITableViewManager>();

  mgr->_numberSections.Reset(Local<Function>::Cast(value));
  
  [sMgr setNumberOfSectionsCallback: ^ NSInteger (UITableView * _Nonnull tableView) {
    __block NSInteger result = 0;
    dispatch_main(^{
      Local<Value> tableViewObj = sweetiekit::GetWrapperFor(tableView, NUITableView::type);
      Local<Value> resultVal = mgr->_numberSections("NUITableViewManager::NumberOfSectionsSetter",
              tableViewObj);
      result = resultVal->IsNumber() ? TO_INT32(resultVal) : 0;
    });
    return result;
  }];
}

NAN_GETTER(NUITableViewManager::heightForRowAtIndexPathGetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("NUITableViewManager::heightForRowAtIndexPathGetter not implemented");
}

NAN_SETTER(NUITableViewManager::heightForRowAtIndexPathSetter) {
  Nan::HandleScope scope;
  
  NUITableViewManager *mgr = ObjectWrap::Unwrap<NUITableViewManager>(info.This());
  SUITableViewManager* sMgr = mgr->As<SUITableViewManager>();

  mgr->_heightForRow.Reset(Local<Function>::Cast(value));

  [sMgr setHeightForRowCallback:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
  __block CGFloat result = 0;
    dispatch_main(^{
      Local<Value> tableViewObj = sweetiekit::GetWrapperFor(tableView, NUITableView::type);
      auto section = [indexPath section];
      auto row = [indexPath row];
      Local<Object> indexPathObj = Nan::New<Object>();
      Nan::Set(indexPathObj, JS_STR("section"), JS_INT(section));
      Nan::Set(indexPathObj, JS_STR("row"), JS_INT(row));
      Local<Value> resultVal = mgr->_heightForRow("NUITableViewManager::NumberOfSectionsSetter", tableViewObj, indexPathObj);
      result = resultVal->IsNumber() ? TO_DOUBLE(resultVal) : 0;
    });
    return result;
  }];
}

NAN_GETTER(NUITableViewManager::titleForHeaderInSectionGetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("NUITableViewManager::titleForHeaderInSectionGetter not implemented");
}

NAN_SETTER(NUITableViewManager::titleForHeaderInSectionSetter) {
  Nan::HandleScope scope;
  
  NUITableViewManager *mgr = ObjectWrap::Unwrap<NUITableViewManager>(info.This());
  SUITableViewManager* sMgr = mgr->As<SUITableViewManager>();

  mgr->_titleForSection.Reset(Local<Function>::Cast(value));

  [sMgr setTitleForSectionCallback:^NSString * _Nullable(UITableView * _Nonnull table, NSInteger section) {
    __block NSString* result = nil;
    dispatch_main(^{
      Local<Value> tableViewObj = sweetiekit::GetWrapperFor(table, NUITableView::type);
      Local<Value> resultVal = mgr->_titleForSection("NUITableViewManager::titleForHeaderInSectionSetter", tableViewObj, JS_NUM(section));
      result = resultVal->IsString() ? NJSStringToNSString(resultVal) : nil;
    });
    return result;
  }];
}
