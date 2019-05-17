//
//  NNSObject.m
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <SceneKit/SceneKit.h>
#import <MapKit/MapKit.h>
#import <ARKit/ARKit.h>
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
  JS_ASSIGN_PROP_READONLY(proto, class);
  JS_ASSIGN_PROP_READONLY(proto, superclass);
  JS_ASSIGN_PROP_READONLY(proto, metaclass);
  JS_ASSIGN_PROP_READONLY(proto, className);
  JS_ASSIGN_PROP_READONLY(proto, description);
  JS_ASSIGN_PROP_READONLY(proto, debugDescription);
  JS_ASSIGN_PROP_READONLY(proto, methods);
  JS_ASSIGN_PROP_READONLY(proto, properties);
  Nan::SetMethod(proto, "invokeBooleanGetter", invokeBooleanGetter);
  Nan::SetMethod(proto, "invokeBooleanSetter", invokeBooleanSetter);
  Nan::SetMethod(proto, "invokeMethod", invokeMethod);
  
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  sweetiekit::Set(ctorFn, "classFromString", ^(JSInfo info) {
    Nan::HandleScope scope;
    Class cls = NSClassFromString(NJSStringToNSString(info[0]));
    JS_SET_RETURN(sweetiekit::GetWrapperFor(cls, NNSObject::type));
  });
  sweetiekit::Set(ctorFn, "stringFromClass", ^(JSInfo info) {
    Nan::HandleScope scope;
    NNSObject* ncls = ObjectWrap::Unwrap<NNSObject>(JS_OBJ(info[0]));
    @autoreleasepool {
      if (!ncls->IsClass()) {
        Nan::ThrowError("NSObject.stringFromClass: argument isn't a class");
      } else {
        Class cls = ncls->AsClass();
        NSString* clsStr = NSStringFromClass(cls);
        JS_SET_RETURN(JS_STR([clsStr UTF8String]));
      }
    }
  });

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NNSObject::NNSObject() {}

NNSObject::~NNSObject() {}

NAN_METHOD(NNSObject::New) {
  Local<Object> obj = info.This();

  NNSObject *nObj = new NNSObject();

  if (info[0]->IsExternal()) {
    nObj->SetNSObject((__bridge NSObject *)(info[0].As<External>()->Value()));
  }
  nObj->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NNSObject::Destroy) {
  //NNSObject *ns = ObjectWrap::Unwrap<NNSObject>(info.This());
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

NAN_GETTER(NNSObject::classGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(NSObject, ns);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ns class], NNSObject::type));
}

NAN_GETTER(NNSObject::superclassGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(NSObject, ns);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ns superclass], NNSObject::type));
}

NAN_GETTER(NNSObject::metaclassGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(NSObject, ns);

  JS_SET_RETURN(sweetiekit::GetWrapperFor(object_getClass([ns class]), NNSObject::type));
}

NAN_GETTER(NNSObject::classNameGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSObject, ns);
  JS_SET_RETURN(JS_STR([NSStringFromClass([ns class]) UTF8String]));
}

NAN_GETTER(NNSObject::descriptionGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSObject, ns);
  JS_SET_RETURN(JS_STR([[ns description] UTF8String]));
}

NAN_GETTER(NNSObject::debugDescriptionGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSObject, ns);
  JS_SET_RETURN(JS_STR([[ns debugDescription] UTF8String]));
}

NAN_GETTER(NNSObject::methodsGetter) {
  Nan::EscapableHandleScope scope;
  
  JS_UNWRAP(NSObject, ns);
  if (!object_isClass(ns)) {
    Nan::ThrowError("NSObject:methods: not a class");
    return;
  }
  Class cls = nns->AsClass();
  
  Local<Array> result = Nan::New<Array>();
  __block unsigned int n = 0;
  sweetiekit::forEachMethodInClass(cls, ^(Method m) {
    @autoreleasepool {
      Nan::EscapableHandleScope scope;
      Local<Object> obj = Nan::New<Object>();
      auto argc = method_getNumberOfArguments(m);
      obj->Set(JS_STR("name"), JS_STR([NSStringFromSelector(method_getName(m)) UTF8String]));
      obj->Set(JS_STR("returnType"), JS_STR(method_copyReturnType(m)));
      Local<Array> argv = Nan::New<Array>();
      for (auto i = 0; i < argc; i++) {
        argv->Set(i, JS_STR(method_copyArgumentType(m, i)));
      }
      obj->Set(JS_STR("arguments"), argv);
      obj->Set(JS_STR("typeEncoding"), JS_STR(method_getTypeEncoding(m)));
      result->Set(n, scope.Escape(obj));
      n++;
    }
  });
  JS_SET_RETURN(scope.Escape(result));
}

NAN_GETTER(NNSObject::propertiesGetter) {
  Nan::EscapableHandleScope scope;
  
  JS_UNWRAP(NSObject, ns);
  if (!object_isClass(ns)) {
    Nan::ThrowError("NSObject:properties: not a class");
    return;
  }
  Class cls = nns->AsClass();
  
  Local<Array> result = Nan::New<Array>();
  __block unsigned int n = 0;
  sweetiekit::forEachPropertyInClass(cls, ^(objc_property_t p) {
    @autoreleasepool {
      Nan::EscapableHandleScope scope;
      Local<Object> obj = Nan::New<Object>();
      obj->Set(JS_STR("name"), JS_STR(property_getName(p)));
      obj->Set(JS_STR("attributes"), JS_STR(property_getAttributes(p)));
      result->Set(n, scope.Escape(obj));
      n++;
    }
  });
  JS_SET_RETURN(scope.Escape(result));
}

NAN_METHOD(NNSObject::invokeBooleanGetter)
{
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSObject, ns);
  @autoreleasepool {
    Class cls = [ns class];
  
    NSString* name = NJSStringToNSString(info[0]);
    SEL sel = NSSelectorFromString(name);
    NSMethodSignature * sig = [cls instanceMethodSignatureForSelector:sel];
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
    [inv setSelector:sel];
    [inv invokeWithTarget:ns];
    bool result = false;
    [inv getReturnValue:&result];
    JS_SET_RETURN(JS_BOOL(result));
  }
}

NAN_METHOD(NNSObject::invokeBooleanSetter)
{
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSObject, ns);
  @autoreleasepool {
    Class cls = [ns class];
    
    NSString* name = NJSStringToNSString(info[0]);
    SEL sel = NSSelectorFromString(name);
    bool value = info[1]->BooleanValue(JS_ISOLATE());
    NSMethodSignature * sig = [cls instanceMethodSignatureForSelector:sel];
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
    [inv setSelector:sel];
    [inv setArgument:&value atIndex:2];
    [inv invokeWithTarget:ns];
  }
}

NAN_METHOD(NNSObject::invokeMethod)
{
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSObject, ns);
  @autoreleasepool {
    Class cls = [ns class];
    
    Local<Array> spec = Local<Array>::Cast(info[0]);
    char returnType = [NJSStringToNSString(spec->Get(0)) UTF8String][0];
    NSString* name = NJSStringToNSString(spec->Get(1));
    SEL sel = NSSelectorFromString(name);
    NSMethodSignature * sig = [cls instanceMethodSignatureForSelector:sel];
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
    [inv setSelector:sel];
    for (unsigned int i = 1; i < info.Length(); i++) {
      Local<Array> arg = Local<Array>::Cast(info[i]);
      char type = [NJSStringToNSString(arg->Get(0)) UTF8String][0];
      Local<Value> jsValue = arg->Get(1);
      switch (type)
      {
        case 'B':
        {
          bool value = jsValue->BooleanValue(JS_ISOLATE());
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'i':
        {
          int32_t value = TO_INT32(jsValue);
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'd':
        {
          double value = TO_DOUBLE(jsValue);
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'Q':
        {
          double value = TO_DOUBLE(jsValue);
          long long value1 = (long long)value;
          [inv setArgument:&value1 atIndex:1+i];
        } break;
        default:
        {
          Nan::ThrowError("NSObject::invokeMethod: Unknown type specifier");
          return;
        } break;
      }
    }
    [inv invokeWithTarget:ns];
    switch (returnType)
    {
      case 'B':
      {
        bool value = false;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_BOOL(value));
      } break;
      case 'i':
      {
        int32_t value = 0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_INT(value));
      } break;
      case 'd':
      {
        double value = 0.0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_NUM(value));
      } break;
      case 'Q':
      {
        long long value = 0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_NUM(value));
      } break;
      case 'v':
      {
        // void
      } break;
      default:
      {
        Nan::ThrowError("NSObject::invokeMethod: Unknown return type specifier");
        return;
      } break;
    }
  }
}

#include "NNSUserDefaults.h"
#include "NUILabel.h"
#include "NUISlider.h"
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
#include "NUITabBarItem.h"
#include "NUIViewController.h"
#include "NUINavigationController.h"
#include "NUIImagePickerController.h"
#include "NUIImagePickerControllerDelegate.h"
#include "NUIViewControllerTransitioningDelegate.h"
#include "NUITableViewController.h"
#include "NUITableView.h"
#include "NUITableViewCell.h"
#include "NUICollectionReusableView.h"
#include "NUICollectionView.h"
#include "NUICollectionViewController.h"
#include "NUICollectionViewCell.h"
#include "NUICollectionViewManager.h"
#include "NUITableViewDataSource.h"
#include "NUIPageControl.h"
#include "NCALayer.h"
#include "NCABasicAnimation.h"
#include "NUIPresentationController.h"
#include "NUIAlertController.h"
#include "NUIAlertAction.h"
#include "NUIScrollView.h"
#include "NUIScrollViewDelegate.h"
#include "NNSLayoutAnchor.h"
#include "NNSLayoutConstraint.h"
#include "NUITableViewManager.h"
#include "NUITouch.h"
#include "NUIBarButtonItem.h"
#include "NARSKView.h"
#include "NARSession.h"
#include "NARWorldTrackingConfiguration.h"
#include "NSKView.h"
#include "NSKNode.h"
#include "NSKPhysicsBody.h"
#include "NSKPhysicsWorld.h"
#include "NSKPhysicsContactDelegate.h"
#include "NSKPhysicsContact.h"
#include "NSKPhysicsWorld.h"
#include "NSKLabelNode.h"
#include "NSKAction.h"
#include "NARSKViewDelegate.h"
#include "NNSBundle.h"
#include "NAVAudioPlayer.h"
#include "NARAnchor.h"
#include "NARFrame.h"
#include "NARCamera.h"
#include "NARSCNView.h"
#include "NARLightEstimate.h"
#include "NARConfiguration.h"
#include "NARSCNViewDelegate.h"
#include "NSCNView.h"
#include "NSCNScene.h"
#include "NSCNNode.h"
#include "NSCNLight.h"
#include "NSKScene.h"
#include "NSKSpriteNode.h"
#include "NSKCameraNode.h"
#include "NCLLocationManager.h"
#include "NCLLocationManagerDelegate.h"
#include "NCLLocation.h"
#include "NCLHeading.h"
#include "NMKMapView.h"
#include "NMKMapViewDelegate.h"
#include "NMKAnnotationView.h"
#include "NUINib.h"
#include "NGif.h"
#include "NGifView.h"
#include "NGifManager.h"

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

      // MapKit
      
      if ([obj isKindOfClass:[MKMapView class]]) {
        return NMKMapView::type;
      }
      if ([obj isKindOfClass:[MKAnnotationView class]]) {
        return NMKAnnotationView::type;
      }
      if ([obj isKindOfClass:[SMKMapViewDelegate class]]) {
        return NMKMapViewDelegate::type;
      }

      // ARKit

      if ([obj isKindOfClass:[ARLightEstimate class]]) {
        return NARLightEstimate::type;
      }
      if ([obj isKindOfClass:[ARCamera class]]) {
        return NARCamera::type;
      }
      if ([obj isKindOfClass:[ARFrame class]]) {
        return NARFrame::type;
      }
      if ([obj isKindOfClass:[SARSKViewDelegate class]]) {
        return NARSKViewDelegate::type;
      }
      if ([obj isKindOfClass:[ARAnchor class]]) {
        return NARAnchor::type;
      }
      if ([obj isKindOfClass:[ARSKView class]]) {
        return NARSKView::type;
      }
      if ([obj isKindOfClass:[ARSession class]]) {
        return NARSession::type;
      }
      if ([obj isKindOfClass:[ARWorldTrackingConfiguration class]]) {
        return NARWorldTrackingConfiguration::type;
      }
      if ([obj isKindOfClass:[ARConfiguration class]]) {
        return NARConfiguration::type;
      }

      //SceneKit
      
      if ([obj isKindOfClass:[SCNLight class]]) {
        return NSCNLight::type;
      }
      if ([obj isKindOfClass:[SCNScene class]]) {
        return NSCNScene::type;
      }
      if ([obj isKindOfClass:[SCNNode class]]) {
        return NSCNNode::type;
      }
      if ([obj isKindOfClass:[SCNView class]]) {
        return NSCNView::type;
      }

      // SpriteKit
      
      if ([obj isKindOfClass:[SKCameraNode class]]) {
        return NSKCameraNode::type;
      }
      if ([obj isKindOfClass:[SKPhysicsWorld class]]) {
        return NSKPhysicsWorld::type;
      }
      if ([obj isKindOfClass:[SKPhysicsContact class]]) {
        return NSKPhysicsContact::type;
      }
      if ([NSStringFromClass([obj class]) isEqual: @"PKPhysicsContact"]) {
        return NSKPhysicsContact::type;
      }
      if ([obj isKindOfClass:[SSKPhysicsContactDelegate class]]) {
        return NSKPhysicsContactDelegate::type;
      }
      if ([obj isKindOfClass:[SKPhysicsWorld class]]) {
        return NSKPhysicsWorld::type;
      }
      if ([obj isKindOfClass:[SKPhysicsBody class]]) {
        return NSKPhysicsBody::type;
      }
      if ([obj isKindOfClass:[SKSpriteNode class]]) {
        return NSKSpriteNode::type;
      }
      if ([obj isKindOfClass:[SKScene class]]) {
        return NSKScene::type;
      }
      if ([obj isKindOfClass:[SKLabelNode class]]) {
        return NSKLabelNode::type;
      }
      if ([obj isKindOfClass:[SKNode class]]) {
        return NSKNode::type;
      }
      if ([obj isKindOfClass:[SKView class]]) {
        return NSKView::type;
      }
      if ([obj isKindOfClass:[SKAction class]]) {
        return NSKAction::type;
      }

      // Custom UIKit

      if ([obj isKindOfClass:[GifManager class]]) {
        return NGifManager::type;
      }
      if ([obj isKindOfClass:[Gif class]]) {
        return NGif::type;
      }
      if ([obj isKindOfClass:[GifView class]]) {
        return NGifView::type;
      }

      // UIKit
      
      if ([obj isKindOfClass:[UIApplication class]]) {
        return NUIApplication::type;
      }
      if ([obj isKindOfClass:[UIWindow class]]) {
        return NUIWindow::type;
      }
      if ([obj isKindOfClass:[UITouch class]]) {
        return NUITouch::type;
      }
      // ========= views
      if ([obj isKindOfClass:[UIPageControl class]]) {
        return NUIPageControl::type;
      }
      if ([obj isKindOfClass:[UISlider class]]) {
        return NUISlider::type;
      }
      if ([obj isKindOfClass:[UICollectionViewCell class]]) {
        return NUICollectionViewCell::type;
      }
      if ([obj isKindOfClass:[UICollectionReusableView class]]) {
        return NUICollectionReusableView::type;
      }
      if ([obj isKindOfClass:[UICollectionView class]]) {
        return NUICollectionView::type;
      }
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
      if ([obj isKindOfClass:[UIAlertController class]]) {
        return NUIAlertController::type;
      }
      if ([obj isKindOfClass:[UICollectionViewController class]]) {
        return NUICollectionViewController::type;
      }
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
      if ([obj isKindOfClass:[SUIScrollViewDelegate class]]) {
        return NUIScrollViewDelegate::type;
      }
      if ([obj isKindOfClass:[SUICollectionViewManager class]]) {
        return NUICollectionViewManager::type;
      }
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

      // ========= core location
      if ([obj isKindOfClass:[CLLocation class]]) {
        return NCLLocation::type;
      }
      if ([obj isKindOfClass:[CLHeading class]]) {
        return NCLHeading::type;
      }
      if ([obj isKindOfClass:[CLLocationManager class]]) {
        return NCLLocationManager::type;
      }
      if ([obj isKindOfClass:[SCLLocationManagerDelegate class]]) {
        return NCLLocationManagerDelegate::type;
      }

      // ========= objects
      if ([obj isKindOfClass:[UIAlertAction class]]) {
        return NUIAlertAction::type;
      }
      if ([obj isKindOfClass:[UINib class]]) {
        return NUINib::type;
      }
      if ([obj isKindOfClass:[UITabBarItem class]]) {
        return NUITabBarItem::type;
      }
      if ([obj isKindOfClass:[UIBarButtonItem class]]) {
        return NUIBarButtonItem::type;
      }
      if ([obj isKindOfClass:[AVAudioPlayer class]]) {
        return NAVAudioPlayer::type;
      }
      if ([obj isKindOfClass:[NSBundle class]]) {
        return NNSBundle::type;
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
