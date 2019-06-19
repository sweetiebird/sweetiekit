//
//  NUIImagePickerController.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIImagePickerController.h"

NUIImagePickerController::NUIImagePickerController() {}
NUIImagePickerController::~NUIImagePickerController() {}

JS_INIT_CLASS(UIImagePickerController, UINavigationController);
  JS_ASSIGN_STATIC_METHOD(isSourceTypeAvailable);
  JS_ASSIGN_STATIC_METHOD(availableMediaTypesForSourceType);
  JS_ASSIGN_STATIC_METHOD(isCameraDeviceAvailable);
  JS_ASSIGN_STATIC_METHOD(isFlashAvailableForCameraDevice);
  JS_ASSIGN_STATIC_METHOD(availableCaptureModesForCameraDevice);
  JS_ASSIGN_PROTO_METHOD(takePicture);
  JS_ASSIGN_PROTO_METHOD(startVideoCapture);
  JS_ASSIGN_PROTO_METHOD(stopVideoCapture);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(sourceType);
  JS_ASSIGN_PROTO_PROP(mediaTypes);
  JS_ASSIGN_PROTO_PROP(allowsEditing);
  JS_ASSIGN_PROTO_PROP(allowsImageEditing);
  JS_ASSIGN_PROTO_PROP(imageExportPreset);
  JS_ASSIGN_PROTO_PROP(videoMaximumDuration);
  JS_ASSIGN_PROTO_PROP(videoQuality);
  JS_ASSIGN_PROTO_PROP(videoExportPreset);
  JS_ASSIGN_PROTO_PROP(showsCameraControls);
  JS_ASSIGN_PROTO_PROP(cameraOverlayView);
  JS_ASSIGN_PROTO_PROP(cameraViewTransform);
  JS_ASSIGN_PROTO_PROP(cameraCaptureMode);
  JS_ASSIGN_PROTO_PROP(cameraDevice);
  JS_ASSIGN_PROTO_PROP(cameraFlashMode);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIImagePickerController, UINavigationController);
  // constants (exports)

  //typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) {
    JS_ASSIGN_ENUM(UIImagePickerControllerSourceTypePhotoLibrary, NSInteger);
    JS_ASSIGN_ENUM(UIImagePickerControllerSourceTypeCamera, NSInteger);
    JS_ASSIGN_ENUM(UIImagePickerControllerSourceTypeSavedPhotosAlbum, NSInteger);
  //} __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, UIImagePickerControllerQualityType) {
    JS_ASSIGN_ENUM(UIImagePickerControllerQualityTypeHigh, NSInteger); // = 0,       
    JS_ASSIGN_ENUM(UIImagePickerControllerQualityTypeMedium, NSInteger); // = 1,     
    JS_ASSIGN_ENUM(UIImagePickerControllerQualityTypeLow, NSInteger); // = 2,         
    JS_ASSIGN_ENUM(UIImagePickerControllerQualityType640x480, NSInteger); // NS_ENUM_AVAILABLE_IOS(4_0) = 3,    
    JS_ASSIGN_ENUM(UIImagePickerControllerQualityTypeIFrame1280x720, NSInteger); // NS_ENUM_AVAILABLE_IOS(5_0) = 4,
    JS_ASSIGN_ENUM(UIImagePickerControllerQualityTypeIFrame960x540, NSInteger); // NS_ENUM_AVAILABLE_IOS(5_0) = 5,
  //} __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, UIImagePickerControllerCameraCaptureMode) {
    JS_ASSIGN_ENUM(UIImagePickerControllerCameraCaptureModePhoto, NSInteger);
    JS_ASSIGN_ENUM(UIImagePickerControllerCameraCaptureModeVideo, NSInteger);
  //} __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, UIImagePickerControllerCameraDevice) {
    JS_ASSIGN_ENUM(UIImagePickerControllerCameraDeviceRear, NSInteger);
    JS_ASSIGN_ENUM(UIImagePickerControllerCameraDeviceFront, NSInteger);
  //} __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, UIImagePickerControllerCameraFlashMode) {
    JS_ASSIGN_ENUM(UIImagePickerControllerCameraFlashModeOff, NSInteger); //  = -1,
    JS_ASSIGN_ENUM(UIImagePickerControllerCameraFlashModeAuto, NSInteger); // = 0,
    JS_ASSIGN_ENUM(UIImagePickerControllerCameraFlashModeOn, NSInteger); //   = 1
  //} __TVOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, UIImagePickerControllerImageURLExportPreset) {
    JS_ASSIGN_ENUM(UIImagePickerControllerImageURLExportPresetCompatible, NSInteger); // = 0,
    JS_ASSIGN_ENUM(UIImagePickerControllerImageURLExportPresetCurrent, NSInteger);
  //} NS_AVAILABLE_IOS(11_0) __TVOS_PROHIBITED;

  //typedef NSString * UIImagePickerControllerInfoKey NS_TYPED_ENUM;

  JS_ASSIGN_ENUM(UIImagePickerControllerMediaType, UIImagePickerControllerInfoKey);
  JS_ASSIGN_ENUM(UIImagePickerControllerOriginalImage, UIImagePickerControllerInfoKey);
  JS_ASSIGN_ENUM(UIImagePickerControllerEditedImage, UIImagePickerControllerInfoKey);
  JS_ASSIGN_ENUM(UIImagePickerControllerCropRect, UIImagePickerControllerInfoKey);
  JS_ASSIGN_ENUM(UIImagePickerControllerMediaURL, UIImagePickerControllerInfoKey);
  JS_ASSIGN_ENUM(UIImagePickerControllerReferenceURL, UIImagePickerControllerInfoKey);
  JS_ASSIGN_ENUM(UIImagePickerControllerMediaMetadata, UIImagePickerControllerInfoKey);
  JS_ASSIGN_ENUM(UIImagePickerControllerLivePhoto, UIImagePickerControllerInfoKey);
  JS_ASSIGN_ENUM(UIImagePickerControllerPHAsset, UIImagePickerControllerInfoKey);
  JS_ASSIGN_ENUM(UIImagePickerControllerImageURL, UIImagePickerControllerInfoKey);

JS_INIT_CLASS_END(UIImagePickerController, UINavigationController);

NAN_METHOD(NUIImagePickerController::New) {
  JS_RECONSTRUCT(UIImagePickerController);
  @autoreleasepool {
    UIImagePickerController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIImagePickerController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIImagePickerController alloc] init];
    }
    if (self) {
      NUIImagePickerController *wrapper = new NUIImagePickerController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIImagePickerController::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIImagePickerController::isSourceTypeAvailable) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIImagePickerControllerSourceType, sourceType);
    JS_SET_RETURN(js_value_BOOL([UIImagePickerController isSourceTypeAvailable: sourceType]));
  }
}

NAN_METHOD(NUIImagePickerController::availableMediaTypesForSourceType) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIImagePickerControllerSourceType, sourceType);
    JS_SET_RETURN(js_value_NSArray<NSString*>([UIImagePickerController availableMediaTypesForSourceType: sourceType]));
  }
}

NAN_METHOD(NUIImagePickerController::isCameraDeviceAvailable) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIImagePickerControllerCameraDevice, cameraDevice);
    JS_SET_RETURN(js_value_BOOL([UIImagePickerController isCameraDeviceAvailable: cameraDevice]));
  }
}

NAN_METHOD(NUIImagePickerController::isFlashAvailableForCameraDevice) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIImagePickerControllerCameraDevice, cameraDevice);
    JS_SET_RETURN(js_value_BOOL([UIImagePickerController isFlashAvailableForCameraDevice: cameraDevice]));
  }
}

NAN_METHOD(NUIImagePickerController::availableCaptureModesForCameraDevice) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIImagePickerControllerCameraDevice, cameraDevice);
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([UIImagePickerController availableCaptureModesForCameraDevice: cameraDevice]));
  }
}

NAN_METHOD(NUIImagePickerController::takePicture) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    [self takePicture];
  }
}

NAN_METHOD(NUIImagePickerController::startVideoCapture) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self startVideoCapture]));
  }
}

NAN_METHOD(NUIImagePickerController::stopVideoCapture) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    [self stopVideoCapture];
  }
}

NAN_GETTER(NUIImagePickerController::delegateGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UINavigationControllerDelegate UIImagePickerControllerDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUIImagePickerController::delegateSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UINavigationControllerDelegate UIImagePickerControllerDelegate>*/, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NUIImagePickerController::sourceTypeGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImagePickerControllerSourceType([self sourceType]));
  }
}

NAN_SETTER(NUIImagePickerController::sourceTypeSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIImagePickerControllerSourceType, input);
    [self setSourceType: input];
  }
}

NAN_GETTER(NUIImagePickerController::mediaTypesGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self mediaTypes]));
  }
}

NAN_SETTER(NUIImagePickerController::mediaTypesSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSString*>, input);
    [self setMediaTypes: input];
  }
}

NAN_GETTER(NUIImagePickerController::allowsEditingGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsEditing]));
  }
}

NAN_SETTER(NUIImagePickerController::allowsEditingSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsEditing: input];
  }
}

NAN_GETTER(NUIImagePickerController::allowsImageEditingGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsImageEditing]));
  }
}

NAN_SETTER(NUIImagePickerController::allowsImageEditingSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsImageEditing: input];
  }
}

NAN_GETTER(NUIImagePickerController::imageExportPresetGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImagePickerControllerImageURLExportPreset([self imageExportPreset]));
  }
}

NAN_SETTER(NUIImagePickerController::imageExportPresetSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIImagePickerControllerImageURLExportPreset, input);
    [self setImageExportPreset: input];
  }
}

NAN_GETTER(NUIImagePickerController::videoMaximumDurationGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self videoMaximumDuration]));
  }
}

NAN_SETTER(NUIImagePickerController::videoMaximumDurationSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setVideoMaximumDuration: input];
  }
}

NAN_GETTER(NUIImagePickerController::videoQualityGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImagePickerControllerQualityType([self videoQuality]));
  }
}

NAN_SETTER(NUIImagePickerController::videoQualitySetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIImagePickerControllerQualityType, input);
    [self setVideoQuality: input];
  }
}

NAN_GETTER(NUIImagePickerController::videoExportPresetGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString ([self videoExportPreset]));
  }
}

NAN_SETTER(NUIImagePickerController::videoExportPresetSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString , input);
    [self setVideoExportPreset: input];
  }
}

NAN_GETTER(NUIImagePickerController::showsCameraControlsGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsCameraControls]));
  }
}

NAN_SETTER(NUIImagePickerController::showsCameraControlsSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsCameraControls: input];
  }
}

#include "NUIView.h"

NAN_GETTER(NUIImagePickerController::cameraOverlayViewGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self cameraOverlayView]));
  }
}

NAN_SETTER(NUIImagePickerController::cameraOverlayViewSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setCameraOverlayView: input];
  }
}

NAN_GETTER(NUIImagePickerController::cameraViewTransformGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGAffineTransform([self cameraViewTransform]));
  }
}

NAN_SETTER(NUIImagePickerController::cameraViewTransformSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGAffineTransform, input);
    [self setCameraViewTransform: input];
  }
}

NAN_GETTER(NUIImagePickerController::cameraCaptureModeGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImagePickerControllerCameraCaptureMode([self cameraCaptureMode]));
  }
}

NAN_SETTER(NUIImagePickerController::cameraCaptureModeSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIImagePickerControllerCameraCaptureMode, input);
    [self setCameraCaptureMode: input];
  }
}

NAN_GETTER(NUIImagePickerController::cameraDeviceGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImagePickerControllerCameraDevice([self cameraDevice]));
  }
}

NAN_SETTER(NUIImagePickerController::cameraDeviceSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIImagePickerControllerCameraDevice, input);
    [self setCameraDevice: input];
  }
}

NAN_GETTER(NUIImagePickerController::cameraFlashModeGetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImagePickerControllerCameraFlashMode([self cameraFlashMode]));
  }
}

NAN_SETTER(NUIImagePickerController::cameraFlashModeSetter) {
  JS_UNWRAP(UIImagePickerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIImagePickerControllerCameraFlashMode, input);
    [self setCameraFlashMode: input];
  }
}

