//
//  NUIAdaptivePresentationControllerDelegate.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIAdaptivePresentationControllerDelegate_h
#define NUIAdaptivePresentationControllerDelegate_h    

#include "NNSObject.h"

#define js_value_UIAdaptivePresentationControllerDelegate(x) js_protocol_wrapper(x, UIAdaptivePresentationControllerDelegate)
#define to_value_UIAdaptivePresentationControllerDelegate(x) to_protocol_wrapper(x, UIAdaptivePresentationControllerDelegate)
#define is_value_UIAdaptivePresentationControllerDelegate(x) is_protocol_wrapper(x, UIAdaptivePresentationControllerDelegate)

JS_WRAP_PROTOCOL(UIAdaptivePresentationControllerDelegate, NSObject);
  JS_PROP(adaptivePresentationStyleForPresentationController);
  JS_PROP(adaptivePresentationStyleForPresentationControllerTraitCollection);
  JS_PROP(presentationControllerViewControllerForAdaptivePresentationStyle);
  JS_PROP(presentationControllerWillPresentWithAdaptiveStyleTransitionCoordinator);
JS_WRAP_PROTOCOL_END(UIAdaptivePresentationControllerDelegate, NSObject);

#if __OBJC__
@interface UIAdaptivePresentationControllerDelegateType : NSObject<UIAdaptivePresentationControllerDelegate>

/* For iOS8.0, the only supported adaptive presentation styles are UIModalPresentationFullScreen and UIModalPresentationOverFullScreen. */
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller;

// Returning UIModalPresentationNone will indicate that an adaptation should not happen.
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection NS_AVAILABLE_IOS(8_3);

/* If this method is not implemented, or returns nil, then the originally presented view controller is used. */
- (nullable UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style;

// If there is no adaptation happening and an original style is used UIModalPresentationNone will be passed as an argument.
- (void)presentationController:(UIPresentationController *)presentationController willPresentWithAdaptiveStyle:(UIModalPresentationStyle)style transitionCoordinator:(nullable id <UIViewControllerTransitionCoordinator>)transitionCoordinator NS_AVAILABLE_IOS(8_3);

@end
#endif

#endif /* NUIAdaptivePresentationControllerDelegate_h */
