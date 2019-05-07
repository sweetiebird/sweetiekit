//
//  NUITableViewManager.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUITableViewManager.h"
#import "node_ios_hello-Swift.h"
#include "NUITableView.h"
#include "NUITableViewCell.h"

Nan::Persistent<FunctionTemplate> NUITableViewManager::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITableViewManager::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITableViewManager"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "didSelectRowAt", DidSelectRowAt);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NUITableViewManager::NUITableViewManager () {}
NUITableViewManager::~NUITableViewManager () {}

NAN_METHOD(NUITableViewManager::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUITableViewManager *mgr = new NUITableViewManager();

  if (info[0]->IsExternal()) {
    mgr->SetNSObject((__bridge SUITableViewManager *)(info[0].As<External>()->Value()));
  } else if (info.Length() >= 2) {
    mgr->_numberRowsInSection.Reset(Local<Function>::Cast(info[0]));
    mgr->_cellForRowAt.Reset(Local<Function>::Cast(info[1]));

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        mgr->SetNSObject([[SUITableViewManager alloc] initWithGetNumberOfRowsInSection: ^ NSInteger (UITableView * _Nonnull tableView, NSInteger section) {
          Nan::HandleScope scope;
          Local<Value> tableViewObj = sweetiekit::GetWrapperFor(tableView, NUITableView::type);
          Local<Value> sectionVal = JS_NUM(section);
          Local<Value> resultVal = mgr->_numberRowsInSection("NUITableViewManager::New",
            tableViewObj, sectionVal);
          int result = resultVal->IsNumber() ? TO_INT32(resultVal) : 0;
          return result;
        } getCellForRowAt: ^ UITableViewCell * _Nonnull (UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
          Nan::HandleScope scope;
          Local<Value> tableViewObj = sweetiekit::GetWrapperFor(tableView, NUITableView::type);
          uint32_t section = [indexPath section];
          uint32_t row = [indexPath row];
          Local<Object> indexPathObj = Nan::New<Object>();
          Nan::Set(indexPathObj, JS_STR("section"), JS_INT(section));
          Nan::Set(indexPathObj, JS_STR("row"), JS_INT(row));
          Local<Value> result = mgr->_cellForRowAt("NUITableViewManager::New",
            tableViewObj, indexPathObj);
          JS_UNWRAPPED(JS_OBJ(result), UITableViewCell, cell);
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

NAN_GETTER(NUITableViewManager::DidSelectRowAtGetter) {
  Nan::HandleScope scope;

  NUITableViewManager *mgr = ObjectWrap::Unwrap<NUITableViewManager>(info.This());
  SUITableViewManager* sMgr = mgr->As<SUITableViewManager>();

  Nan::ThrowError("TODO NUITableViewManager::DidSelectRowAtGetter");
}

NAN_SETTER(NUITableViewManager::DidSelectRowAtSetter) {
  Nan::HandleScope scope;

  NUITableViewManager *mgr = ObjectWrap::Unwrap<NUITableViewManager>(info.This());
  SUITableViewManager* sMgr = mgr->As<SUITableViewManager>();

  mgr->_didSelectRowAt.Reset(Local<Function>::Cast(value));
  
  [sMgr setDidSelectRowAtCallback: ^ (UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
    Local<Value> tableViewObj = sweetiekit::GetWrapperFor(tableView, NUITableView::type);
    uint32_t section = [indexPath section];
    uint32_t row = [indexPath row];
    Local<Object> indexPathObj = Nan::New<Object>();
    Nan::Set(indexPathObj, JS_STR("section"), JS_INT(section));
    Nan::Set(indexPathObj, JS_STR("row"), JS_INT(row));
    mgr->_didSelectRowAt("NUITableViewManager::New", tableViewObj, indexPathObj);
  }];
}
