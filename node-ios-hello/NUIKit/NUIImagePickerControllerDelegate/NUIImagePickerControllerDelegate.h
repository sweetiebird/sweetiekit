//
//  NUIImagePickerControllerDelegate.h
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImagePickerControllerDelegate_h
#define NUIImagePickerControllerDelegate_h

#include "NNSObject.h"

#define js_value_UIImagePickerControllerDelegate(x) js_value_wrapper(x, UIImagePickerControllerDelegate)
#define to_value_UIImagePickerControllerDelegate(x) to_value_wrapper(x, UIImagePickerControllerDelegate)
#define is_value_UIImagePickerControllerDelegate(x) is_value_wrapper(x, UIImagePickerControllerDelegate)

JS_WRAP_CLASS(UIImagePickerControllerDelegate, NSObject);
  JS_PROP(imagePickerControllerDidFinishPickingImageEditingInfo);
  JS_PROP(imagePickerControllerDidFinishPickingMediaWithInfo);
  JS_PROP(imagePickerControllerDidCancel);
JS_WRAP_CLASS_END(UIImagePickerControllerDelegate);

#ifdef __OBJC__
@interface UIImagePickerControllerDelegate : NSObject<UIImagePickerControllerDelegate>
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<UIImagePickerControllerInfoKey, id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0);
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
@end
#endif

#endif /* NUIImagePickerControllerDelegate_h */
