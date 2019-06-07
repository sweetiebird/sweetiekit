//
//  NNSObject.m
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

Nid::Nid() : _self(nullptr) {}
Nid::~Nid() {}

JS_INIT_CLASS_BASE(id);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, self);
  JS_ASSIGN_PROP_READONLY(proto, selfPointer);
  JS_ASSIGN_PROP_READONLY(proto, selfAddress);
  JS_ASSIGN_PROP_READONLY(proto, class);
  JS_ASSIGN_PROP_READONLY(proto, superclass);
  JS_ASSIGN_PROP_READONLY(proto, metaclass);
  JS_ASSIGN_PROP_READONLY(proto, className);
  JS_ASSIGN_PROP_READONLY(proto, description);
  JS_ASSIGN_PROP_READONLY(proto, debugDescription);
  JS_ASSIGN_PROP_READONLY(proto, methods);
  JS_ASSIGN_PROP_READONLY(proto, properties);
  JS_ASSIGN_METHOD(proto, invokeBooleanGetter);
  JS_ASSIGN_METHOD(proto, invokeBooleanSetter);
  JS_ASSIGN_METHOD(proto, invoke);
  // static members (ctor)
  JS_INIT_CTOR(id, objc);
  Nan::SetMethod(ctor, "NSClassFromString", _NSClassFromString);
  Nan::SetMethod(ctor, "objc_msgSend", _objc_msgSend);
  sweetiekit::Set(ctor, "classFromString", ^(JSInfo info) {
    Nan::HandleScope scope;
    Class cls = NSClassFromString(NJSStringToNSString(info[0]));
    JS_SET_RETURN(sweetiekit::GetWrapperFor(cls, NNSObject::type));
  });
  sweetiekit::Set(ctor, "metaclassFromString", ^(JSInfo info) {
    Nan::HandleScope scope;
    Class cls = NSClassFromString(NJSStringToNSString(info[0]));
    if (cls != nullptr) {
      cls = object_getClass(cls);
      JS_SET_RETURN(sweetiekit::GetWrapperFor(cls, NNSObject::type));
    }
  });
  sweetiekit::Set(ctor, "stringFromClass", ^(JSInfo info) {
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
JS_INIT_CLASS_END(id, objc);

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

class JS_FREE_STR {
public:
  JS_FREE_STR(char* str) : _str(str) {}
  virtual ~JS_FREE_STR() { free(_str); }
  operator Local<Value>() { return JS_STR(_str); }
  char* _str;
};

NAN_GETTER(Nid::methodsGetter) {
  JS_UNWRAP_(id, ns);
  @autoreleasepool {
    if (!object_isClass(ns)) {
      Nan::ThrowError("id:methods: not a class");
      return;
    }
    Class cls = nns->AsClass();
    
    Local<Array> result = Nan::New<Array>();
    __block unsigned int n = 0;
    sweetiekit::forEachMethodInClass(cls, ^(Method m) {
      Local<Object> obj = Nan::New<Object>();
      auto argc = method_getNumberOfArguments(m);
      obj->Set(JS_STR("name"), JS_STR([NSStringFromSelector(method_getName(m)) UTF8String]));
      obj->Set(JS_STR("returnType"), JS_FREE_STR(method_copyReturnType(m)));
      Local<Array> argv = Nan::New<Array>();
      for (auto i = 0; i < argc; i++) {
        argv->Set(i, JS_FREE_STR(method_copyArgumentType(m, i)));
      }
      obj->Set(JS_STR("arguments"), argv);
      obj->Set(JS_STR("typeEncoding"), JS_STR(method_getTypeEncoding(m)));
      result->Set(n, obj);
      n++;
    });
    JS_SET_RETURN(result);
  }
}

NAN_GETTER(Nid::propertiesGetter) {
  JS_UNWRAP_(id, ns);
  @autoreleasepool {
    if (!object_isClass(ns)) {
      Nan::ThrowError("id:properties: not a class");
      return;
    }
    Class cls = nns->AsClass();
    
    Local<Array> result = Nan::New<Array>();
    __block unsigned int n = 0;
    sweetiekit::forEachPropertyInClass(cls, ^(objc_property_t p) {
      Local<Object> obj = Nan::New<Object>();
      obj->Set(JS_STR("name"), JS_STR(property_getName(p)));
      obj->Set(JS_STR("attributes"), JS_STR(property_getAttributes(p)));
      result->Set(n, obj);
      n++;
    });
    JS_SET_RETURN(result);
  }
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

NAN_METHOD(Nid::invoke)
{
  Nan::HandleScope scope;
  
  JS_UNWRAP_(id, self);
  @autoreleasepool {
    if (!self) {
      Nan::ThrowError("Nid::invoke: self is nil");
      return;
    }
    
    if (!info[0]->IsArray()) {
      Nan::ThrowError("Nid::invoke: expected first argument to be an array");
      return;
    }
    
    Local<Array> spec = Local<Array>::Cast(info[0]);
    
    NSString* returnTypeSpec = NJSStringToNSString(spec->Get(0));
    if (!returnTypeSpec) {
      Nan::ThrowError("Nid::invoke: expected first value of first argument to be a string");
      return;
    }
    
    NSString* name = NJSStringToNSString(spec->Get(1));
    if (!name) {
      Nan::ThrowError("Nid::invoke: expected last value of first argument to be a string");
      return;
    }
    
    SEL sel = NSSelectorFromString(name);
    if (!sel) {
      Nan::ThrowError("Nid::invoke: NSSelectorFromString returned nil");
      return;
    }
    
    NSMethodSignature * sig = nullptr;
    if (object_isClass(self)) {
      sig = [self methodSignatureForSelector:sel];
      if (!sig) {
        Nan::ThrowError("Nid::invoke: [self methodSignatureForSelector:] returned nil");
        return;
      }
    } else {
      Class cls = [self class];
      if (!cls) {
        Nan::ThrowError("Nid::invoke: [self class] is nil");
        return;
      }
      sig = [cls instanceMethodSignatureForSelector:sel];
      if (!sig) {
        Nan::ThrowError("Nid::invoke: [[self class] instanceMethodSignatureForSelector:] returned nil");
        return;
      }
    }
    
    NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
    if (!inv) {
      Nan::ThrowError("Nid::invoke: [NSInvocation invocationWithMethodSignature:] returned nil");
      return;
    }
    
    [inv setSelector:sel];
    
    for (unsigned int i = 1; i < info.Length(); i++) {
      if (!info[i]->IsArray()) {
        Nan::ThrowError("Nid::invoke: expected argument to be an array");
        return;
      }
      Local<Array> arg = Local<Array>::Cast(info[i]);
      
      NSString* typeSpec = NJSStringToNSString(arg->Get(0));
      if (!typeSpec) {
        Nan::ThrowError("Nid::invoke: expected first value of argument to be a string");
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
        case 'I':
        {
          uint32_t value = TO_UINT32(jsValue);
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'd':
        {
          double value = TO_DOUBLE(jsValue);
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'f':
        {
          float value = TO_FLOAT(jsValue);
          [inv setArgument:&value atIndex:1+i];
        } break;
        case 'q':
        {
          double value = TO_DOUBLE(jsValue);
          long long value1 = (long long)value;
          [inv setArgument:&value1 atIndex:1+i];
        } break;
        case 'Q':
        {
          double value = TO_DOUBLE(jsValue);
          unsigned long long value1 = (unsigned long long)value;
          [inv setArgument:&value1 atIndex:1+i];
        } break;
        case '@':
        {
          bool failed = false;
          id value = to_id(jsValue, &failed);
          if (failed) {
            Nan::ThrowError("id::invoke: Failed to convert argument to id");
            return;
          }
          [inv setArgument:&value atIndex:1+i];
        } break;
        default:
        {
          Nan::ThrowError("id::invoke: Unknown type specifier");
          return;
        } break;
      }
    }
    [inv setTarget:self];
    [inv invoke];
    
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
      case 'I':
      {
        uint32_t value = 0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_UINT(value));
      } break;
      case 'd':
      {
        double value = 0.0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_NUM(value));
      } break;
      case 'f':
      {
        float value = 0.0f;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_FLOAT(value));
      } break;
      case 'q':
      {
        long long value = 0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_NUM(value));
      } break;
      case 'Q':
      {
        unsigned long long value = 0;
        [inv getReturnValue:&value];
        JS_SET_RETURN(JS_NUM(value));
      } break;
      case 'v':
      {
        // void
      } break;
      case 's':
      {
        void* value = nullptr;
        [inv getReturnValue:&value];
        if (value) {
          if (![(__bridge id)value isKindOfClass:[NSString class]]) {
            Nan::ThrowError("id::invoke: returned value was not an NSString");
            return;
          }
          JS_SET_RETURN(JS_STR([(__bridge NSString*)value UTF8String]));
        }
      } break;
      case '@':
      {
        __weak id value = nil;
        [inv getReturnValue:&value];
        JS_SET_RETURN(js_value_id(value));
      } break;
      default:
      {
        Nan::ThrowError("id::invoke: Unknown return type specifier");
        return;
      } break;
    }
  }
}

NAN_GETTER(Nid::selfGetter) {
  JS_SET_RETURN(info.This());
}

NAN_GETTER(Nid::selfPointerGetter) {
  JS_UNWRAP_(id, self);
  JS_SET_RETURN(Nan::New<External>((__bridge void*)self));
}

NAN_GETTER(Nid::selfAddressGetter) {
  JS_UNWRAP_(id, self);

  Local<Array> array = Nan::New<Array>(2);
  size_t address = (size_t)(__bridge void*)self;
  array->Set(0, Nan::New<Integer>((uint32_t)(address >> 32)));
  array->Set(1, Nan::New<Integer>((uint32_t)(address & 0xFFFFFFFF)));
  JS_SET_RETURN(array);
}

NNSObject::NNSObject() {}
NNSObject::~NNSObject() {}

JS_INIT_CLASS(NSObject, id);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSObject, id);
JS_INIT_CLASS_END(NSObject, id);

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

NClass::NClass() {}
NClass::~NClass() {}

JS_INIT_CLASS(Class, id);
  JS_INIT_CTOR(Class, id);
JS_INIT_CLASS_END(Class, id);

NAN_METHOD(NClass::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'Class(...)', turn into construct call.
      JS_SET_RETURN_NEW(Class, info);
      return;
    }

    Class self = nil;
    if (info[0]->IsExternal()) {
      self = (__bridge Class)(info[0].As<External>()->Value());
    }
    if (self) {
      NClass* wrapper = new NClass();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NClass::New: invalid arguments");
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
#include "NUIGraphicsRendererFormat.h"
#include "NUIGraphicsImageRendererFormat.h"
#include "NUIImageAsset.h"
#include "NUITraitCollection.h"
#include "NUIToolbar.h"
#include "NUIImage.h"
#include "NUIImageView.h"
#include "NUITextField.h"
#include "NUIStoryboard.h"
#include "NUITabBarController.h"
#include "NUITabBarItem.h"
#include "NUIBarButtonItem.h"
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
#include "NUIGestureRecognizer.h"
#include "NUITapGestureRecognizer.h"
#include "NNSLayoutAnchor.h"
#include "NNSLayoutConstraint.h"
#include "NNSLayoutDimension.h"
#include "NNSLayoutXAxisAnchor.h"
#include "NNSLayoutYAxisAnchor.h"
#include "NUIMotionEffect.h"
#include "NUILayoutGuide.h"
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
#include "NNSCoder.h"
#include "NNSURL.h"
#include "NNSBundle.h"
#include "NAVAudioPlayer.h"
#include "NARAnchor.h"
#include "NARFrame.h"
#include "NARCamera.h"
#include "NARSCNView.h"
#include "NARHitTestResult.h"
#include "NARLightEstimate.h"
#include "NARConfiguration.h"
#include "NARSCNViewDelegate.h"
#include "NSCNView.h"
#include "NSCNScene.h"
#include "NSCNNode.h"
#include "NSCNLight.h"
#include "NSCNMaterial.h"
#include "NSCNMaterialProperty.h"
#include "NSCNCamera.h"
#include "NSCNCameraController.h"
#include "NSCNPhysicsBody.h"
#include "NSCNHitTestResult.h"
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
        auto N_##type = N##type::Initialize(isolate, exports); \
        exports->Set(Nan::New(name).ToLocalChecked(), N_##type.first)

#define JS_EXPORT_TYPE(type) \
        JS_EXPORT_TYPE_AS(type, #type)

void NNSObject::RegisterTypes(Local<Object> exports) {
    Isolate* isolate = Isolate::GetCurrent();

    JS_EXPORT_TYPE(id);
    JS_EXPORT_TYPE(Class);
    JS_EXPORT_TYPE(NSObject);
    JS_EXPORT_TYPE(NSCoder);
    JS_EXPORT_TYPE(NSURL);
    JS_EXPORT_TYPE(NSBundle);
    JS_EXPORT_TYPE(NSUserDefaults);
    JS_EXPORT_TYPE(NSParagraphStyle);
    JS_EXPORT_TYPE(NSMutableParagraphStyle);
    JS_EXPORT_TYPE(NSAttributedString);
    JS_EXPORT_TYPE(NSMutableAttributedString);

    // UIKit
    JS_EXPORT_TYPE(UIGestureRecognizer);
    JS_EXPORT_TYPE(UITapGestureRecognizer);
    JS_EXPORT_TYPE(UIPinchGestureRecognizer);
    JS_EXPORT_TYPE(UIRotationGestureRecognizer);
    JS_EXPORT_TYPE(UISwipeGestureRecognizer);
    JS_EXPORT_TYPE(UIPanGestureRecognizer);
    JS_EXPORT_TYPE(UIScreenEdgePanGestureRecognizer);
    JS_EXPORT_TYPE(UILongPressGestureRecognizer);
    
    JS_EXPORT_TYPE(NSLayoutAnchor);
    JS_EXPORT_TYPE(NSLayoutConstraint);
    JS_EXPORT_TYPE(NSLayoutDimension);
    JS_EXPORT_TYPE(NSLayoutXAxisAnchor);
    JS_EXPORT_TYPE(NSLayoutYAxisAnchor);
    JS_EXPORT_TYPE(UIMotionEffect);
    JS_EXPORT_TYPE(UILayoutGuide);
    JS_EXPORT_TYPE(UIBarButtonItem);
    JS_EXPORT_TYPE(UITabBarItem);
    JS_EXPORT_TYPE(UIAlertAction);
    JS_EXPORT_TYPE(UIApplication);
    JS_EXPORT_TYPE(UIResponder);
    JS_EXPORT_TYPE(UIViewController);
    JS_EXPORT_TYPE(UITabBarController);
    JS_EXPORT_TYPE(UITableViewController);
    JS_EXPORT_TYPE(UICollectionViewController);
    JS_EXPORT_TYPE(UINavigationController);
    JS_EXPORT_TYPE(UIImagePickerController);
    JS_EXPORT_TYPE(UIPresentationController);
    JS_EXPORT_TYPE(UIPopoverPresentationController);
    JS_EXPORT_TYPE(UIAlertController);
    JS_EXPORT_TYPE(UIView);
    JS_EXPORT_TYPE(UIWindow);
    JS_EXPORT_TYPE(UICollectionReusableView);
    JS_EXPORT_TYPE(UIControl);
    JS_EXPORT_TYPE(UISlider);
    JS_EXPORT_TYPE(UIRefreshControl);
    JS_EXPORT_TYPE(UISwitch);
    JS_EXPORT_TYPE(UIStoryboard);
    JS_EXPORT_TYPE(UIButton);
    JS_EXPORT_TYPE(UITextField);
    
    JS_EXPORT_TYPE(UIGraphicsRendererFormat);
    JS_EXPORT_TYPE(UIGraphicsImageRendererFormat);
    JS_EXPORT_TYPE(UIImageAsset);
    JS_EXPORT_TYPE(UITraitCollection);
    JS_EXPORT_TYPE(UIToolbar);
    
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
    JS_EXPORT_TYPE_AS(UIKitGlobals, "UIKit");
    
    // Core Graphics
    JS_EXPORT_TYPE_AS(CoreGraphicsGlobals, "CoreGraphics");

    // UIKit delegates
    JS_EXPORT_TYPE(UIPopoverPresentationControllerDelegate);
    JS_EXPORT_TYPE(UIPickerViewManager);
    JS_EXPORT_TYPE(UIScrollViewDelegate);
    JS_EXPORT_TYPE(UIImagePickerControllerDelegate);
    JS_EXPORT_TYPE(UITableViewDataSource);
    JS_EXPORT_TYPE(UIViewControllerTransitioningDelegate);
    JS_EXPORT_TYPE(UINavigationBar);
    JS_EXPORT_TYPE(UINavigationItem);
    
    // AVFoundation
    JS_EXPORT_TYPE(AVAudioPlayer);

    // Core Location
    JS_EXPORT_TYPE(CLHeading);
    JS_EXPORT_TYPE(CLLocation);
    JS_EXPORT_TYPE(CLLocationManager);
    JS_EXPORT_TYPE(CLLocationManagerDelegate);
    JS_EXPORT_TYPE(CLGeocoder);
    JS_EXPORT_TYPE(CLPlacemark);
    
    // ReplayKit
    JS_EXPORT_TYPE(RPScreenRecorder);
    JS_EXPORT_TYPE(RPPreviewViewController);
    JS_EXPORT_TYPE(RPPreviewViewControllerDelegate);

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

    // SceneKit
    JS_EXPORT_TYPE(SCNCamera);
    JS_EXPORT_TYPE(SCNCameraController);
    JS_EXPORT_TYPE(SCNMaterialProperty);
    JS_EXPORT_TYPE(SCNMaterial);
    JS_EXPORT_TYPE(SCNPhysicsBody);
    JS_EXPORT_TYPE(SCNHitTestResult);
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
    JS_EXPORT_TYPE(SCNLight);

    // ARKit
    JS_EXPORT_TYPE(ARLightEstimate);
    JS_EXPORT_TYPE(ARSKView);
    JS_EXPORT_TYPE(ARSCNView);
    JS_EXPORT_TYPE(ARHitTestResult);
    JS_EXPORT_TYPE(ARSession);
    JS_EXPORT_TYPE(ARConfiguration);
    JS_EXPORT_TYPE(ARWorldTrackingConfiguration);
    JS_EXPORT_TYPE(ARCamera);
    JS_EXPORT_TYPE(ARFrame);
    JS_EXPORT_TYPE(ARAnchor);
    JS_EXPORT_TYPE(ARSKViewDelegate);
    JS_EXPORT_TYPE(ARSCNViewDelegate);

    // MapKit
    JS_EXPORT_TYPE(MKMapView);
    JS_EXPORT_TYPE(MKAnnotationView);
    JS_EXPORT_TYPE(MKMapViewDelegate);

    // core image
    JS_EXPORT_TYPE(CIImage);
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
    
#define JS_RETURN_TYPE_FROM(Type, ObjcType) \
      if ([obj isKindOfClass:[ObjcType class]]) { \
        return N##Type::type; \
      }
    
#define JS_RETURN_TYPE(Type) \
      JS_RETURN_TYPE_FROM(Type, Type)
    
      // Core Animation
      JS_RETURN_TYPE(CAEmitterCell);
      JS_RETURN_TYPE(CAEmitterLayer);
      JS_RETURN_TYPE(CAShapeLayer);
      JS_RETURN_TYPE(CALayer);
      JS_RETURN_TYPE(CABasicAnimation);
      
      // Core Image
      
      JS_RETURN_TYPE(CIImage);

      // MapKit
      
      JS_RETURN_TYPE(MKMapView);
      JS_RETURN_TYPE(MKAnnotationView);
      JS_RETURN_TYPE_FROM(MKMapViewDelegate, SMKMapViewDelegate);

      // ARKit

      JS_RETURN_TYPE(ARLightEstimate);
      JS_RETURN_TYPE(ARCamera);
      JS_RETURN_TYPE(ARFrame);
      JS_RETURN_TYPE_FROM(ARSKViewDelegate, SARSKViewDelegate);
      JS_RETURN_TYPE(ARAnchor);
      JS_RETURN_TYPE(ARSKView);
      JS_RETURN_TYPE(ARSCNView);
      JS_RETURN_TYPE(ARHitTestResult);
      JS_RETURN_TYPE(ARSession);
      JS_RETURN_TYPE(ARWorldTrackingConfiguration);
      JS_RETURN_TYPE(ARConfiguration);

      //SceneKit
      
      JS_RETURN_TYPE(SCNMaterial);
      JS_RETURN_TYPE(SCNMaterialProperty);
      JS_RETURN_TYPE(SCNCamera);
      JS_RETURN_TYPE(SCNCameraController);
      JS_RETURN_TYPE(SCNPhysicsBody);
      JS_RETURN_TYPE(SCNHitTestResult);
      JS_RETURN_TYPE(SCNBox);
      JS_RETURN_TYPE(SCNCapsule);
      JS_RETURN_TYPE(SCNCone);
      JS_RETURN_TYPE(SCNCylinder);
      JS_RETURN_TYPE(SCNFloor);
      JS_RETURN_TYPE(SCNPlane);
      JS_RETURN_TYPE(SCNPyramid);
      JS_RETURN_TYPE(SCNSphere);
      JS_RETURN_TYPE(SCNText);
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
      
      JS_RETURN_TYPE(SKTexture);
      JS_RETURN_TYPE(SKEmitterNode);
      JS_RETURN_TYPE(SKCameraNode);
      JS_RETURN_TYPE(SKPhysicsWorld);
      JS_RETURN_TYPE(SKPhysicsContact);
      if ([NSStringFromClass([obj class]) isEqual: @"PKPhysicsContact"]) {
        return NSKPhysicsContact::type;
      }
      JS_RETURN_TYPE_FROM(SKPhysicsContactDelegate, SSKPhysicsContactDelegate);
      JS_RETURN_TYPE(SKPhysicsWorld);
      JS_RETURN_TYPE(SKPhysicsBody);
      JS_RETURN_TYPE(SKSpriteNode);
      JS_RETURN_TYPE(SKScene);
      JS_RETURN_TYPE(SKLabelNode);
      JS_RETURN_TYPE(SKTransformNode);
      JS_RETURN_TYPE(SKNode);
      JS_RETURN_TYPE(SKView);
      JS_RETURN_TYPE(SKAction);

      // Custom UIKit

      JS_RETURN_TYPE(GifManager);
      JS_RETURN_TYPE(Gif);
      JS_RETURN_TYPE(GifView);

      // Core Location
      
      JS_RETURN_TYPE(CLGeocoder);
      JS_RETURN_TYPE(CLPlacemark);
      JS_RETURN_TYPE(CLLocation);
      JS_RETURN_TYPE(CLHeading);
      JS_RETURN_TYPE(CLLocationManager);
      JS_RETURN_TYPE_FROM(CLLocationManagerDelegate, SCLLocationManagerDelegate);
      
      // ReplayKit
      
      JS_RETURN_TYPE_FROM(RPPreviewViewControllerDelegate, SRPPreviewViewControllerDelegate);
      JS_RETURN_TYPE(RPScreenRecorder);
      JS_RETURN_TYPE(RPPreviewViewController);
      
      // AVFoundation
      
      JS_RETURN_TYPE(AVAudioPlayer);

      // UIKit
      
      // ======== controllers
      JS_RETURN_TYPE(UIAlertController);
      JS_RETURN_TYPE(UICollectionViewController);
      JS_RETURN_TYPE(UITableViewController);
      JS_RETURN_TYPE(UIImagePickerController);
      JS_RETURN_TYPE(UINavigationController);
      JS_RETURN_TYPE(UITabBarController);
      JS_RETURN_TYPE(UIViewController);
      JS_RETURN_TYPE(UIPopoverPresentationController);
      JS_RETURN_TYPE(UIPresentationController);
      // ========= views
      JS_RETURN_TYPE(UIStackView);
      JS_RETURN_TYPE(UITabBar);
      JS_RETURN_TYPE(UIProgressView);
      JS_RETURN_TYPE(UIPickerView);
      JS_RETURN_TYPE(UINavigationItem);
      JS_RETURN_TYPE(UINavigationBar);
      JS_RETURN_TYPE(UIPageControl);
      JS_RETURN_TYPE(UISlider);
      JS_RETURN_TYPE(UICollectionViewCell);
      JS_RETURN_TYPE(UICollectionReusableView);
      JS_RETURN_TYPE(UICollectionView);
      JS_RETURN_TYPE(UITableView);
      JS_RETURN_TYPE(UIScrollView);
      JS_RETURN_TYPE(UITableViewCell);
      JS_RETURN_TYPE(UILabel);
      JS_RETURN_TYPE(UIFont);
      JS_RETURN_TYPE(UIButton);
    
      JS_RETURN_TYPE(UIToolbar);
      JS_RETURN_TYPE(UITraitCollection);
      JS_RETURN_TYPE(UIImageAsset);
      JS_RETURN_TYPE(UIGraphicsImageRendererFormat);
      JS_RETURN_TYPE(UIGraphicsRendererFormat);
      
      JS_RETURN_TYPE(UIImage);
      JS_RETURN_TYPE(UIImageView);
      JS_RETURN_TYPE(UIStoryboard);
      JS_RETURN_TYPE(UITextField);
      JS_RETURN_TYPE(UISwitch);
      JS_RETURN_TYPE(UIRefreshControl);
      JS_RETURN_TYPE(UIControl);
      JS_RETURN_TYPE(UIWindow);
      JS_RETURN_TYPE(UIView);
      JS_RETURN_TYPE(UITabBarItem);
      JS_RETURN_TYPE(UIBarButtonItem);
      // ========= delegates
      JS_RETURN_TYPE_FROM(UIPopoverPresentationControllerDelegate, SUIPopoverPresentationControllerDelegate);
      JS_RETURN_TYPE_FROM(UIPickerViewManager, SUIPickerViewManager);
      JS_RETURN_TYPE_FROM(UIScrollViewDelegate, SUIScrollViewDelegate);
      JS_RETURN_TYPE_FROM(UICollectionViewManager, SUICollectionViewManager);
      JS_RETURN_TYPE_FROM(UITableViewManager, SUITableViewManager);
      JS_RETURN_TYPE_FROM(UIImagePickerControllerDelegate, SUIImagePickerControllerDelegate);
      JS_RETURN_TYPE_FROM(UITableViewDataSource, SUITableViewDataSource);
      JS_RETURN_TYPE_FROM(UIViewControllerTransitioningDelegate, SUIViewControllerTransitioningDelegate);
      // ========= objects
      JS_RETURN_TYPE(NSLayoutYAxisAnchor);
      JS_RETURN_TYPE(NSLayoutXAxisAnchor);
      JS_RETURN_TYPE(NSLayoutDimension);
      JS_RETURN_TYPE(NSLayoutConstraint);
      JS_RETURN_TYPE(NSLayoutAnchor);
            
      JS_RETURN_TYPE(UILongPressGestureRecognizer);
      JS_RETURN_TYPE(UIScreenEdgePanGestureRecognizer);
      JS_RETURN_TYPE(UIPanGestureRecognizer);
      JS_RETURN_TYPE(UISwipeGestureRecognizer);
      JS_RETURN_TYPE(UIRotationGestureRecognizer);
      JS_RETURN_TYPE(UIPinchGestureRecognizer);
      JS_RETURN_TYPE(UITapGestureRecognizer);
      JS_RETURN_TYPE(UIGestureRecognizer);

      JS_RETURN_TYPE(UIMotionEffect);
      JS_RETURN_TYPE(UILayoutGuide);
      JS_RETURN_TYPE(UIApplication);
      JS_RETURN_TYPE(UITouch);
      JS_RETURN_TYPE(UIResponder);
      JS_RETURN_TYPE(UIAlertAction);
      JS_RETURN_TYPE(UINib);
      
      // Globals
      
      JS_RETURN_TYPE_FROM(UIKitGlobals, SUIKitGlobals);
      JS_RETURN_TYPE_FROM(CoreGraphicsGlobals, SCoreGraphicsGlobals);

      // Objects
      
      JS_RETURN_TYPE(NSMutableAttributedString);
      JS_RETURN_TYPE(NSAttributedString);
      JS_RETURN_TYPE(NSMutableParagraphStyle);
      JS_RETURN_TYPE(NSParagraphStyle);
      JS_RETURN_TYPE(NSBundle);
      JS_RETURN_TYPE(NSURL);
      JS_RETURN_TYPE(NSCoder);
      JS_RETURN_TYPE(NSUserDefaults);
      JS_RETURN_TYPE(NSObject);
      return Nid::type;
    }
  }
  return unset;
}
