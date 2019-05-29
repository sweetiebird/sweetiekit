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
#import <CoreImage/CoreImage.h>
#import "node_ios_hello-Swift.h"
#include "NNSObject.h"

#import <objc/runtime.h>

@implementation NSObject (CategoryNSObject)

#pragma mark Associated Methods:

- (void) associateValue:(id)value withKey:(NSString *)aKey {
  
  objc_setAssociatedObject(self, (__bridge void *)aKey, value, OBJC_ASSOCIATION_RETAIN);
}

- (id) associatedValueForKey:(NSString *)aKey {
  
  return objc_getAssociatedObject( self, (__bridge void *)aKey );
}

- (void) dissociateValueForKey:(NSString *)aKey {
  objc_setAssociatedObject(self, (__bridge void *)aKey, nil, OBJC_ASSOCIATION_RETAIN);
}

@end

Nan::Persistent<FunctionTemplate> Nid::type;

Nid::Nid() {}
Nid::~Nid() {}

std::pair<Local<Object>, Local<FunctionTemplate>> Nid::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(Nid::New);

  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSObject"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP_READONLY(proto, self);
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
  Nan::SetMethod(ctorFn, "NSClassFromString", _NSClassFromString);
  Nan::SetMethod(ctorFn, "objc_msgSend", _objc_msgSend);
  sweetiekit::Set(ctorFn, "classFromString", ^(JSInfo info) {
    Nan::HandleScope scope;
    Class cls = NSClassFromString(NJSStringToNSString(info[0]));
    JS_SET_RETURN(sweetiekit::GetWrapperFor(cls, NNSObject::type));
  });
  sweetiekit::Set(ctorFn, "metaclassFromString", ^(JSInfo info) {
    Nan::HandleScope scope;
    Class cls = NSClassFromString(NJSStringToNSString(info[0]));
    if (cls != nullptr) {
      cls = object_getClass(cls);
      JS_SET_RETURN(sweetiekit::GetWrapperFor(cls, NNSObject::type));
    }
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

NAN_METHOD(Nid::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `id(...)`, turn into construct call.
      JS_SET_RETURN_NEW(id, info);
      return;
    }
    id self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge id)(info[0].As<External>()->Value());
    }
    if (!self && info.Length() > 0 && !info[0]->IsNullOrUndefined() && !info[0]->IsExternal()) {
      Nan::ThrowError("Nid::New: invalid arguments");
    } else {
      Nid *wrapper = new Nid();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    }
  }
}

NAN_GETTER(Nid::classGetter) {
  JS_UNWRAP_(id, ns);

  JS_SET_RETURN(js_value_id([ns class]));
}

NAN_GETTER(Nid::superclassGetter) {
  JS_UNWRAP_(id, ns);

  JS_SET_RETURN(js_value_id([ns superclass]));
}

NAN_GETTER(Nid::metaclassGetter) {
  JS_UNWRAP_(id, ns);

  JS_SET_RETURN(js_value_id(object_getClass([ns class])));
}

NAN_GETTER(Nid::classNameGetter) {
  JS_UNWRAP_(id, ns);
  JS_SET_RETURN(js_value_NSString(NSStringFromClass([ns class])));
}

NAN_GETTER(Nid::descriptionGetter) {
  JS_UNWRAP_(id, ns);
  JS_SET_RETURN(js_value_NSString([ns description]));
}

NAN_GETTER(Nid::debugDescriptionGetter) {
  JS_UNWRAP_(id, ns);
  JS_SET_RETURN(js_value_NSString([ns debugDescription]));
}

NAN_GETTER(Nid::methodsGetter) {
  JS_UNWRAP_(id, ns);
  if (!object_isClass(ns)) {
    Nan::ThrowError("id:methods: not a class");
    return;
  }
  Class cls = nns->AsClass();
  
  Local<Array> result = Nan::New<Array>();
  __block unsigned int n = 0;
  sweetiekit::forEachMethodInClass(cls, ^(Method m) {
    @autoreleasepool {
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
      result->Set(n, obj);
      n++;
    }
  });
  JS_SET_RETURN(result);
}

NAN_GETTER(Nid::propertiesGetter) {
  Nan::EscapableHandleScope scope;
  
  JS_UNWRAP_(id, ns);
  if (!object_isClass(ns)) {
    Nan::ThrowError("id:properties: not a class");
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

NAN_METHOD(Nid::invokeBooleanGetter)
{
  JS_UNWRAP_(id, self);
  @autoreleasepool {
    if (!self) {
      Nan::ThrowError("Nid::invokeBooleanGetter: self is nil");
      return;
    }
    Class cls = [self class];
    if (!cls) {
      Nan::ThrowError("Nid::invokeBooleanGetter: [self class] is nil");
      return;
    }
  
    NSString* name = NJSStringToNSString(info[0]);
    if (!name) {
      Nan::ThrowError("Nid::invokeBooleanGetter: expected 1st argument to be a string");
      return;
    }
    
    SEL sel = NSSelectorFromString(name);
    if (!sel) {
      Nan::ThrowError("Nid::invokeBooleanGetter: NSSelectorFromString returned nil");
      return;
    }
    
    NSMethodSignature * sig = [cls instanceMethodSignatureForSelector:sel];
    if (!sig) {
      Nan::ThrowError("Nid::invokeBooleanGetter: [[self class] instanceMethodSignatureForSelector:] returned nil");
      return;
    }
    
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
    if (!inv) {
      Nan::ThrowError("Nid::invokeBooleanGetter: [NSInvocation invocationWithMethodSignature:] returned nil");
      return;
    }
    
    [inv setSelector:sel];
    [inv invokeWithTarget:self];
    bool result = false;
    [inv getReturnValue:&result];
    JS_SET_RETURN(JS_BOOL(result));
  }
}

NAN_METHOD(Nid::invokeBooleanSetter)
{
  Nan::HandleScope scope;
  
  JS_UNWRAP_(id, self);
  @autoreleasepool {
    if (!self) {
      Nan::ThrowError("Nid::invokeBooleanSetter: self is nil");
      return;
    }
    
    Class cls = [self class];
    if (!cls) {
      Nan::ThrowError("Nid::invokeBooleanSetter: [self class] is nil");
      return;
    }
    
    NSString* name = NJSStringToNSString(info[0]);
    if (!name) {
      Nan::ThrowError("Nid::invokeBooleanSetter: expected 1st argument to be a string");
      return;
    }
    
    SEL sel = NSSelectorFromString(name);
    if (!sel) {
      Nan::ThrowError("Nid::invokeBooleanSetter: NSSelectorFromString returned nil");
      return;
    }
    
    bool value = info[1]->BooleanValue(JS_ISOLATE());
    NSMethodSignature * sig = [cls instanceMethodSignatureForSelector:sel];
    if (!sig) {
      Nan::ThrowError("Nid::invokeBooleanSetter: [[self class] instanceMethodSignatureForSelector:] returned nil");
      return;
    }
    
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
    if (!inv) {
      Nan::ThrowError("Nid::invokeBooleanSetter: [NSInvocation invocationWithMethodSignature:] returned nil");
      return;
    }
    
    [inv setSelector:sel];
    [inv setArgument:&value atIndex:2];
    [inv invokeWithTarget:self];
  }
}

NAN_METHOD(Nid::_NSClassFromString)
{
  @autoreleasepool {
    NSString* name = to_value_NSString(info[0]);
    if (!name) {
        Nan::ThrowError("Nid::NSClassFromString: expected first argument to be a string");
        return;
    }
    Class result = NSClassFromString(name);
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)result)
    };
    JS_SET_RETURN(JS_NEW_ARGV(Nid, argv));
  }
}

id to_id(Local<Value> jsValue, bool* failed = nullptr) {
  return to_value_id(jsValue, failed);
}

#include "Nobjc.h"

NAN_METHOD(Nid::_objc_msgSend)
{
  @autoreleasepool {
    bool failed = false;
    id obj = to_id(info[0], &failed);
    if (failed) {
      Nan::ThrowError("Nid::objc_msgSend: expected first argument to be an id");
      return;
    }
    if (!obj) {
      Nan::ThrowError("Nid::objc_msgSend: first argument is nil");
      return;
    }
    NSString* name = to_value_NSString(info[1]);
    if (!name) {
      Nan::ThrowError("Nid::objc_msgSend: expected second argument to be a SEL (string)");
      return;
    }
    
    SEL sel = NSSelectorFromString(name);
    if (!sel) {
      Nan::ThrowError("Nid::objc_msgSend: NSSelectorFromString returned nil");
      return;
    }
    
    switch (info.Length()) {
      case 2: {
        nobjc_msgSend0(obj, sel);
      } break;
      default: {
        Nan::ThrowError("Nid::objc_msgSend: input arguments not yet implemented");
        return;
      }
    }
  }
}

NAN_METHOD(Nid::invokeMethod)
{
  Nan::HandleScope scope;
  
  JS_UNWRAP_(id, self);
  @autoreleasepool {
    if (!self) {
      Nan::ThrowError("Nid::invokeMethod: self is nil");
      return;
    }
    
    Class cls = [self class];
    if (!cls) {
      Nan::ThrowError("Nid::invokeMethod: [self class] is nil");
      return;
    }
    
    if (!info[0]->IsArray()) {
      Nan::ThrowError("Nid::invokeMethod: expected first argument to be an array");
      return;
    }
    
    Local<Array> spec = Local<Array>::Cast(info[0]);
    
    NSString* returnTypeSpec = NJSStringToNSString(spec->Get(0));
    if (!returnTypeSpec) {
      Nan::ThrowError("Nid::invokeMethod: expected first value of first argument to be a string");
      return;
    }
    
    NSString* name = NJSStringToNSString(spec->Get(1));
    if (!name) {
      Nan::ThrowError("Nid::invokeMethod: expected last value of first argument to be a string");
      return;
    }
    
    SEL sel = NSSelectorFromString(name);
    if (!sel) {
      Nan::ThrowError("Nid::invokeMethod: NSSelectorFromString returned nil");
      return;
    }
    
    NSMethodSignature * sig = [cls instanceMethodSignatureForSelector:sel];
    if (!sig) {
      Nan::ThrowError("Nid::invokeMethod: [[self class] instanceMethodSignatureForSelector:] returned nil");
      return;
    }
    
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
    if (!inv) {
      Nan::ThrowError("Nid::invokeMethod: [NSInvocation invocationWithMethodSignature:] returned nil");
      return;
    }
    
    [inv setSelector:sel];
    
    for (unsigned int i = 1; i < info.Length(); i++) {
      if (!info[i]->IsArray()) {
        Nan::ThrowError("Nid::invokeMethod: expected argument to be an array");
        return;
      }
      Local<Array> arg = Local<Array>::Cast(info[i]);
      
      NSString* typeSpec = NJSStringToNSString(arg->Get(0));
      if (!typeSpec) {
        Nan::ThrowError("Nid::invokeMethod: expected first value of argument to be a string");
        return;
      }
      
      char type = [typeSpec UTF8String][0];
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
        case '@':
        {
          id value = nil;
          if (jsValue->IsExternal()) {
            value = (__bridge id)(jsValue.As<External>()->Value());
          } else if (jsValue->IsNullOrUndefined()) {
            value = nil;
          } else {
            bool failed = false;
            value = to_id(jsValue, &failed);
            if (failed) {
              Nan::ThrowError("id::invokeMethod: Failed to convert argument to id");
              return;
            }
          }
          [inv setArgument:(__bridge void*)value atIndex:1+i];
        } break;
        default:
        {
          Nan::ThrowError("id::invokeMethod: Unknown type specifier");
          return;
        } break;
      }
    }
    [inv invokeWithTarget:self];
    
    char returnType = [returnTypeSpec UTF8String][0];
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
      case '@':
      {
        void* value = nullptr;
        [inv getReturnValue:&value];
        Local<Value> argv[] = {
          Nan::New<External>(value)
        };
        JS_SET_RETURN(JS_NEW_ARGV(Nid, argv));
      } break;
      default:
      {
        Nan::ThrowError("id::invokeMethod: Unknown return type specifier");
        return;
      } break;
    }
  }
}

id Nid::set_self(id self) {
  _self = self;
  /*
  auto wrapper = objc_getAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"]);
  if (wrapper == nullptr) {
    Nan::Persistent<FunctionTemplate>** p = new Nan::Persistent<FunctionTemplate>*(&GetDerivedType());
    auto w = [NSObjectWrapper alloc];
    w.ptr = p;
    
    objc_setAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"], w, objc_AssociationPolicy::OBJC_ASSOCIATION_RETAIN);
    //[_NSObject assignAssociatedWrapperWithPtr:p forKey:@"sweetiekit.type"];
  }*/
  return _self;
}

NAN_GETTER(Nid::selfGetter) {
  JS_UNWRAP_(id, self);
  JS_SET_RETURN(Nan::New<External>((__bridge void*)self));
}

Nan::Persistent<FunctionTemplate> NNSObject::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSObject::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(NNSObject::New);

  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSObject"));
  ctor->Inherit(Nan::New(Nid::type));
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
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `NSObject(...)`, turn into construct call.
      JS_SET_RETURN_NEW(NSObject, info);
      return;
    }
    NSObject* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge NSObject *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSObject alloc] init];
    }
    if (self) {
      NNSObject *wrapper = new NNSObject();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSObject::New: invalid arguments");
    }
  }
}

#include "NNSUserDefaults.h"
#include "NNSMutableParagraphStyle.h"
#include "NNSParagraphStyle.h"
#include "NNSAttributedString.h"
#include "NNSMutableAttributedString.h"
#include "NUILabel.h"
#include "NUIFont.h"
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
#include "NUITabBar.h"
#include "NUIViewController.h"
#include "NUINavigationController.h"
#include "NUINavigationBar.h"
#include "NUINavigationItem.h"
#include "NUIImagePickerController.h"
#include "NUIImagePickerControllerDelegate.h"
#include "NUIViewControllerTransitioningDelegate.h"
#include "NUIPopoverPresentationControllerDelegate.h"
#include "NUIPopoverPresentationController.h"
#include "NUITableViewController.h"
#include "NUITableView.h"
#include "NUITableViewCell.h"
#include "NUIPickerView.h"
#include "NUIPickerViewManager.h"
#include "NUICollectionReusableView.h"
#include "NUICollectionView.h"
#include "NUICollectionViewController.h"
#include "NUICollectionViewCell.h"
#include "NUICollectionViewManager.h"
#include "NUITableViewDataSource.h"
#include "NUIPageControl.h"
#include "NUIProgressView.h"
#include "NCALayer.h"
#include "NCAEmitterLayer.h"
#include "NCAEmitterCell.h"
#include "NCABasicAnimation.h"
#include "NCAShapeLayer.h"
#include "NUIPresentationController.h"
#include "NUIAlertController.h"
#include "NUIAlertAction.h"
#include "NUIScrollView.h"
#include "NUIScrollViewDelegate.h"
#include "NUIStackView.h"
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
#include "NSKTexture.h"
#include "NSKTransformNode.h"
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
#include "NSCNMaterial.h"
#include "NSCNBox.h"
#include "NSCNCapsule.h"
#include "NSCNCone.h"
#include "NSCNCylinder.h"
#include "NSCNPlane.h"
#include "NSCNPyramid.h"
#include "NSCNSphere.h"
#include "NSCNTorus.h"
#include "NSCNTube.h"
#include "NSCNFloor.h"
#include "NSCNGeometry.h"
#include "NSCNText.h"
#include "NSCNShape.h"
#include "NSKScene.h"
#include "NSKSpriteNode.h"
#include "NSKCameraNode.h"
#include "NSKEmitterNode.h"
#include "NCLLocationManager.h"
#include "NCLLocationManagerDelegate.h"
#include "NCLLocation.h"
#include "NCLGeocoder.h"
#include "NCLPlacemark.h"
#include "NCLHeading.h"
#include "NMKMapView.h"
#include "NMKMapViewDelegate.h"
#include "NMKAnnotationView.h"
#include "NUINib.h"
#include "NGif.h"
#include "NGifView.h"
#include "NGifManager.h"
#include "NUIKitGlobals.h"
#include "NCoreGraphicsGlobals.h"
#include "NRPScreenRecorder.h"
#include "NRPPreviewViewController.h"
#include "NRPPreviewViewControllerDelegate.h"
#include "NCIImage.h"

#define JS_EXPORT_TYPE_AS(type, name) \
        auto N_##type = N##type::Initialize(Isolate::GetCurrent()); \
        exports->Set(Nan::New(name).ToLocalChecked(), N_##type.first)

#define JS_EXPORT_TYPE(type) \
        JS_EXPORT_TYPE_AS(type, #type)

void NNSObject::RegisterTypes(Local<Object> exports) {
    JS_EXPORT_TYPE(id);
    JS_EXPORT_TYPE(NSObject);
    JS_EXPORT_TYPE(NSBundle);
    JS_EXPORT_TYPE(AVAudioPlayer);
    JS_EXPORT_TYPE(NSUserDefaults);
    JS_EXPORT_TYPE(NSLayoutAnchor);
    JS_EXPORT_TYPE(NSLayoutConstraint);
    JS_EXPORT_TYPE(UIBarButtonItem);
    JS_EXPORT_TYPE(UITabBarItem);
    JS_EXPORT_TYPE(UIAlertAction);
    JS_EXPORT_TYPE(NSParagraphStyle);
    JS_EXPORT_TYPE(NSMutableParagraphStyle);
    JS_EXPORT_TYPE(NSAttributedString);
    JS_EXPORT_TYPE(NSMutableAttributedString);
    JS_EXPORT_TYPE(RPScreenRecorder);

    // Core Location
    JS_EXPORT_TYPE(CLHeading);
    JS_EXPORT_TYPE(CLLocation);
    JS_EXPORT_TYPE(CLLocationManager);
    JS_EXPORT_TYPE(CLLocationManagerDelegate);
    JS_EXPORT_TYPE(CLGeocoder);
    JS_EXPORT_TYPE(CLPlacemark);

    // UIKit
    JS_EXPORT_TYPE(UIApplication);
    JS_EXPORT_TYPE(UIWindow);
    JS_EXPORT_TYPE(UIResponder);
    JS_EXPORT_TYPE(UIViewController);
    JS_EXPORT_TYPE(RPPreviewViewController);
    JS_EXPORT_TYPE(UITabBarController);
    JS_EXPORT_TYPE(UITableViewController);
    JS_EXPORT_TYPE(UICollectionViewController);
    JS_EXPORT_TYPE(UINavigationController);
    JS_EXPORT_TYPE(UIImagePickerController);
    JS_EXPORT_TYPE(UIPresentationController);
    JS_EXPORT_TYPE(UIPopoverPresentationController);
    JS_EXPORT_TYPE(UIAlertController);
    JS_EXPORT_TYPE(UIView);
    JS_EXPORT_TYPE(UICollectionReusableView);
    JS_EXPORT_TYPE(UIControl);
    JS_EXPORT_TYPE(UISlider);
    JS_EXPORT_TYPE(UIRefreshControl);
    JS_EXPORT_TYPE(UISwitch);
    JS_EXPORT_TYPE(UIStoryboard);
    JS_EXPORT_TYPE(UIButton);
    JS_EXPORT_TYPE(UITextField);
    JS_EXPORT_TYPE(UIImage);
    JS_EXPORT_TYPE(UIImageView);
    JS_EXPORT_TYPE(UIFont);
    JS_EXPORT_TYPE(UILabel);
    JS_EXPORT_TYPE(UITableViewCell);
    JS_EXPORT_TYPE(UIScrollView);
    JS_EXPORT_TYPE(UITableView);
    JS_EXPORT_TYPE(UICollectionView);
    JS_EXPORT_TYPE(UICollectionViewCell);
    JS_EXPORT_TYPE(UITableViewManager);
    JS_EXPORT_TYPE(UICollectionViewManager);
    JS_EXPORT_TYPE(UINib);
    JS_EXPORT_TYPE(UITouch);
    JS_EXPORT_TYPE(UIPageControl);
    JS_EXPORT_TYPE(UIPickerView);
    JS_EXPORT_TYPE(UIProgressView);
    JS_EXPORT_TYPE(UITabBar);
    JS_EXPORT_TYPE(UIStackView);

    // UIKit delegates
    JS_EXPORT_TYPE(RPPreviewViewControllerDelegate);
    JS_EXPORT_TYPE(UIPopoverPresentationControllerDelegate);
    JS_EXPORT_TYPE(UIPickerViewManager);
    JS_EXPORT_TYPE(UIScrollViewDelegate);
    JS_EXPORT_TYPE(UIImagePickerControllerDelegate);
    JS_EXPORT_TYPE(UITableViewDataSource);
    JS_EXPORT_TYPE(UIViewControllerTransitioningDelegate);
    JS_EXPORT_TYPE(UINavigationBar);
    JS_EXPORT_TYPE(UINavigationItem);

    // UIKit Custom
    JS_EXPORT_TYPE(GifManager);
    JS_EXPORT_TYPE(Gif);
    JS_EXPORT_TYPE(GifView);

    // CoreAnimation
    JS_EXPORT_TYPE(CALayer);
    JS_EXPORT_TYPE(CAShapeLayer);
    JS_EXPORT_TYPE(CABasicAnimation);
    JS_EXPORT_TYPE(CAEmitterCell);
    JS_EXPORT_TYPE(CAEmitterLayer);

    // SpriteKit
    JS_EXPORT_TYPE(SKPhysicsContact);
    JS_EXPORT_TYPE(SKView);
    JS_EXPORT_TYPE(SKPhysicsBody);
    JS_EXPORT_TYPE(SKNode);
    JS_EXPORT_TYPE(SKTransformNode);
    JS_EXPORT_TYPE(SKEmitterNode);
    JS_EXPORT_TYPE(SKSpriteNode);
    JS_EXPORT_TYPE(SKLabelNode);
    JS_EXPORT_TYPE(SKCameraNode);
    JS_EXPORT_TYPE(SKScene);
    JS_EXPORT_TYPE(SKAction);
    JS_EXPORT_TYPE(SKTexture);
    JS_EXPORT_TYPE(SKPhysicsWorld);
    JS_EXPORT_TYPE(SKPhysicsContactDelegate);

    // ARKit
    JS_EXPORT_TYPE(ARLightEstimate);
    JS_EXPORT_TYPE(ARSKView);
    JS_EXPORT_TYPE(ARSession);
    JS_EXPORT_TYPE(ARConfiguration);
    JS_EXPORT_TYPE(ARWorldTrackingConfiguration);
    JS_EXPORT_TYPE(ARCamera);
    JS_EXPORT_TYPE(ARFrame);
    JS_EXPORT_TYPE(ARAnchor);
    JS_EXPORT_TYPE(ARSKViewDelegate);
    JS_EXPORT_TYPE(ARSCNViewDelegate);

    // SceneKit
    JS_EXPORT_TYPE(SCNMaterial);
    JS_EXPORT_TYPE(SCNGeometry);
    JS_EXPORT_TYPE(SCNBox);
    JS_EXPORT_TYPE(SCNCapsule);
    JS_EXPORT_TYPE(SCNCone);
    JS_EXPORT_TYPE(SCNCylinder);
    JS_EXPORT_TYPE(SCNFloor);
    JS_EXPORT_TYPE(SCNPlane);
    JS_EXPORT_TYPE(SCNPyramid);
    JS_EXPORT_TYPE(SCNSphere);
    JS_EXPORT_TYPE(SCNTorus);
    JS_EXPORT_TYPE(SCNTube);
    JS_EXPORT_TYPE(SCNText);
    JS_EXPORT_TYPE(SCNShape);
    JS_EXPORT_TYPE(SCNNode);
    JS_EXPORT_TYPE(SCNScene);
    JS_EXPORT_TYPE(SCNView);
    JS_EXPORT_TYPE(ARSCNView);
    JS_EXPORT_TYPE(SCNLight);

    // MapKit
    JS_EXPORT_TYPE(MKMapView);
    JS_EXPORT_TYPE(MKAnnotationView);
    JS_EXPORT_TYPE(MKMapViewDelegate);

    // core image
    JS_EXPORT_TYPE(CIImage);

    // misc
    JS_EXPORT_TYPE(CoreGraphicsGlobals);
    JS_EXPORT_TYPE_AS(UIKitGlobals, "UIKit");
}

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
    
#define JS_RETURN_TYPE(Type) \
      if ([obj isKindOfClass:[Type class]]) { \
        return N##Type::type; \
      }
    
      // ========= core animation
      if ([obj isKindOfClass:[CAEmitterCell class]]) {
        return NCAEmitterCell::type;
      }
      if ([obj isKindOfClass:[CAEmitterLayer class]]) {
        return NCAEmitterLayer::type;
      }
      if ([obj isKindOfClass:[CAShapeLayer class]]) {
        return NCAShapeLayer::type;
      }
      if ([obj isKindOfClass:[CALayer class]]) {
        return NCALayer::type;
      }
      if ([obj isKindOfClass:[CABasicAnimation class]]) {
        return NCABasicAnimation::type;
      }
      
      // ========= core image

       if ([obj isKindOfClass:[CIImage class]]) {
        return NCIImage::type;
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
      JS_RETURN_TYPE(SCNText);
      JS_RETURN_TYPE(SCNMaterial);
      JS_RETURN_TYPE(SCNBox);
      JS_RETURN_TYPE(SCNCapsule);
      JS_RETURN_TYPE(SCNCone);
      JS_RETURN_TYPE(SCNCylinder);
      JS_RETURN_TYPE(SCNFloor);
      JS_RETURN_TYPE(SCNPlane);
      JS_RETURN_TYPE(SCNPyramid);
      JS_RETURN_TYPE(SCNSphere);
      JS_RETURN_TYPE(SCNTorus);
      JS_RETURN_TYPE(SCNTube);
      JS_RETURN_TYPE(SCNText);
      JS_RETURN_TYPE(SCNShape);
      JS_RETURN_TYPE(SCNGeometry);
      JS_RETURN_TYPE(SCNLight);
      JS_RETURN_TYPE(SCNScene);
      JS_RETURN_TYPE(SCNNode);
      JS_RETURN_TYPE(SCNView);
      
      // SpriteKit
      
      if ([obj isKindOfClass:[SKTexture class]]) {
        return NSKTexture::type;
      }
      if ([obj isKindOfClass:[SKEmitterNode class]]) {
        return NSKEmitterNode::type;
      }
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
      if ([obj isKindOfClass:[SKTransformNode class]]) {
        return NSKTransformNode::type;
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
      if ([obj isKindOfClass:[UIStackView class]]) {
        return NUIStackView::type;
      }
      if ([obj isKindOfClass:[UITabBar class]]) {
        return NUITabBar::type;
      }
      if ([obj isKindOfClass:[UIProgressView class]]) {
        return NUIProgressView::type;
      }
      if ([obj isKindOfClass:[UIPickerView class]]) {
        return NUIPickerView::type;
      }
      if ([obj isKindOfClass:[UINavigationItem class]]) {
        return NUINavigationItem::type;
      }
      if ([obj isKindOfClass:[UINavigationBar class]]) {
        return NUINavigationBar::type;
      }
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
      if ([obj isKindOfClass:[UIFont class]]) {
        return NUIFont::type;
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

      if ([obj isKindOfClass:[RPPreviewViewController class]]) {
        return NRPPreviewViewController::type;
      }
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
      if ([obj isKindOfClass:[UIPopoverPresentationController class]]) {
        return NUIPopoverPresentationController::type;
      }
      if ([obj isKindOfClass:[SUIPresentationController class]]) {
        return NUIPresentationController::type;
      }
      // ========= delegates
      if ([obj isKindOfClass:[SRPPreviewViewControllerDelegate class]]) {
        return NRPPreviewViewControllerDelegate::type;
      }
      if ([obj isKindOfClass:[SUIPopoverPresentationControllerDelegate class]]) {
        return NUIPopoverPresentationControllerDelegate::type;
      }
      if ([obj isKindOfClass:[SUIPickerViewManager class]]) {
        return NUIPickerViewManager::type;
      }
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
      if ([obj isKindOfClass:[CLGeocoder class]]) {
        return NCLGeocoder::type;
      }
      if ([obj isKindOfClass:[CLPlacemark class]]) {
        return NCLPlacemark::type;
      }
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
      if ([obj isKindOfClass:[RPScreenRecorder class]]) {
        return NRPScreenRecorder::type;
      }
      if ([obj isKindOfClass:[SUIKitGlobals class]]) {
        return NUIKitGlobals::type;
      }
      if ([obj isKindOfClass:[SCoreGraphicsGlobals class]]) {
        return NCoreGraphicsGlobals::type;
      }
      if ([obj isKindOfClass:[NSMutableAttributedString class]]) {
        return NNSMutableAttributedString::type;
      }
      if ([obj isKindOfClass:[NSAttributedString class]]) {
        return NNSAttributedString::type;
      }
      if ([obj isKindOfClass:[NSMutableParagraphStyle class]]) {
        return NNSMutableParagraphStyle::type;
      }
      if ([obj isKindOfClass:[NSParagraphStyle class]]) {
        return NNSParagraphStyle::type;
      }
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
      return Nid::type;
    }
  }
  return unset;
}
