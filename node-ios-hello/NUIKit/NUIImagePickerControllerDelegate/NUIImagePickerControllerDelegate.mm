//
//  NUIImagePickerControllerDelegate.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIImagePickerControllerDelegate.h"

NUIImagePickerControllerDelegate::NUIImagePickerControllerDelegate() { }
NUIImagePickerControllerDelegate::~NUIImagePickerControllerDelegate() { }

JS_INIT_CLASS(UIImagePickerControllerDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(imagePickerControllerDidFinishPickingImageEditingInfo);
  JS_ASSIGN_PROTO_PROP(imagePickerControllerDidFinishPickingMediaWithInfo);
  JS_ASSIGN_PROTO_PROP(imagePickerControllerDidCancel);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIImagePickerControllerDelegate, NSObject);
JS_INIT_CLASS_END(UIImagePickerControllerDelegate, NSObject);

NAN_METHOD(NUIImagePickerControllerDelegate::New) {
  JS_RECONSTRUCT(UIImagePickerControllerDelegate);
  @autoreleasepool {
    UIImagePickerControllerDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIImagePickerControllerDelegate *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIImagePickerControllerDelegate alloc] init];
    }
    if (self) {
      NUIImagePickerControllerDelegate *wrapper = new NUIImagePickerControllerDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIImagePickerControllerDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(UIImagePickerControllerDelegate, imagePickerControllerDidFinishPickingImageEditingInfo);
DELEGATE_PROP(UIImagePickerControllerDelegate, imagePickerControllerDidFinishPickingMediaWithInfo);
DELEGATE_PROP(UIImagePickerControllerDelegate, imagePickerControllerDidCancel);

#include "NUIImagePickerController.h"
#include "NUIImage.h"

@implementation UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<UIImagePickerControllerInfoKey, id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0)
{
  call_delegate_async(noop(), imagePickerControllerDidFinishPickingImageEditingInfo,
    js_value_UIImagePickerController(picker),
    js_value_UIImage(image),
    js_value_NSDictionary(editingInfo));
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{
  call_delegate_async(noop(), imagePickerControllerDidFinishPickingMediaWithInfo,
    js_value_UIImagePickerController(picker),
    js_value_NSDictionary(info));
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
  call_delegate_async(noop(), imagePickerControllerDidCancel,
    js_value_UIImagePickerController(picker));
}
@end
