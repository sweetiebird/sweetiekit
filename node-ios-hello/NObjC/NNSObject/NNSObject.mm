//
//  NNSObject.m
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#include "NNSObject.h"

#import <objc/runtime.h>

@implementation NSObject (CategoryNSObject)

#pragma mark Associated Methods:

- (void) associateValue:(id)value withKey:(NSString *)aKey {
  
  objc_setAssociatedObject( self, (__bridge void *)aKey, value, OBJC_ASSOCIATION_RETAIN );
}

- (id) associatedValueForKey:(NSString *)aKey {
  
  return objc_getAssociatedObject( self, (__bridge void *)aKey );
}

@end

Nan::Persistent<FunctionTemplate> NNSObject::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSObject::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(NNSObject::New);

  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSObject"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NNSObject::NNSObject() {}

NNSObject::~NNSObject() {}

NAN_METHOD(NNSObject::New) {
  NNSObject *gl = new NNSObject();
  Local<Object> glObj = info.This();
  gl->Wrap(glObj);

  info.GetReturnValue().Set(glObj);
}

NAN_METHOD(NNSObject::Destroy) {
  NNSObject *gl = ObjectWrap::Unwrap<NNSObject>(info.This());
  //gl->live = false;
}

void NNSObject::SetNSObject(NSObject* obj) {
  _NSObject = obj;
  /*
  auto wrapper = objc_getAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"]);
  if (wrapper == nullptr) {
    Nan::Persistent<FunctionTemplate>** p = new Nan::Persistent<FunctionTemplate>*(&GetDerivedType());
    auto w = [NSObjectWrapper alloc];
    w.ptr = p;
    
    objc_setAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"], w, objc_AssociationPolicy::OBJC_ASSOCIATION_RETAIN);
    //[_NSObject assignAssociatedWrapperWithPtr:p forKey:@"sweetiekit.type"];
  }*/
}
#include "NNSUserDefaults.h"
#include "NUILabel.h"
#include "NUIApplication.h"
#include "NUIWindow.h"
#include "NUIButton.h"
#include "NUIRefreshControl.h"
#include "NUISwitch.h"
#include "NUIImage.h"
#include "NUIImageView.h"
#include "NUITextField.h"
#include "NUIStoryboard.h"
#include "NUITabBarController.h"
#include "NUIViewController.h"
#include "NUINavigationController.h"
#include "NUIImagePickerController.h"
#include "NUIImagePickerControllerDelegate.h"
#include "NUIViewControllerTransitioningDelegate.h"
#include "NUITableViewController.h"
#include "NUITableView.h"
#include "NUITableViewCell.h"
#include "NUITableViewDataSource.h"
#include "NCALayer.h"
#include "NCABasicAnimation.h"
#include "NUIPresentationController.h"
#include "NUIScrollView.h"
#include "NNSLayoutAnchor.h"
#include "NNSLayoutConstraint.h"
#include "NUITableViewManager.h"
#include "NUIBarButtonItem.h"

Nan::Persistent<FunctionTemplate>& NNSObject::GetNSObjectType(NSObject* obj, Nan::Persistent<FunctionTemplate>& unset) {
  if (obj != nullptr) {
    //auto wrapper = (Nan::Persistent<FunctionTemplate>**)[obj associatedWrapperForKey:@"sweetiekit.type"];
    
    NSObjectWrapper* wrapper = objc_getAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"]);
    if (wrapper != nullptr) {
      Nan::Persistent<FunctionTemplate>** p = (Nan::Persistent<FunctionTemplate>**)wrapper.ptr;
      if (p != nullptr && *p != nullptr) {
        return **p;
      }
    }
    if (wrapper == nullptr) {
    
      // ========= core animation
      if ([obj isKindOfClass:[CALayer class]]) {
        return NCALayer::type;
      }
      if ([obj isKindOfClass:[CABasicAnimation class]]) {
        return NCABasicAnimation::type;
      }

      // UIKit
      
      if ([obj isKindOfClass:[UIApplication class]]) {
        return NUIApplication::type;
      }
      if ([obj isKindOfClass:[UIWindow class]]) {
        return NUIWindow::type;
      }
      // ========= views
      if ([obj isKindOfClass:[UITableView class]]) {
        return NUITableView::type;
      }
      if ([obj isKindOfClass:[UIScrollView class]]) {
        return NUIScrollView::type;
      }
      if ([obj isKindOfClass:[UITableViewCell class]]) {
        return NUITableViewCell::type;
      }
      if ([obj isKindOfClass:[UILabel class]]) {
        return NUILabel::type;
      }
      if ([obj isKindOfClass:[UIButton class]]) {
        return NUIButton::type;
      }
      if ([obj isKindOfClass:[UIImage class]]) {
        return NUIImage::type;
      }
      if ([obj isKindOfClass:[UIImageView class]]) {
        return NUIImageView::type;
      }
      if ([obj isKindOfClass:[UIStoryboard class]]) {
        return NUIStoryboard::type;
      }
      if ([obj isKindOfClass:[UITextField class]]) {
        return NUITextField::type;
      }
      if ([obj isKindOfClass:[UISwitch class]]) {
        return NUISwitch::type;
      }
      if ([obj isKindOfClass:[UIRefreshControl class]]) {
        return NUIRefreshControl::type;
      }
      if ([obj isKindOfClass:[UIControl class]]) {
        return NUIControl::type;
      }
      if ([obj isKindOfClass:[UIView class]]) {
        return NUIView::type;
      }
      if ([obj isKindOfClass:[UIResponder class]]) {
        return NUIResponder::type;
      }
      // ======== controllers
      if ([obj isKindOfClass:[UITableViewController class]]) {
        return NUITableViewController::type;
      }
      if ([obj isKindOfClass:[UIImagePickerController class]]) {
        return NUIImagePickerController::type;
      }
      if ([obj isKindOfClass:[UINavigationController class]]) {
        return NUINavigationController::type;
      }
      if ([obj isKindOfClass:[UITabBarController class]]) {
        return NUITabBarController::type;
      }
      if ([obj isKindOfClass:[UIViewController class]]) {
        return NUIViewController::type;
      }
      if ([obj isKindOfClass:[UIPresentationController class]]) {
        return NUIPresentationController::type;
      }
      // ========= delegates
      if ([obj isKindOfClass:[SUITableViewManager class]]) {
        return NUITableViewManager::type;
      }
      if ([obj isKindOfClass:[SUIImagePickerControllerDelegate class]]) {
        return NUIImagePickerControllerDelegate::type;
      }
      if ([obj isKindOfClass:[SUITableViewDataSource class]]) {
        return NUITableViewDataSource::type;
      }
      if ([obj isKindOfClass:[SUIViewControllerTransitioningDelegate class]]) {
        return NUIViewControllerTransitioningDelegate::type;
      }
      // ========= objects
      if ([obj isKindOfClass:[UIBarButtonItem class]]) {
        return NUIBarButtonItem::type;
      }
      if ([obj isKindOfClass:[NSLayoutConstraint class]]) {
        return NNSLayoutConstraint::type;
      }
      if ([obj isKindOfClass:[NSLayoutAnchor class]]) {
        return NNSLayoutAnchor::type;
      }
      if ([obj isKindOfClass:[NSUserDefaults class]]) {
        return NNSUserDefaults::type;
      }
      if ([obj isKindOfClass:[NSObject class]]) {
        return NNSObject::type;
      }
      Nan::ThrowError("Unknown type");
    }
  }
  return unset;
}
