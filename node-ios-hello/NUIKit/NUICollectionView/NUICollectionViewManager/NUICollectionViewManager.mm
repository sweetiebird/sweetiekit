//
//  NUICollectionViewManager.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUICollectionViewManager.h"
#import "node_ios_hello-Swift.h"
#include "NUICollectionView.h"
#include "NUICollectionViewCell.h"

Nan::Persistent<FunctionTemplate> NUICollectionViewManager::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUICollectionViewManager::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UICollectionViewManager"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "didSelectItemAt", DidSelectItemAt);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NUICollectionViewManager::NUICollectionViewManager () {}
NUICollectionViewManager::~NUICollectionViewManager () {}

NAN_METHOD(NUICollectionViewManager::New) {
  Nan::HandleScope scope;

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
          uint32_t section = [indexPath section];
          uint32_t row = [indexPath row];
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

NAN_GETTER(NUICollectionViewManager::DidSelectItemAtGetter) {
  Nan::HandleScope scope;

  NUICollectionViewManager *mgr = ObjectWrap::Unwrap<NUICollectionViewManager>(info.This());
  SUICollectionViewManager* sMgr = mgr->As<SUICollectionViewManager>();

  Nan::ThrowError("TODO SUICollectionViewManager::DidSelectItemAtGetter");
}

NAN_SETTER(NUICollectionViewManager::DidSelectItemAtSetter) {
  Nan::HandleScope scope;

  NUICollectionViewManager *mgr = ObjectWrap::Unwrap<NUICollectionViewManager>(info.This());
  SUICollectionViewManager* sMgr = mgr->As<SUICollectionViewManager>();

  mgr->_didSelectItemAt.Reset(Local<Function>::Cast(value));

  [sMgr setDidSelectItemAtCallback: ^ (UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
    Nan::HandleScope scope;
//    Local<Value> tableViewObj = sweetiekit::GetWrapperFor(tableView, NUITableView::type);
//    uint32_t section = [indexPath section];
//    uint32_t row = [indexPath row];
//    Local<Object> indexPathObj = Nan::New<Object>();
//    Nan::Set(indexPathObj, JS_STR("section"), JS_INT(section));
//    Nan::Set(indexPathObj, JS_STR("row"), JS_INT(row));
//    mgr->_didSelectRowAt("NUITableViewManager::New", tableViewObj, indexPathObj);
  }];
}
