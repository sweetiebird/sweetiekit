//
//  NUIPopoverPresentationControllerDelegate.h
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPopoverPresentationControllerDelegate_h
#define NUIPopoverPresentationControllerDelegate_h    

#include "NNSObject.h"

#define js_value_UIPopoverPresentationControllerDelegate(x) js_value_wrapper(x, UIPopoverPresentationControllerDelegate)
#define to_value_UIPopoverPresentationControllerDelegate(x) to_value_wrapper(x, UIPopoverPresentationControllerDelegate)
#define is_value_UIPopoverPresentationControllerDelegate(x) is_value_wrapper(x, UIPopoverPresentationControllerDelegate)

JS_WRAP_CLASS(UIPopoverPresentationControllerDelegate, NSObject);
  JS_PROP(prepareForPopoverPresentation);
  JS_PROP(popoverPresentationControllerShouldDismissPopover);
  JS_PROP(popoverPresentationControllerDidDismissPopover);
  JS_PROP(popoverPresentationControllerWillRepositionPopoverToRectInView);
JS_WRAP_CLASS_END(UIPopoverPresentationControllerDelegate);

#if __OBJC__
@interface UIPopoverPresentationControllerDelegate : NSObject<UIPopoverPresentationControllerDelegate>

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController;

// Called on the delegate when the popover controller will dismiss the popover. Return NO to prevent the
// dismissal of the view.
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController;

// Called on the delegate when the user has taken action to dismiss the popover. This is not called when the popover is dimissed programatically.
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController;

// -popoverPresentationController:willRepositionPopoverToRect:inView: is called on your delegate when the
// popover may require a different view or rectangle.
- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView  * __nonnull * __nonnull)view;

@end
#endif

#endif /* NUIPopoverPresentationControllerDelegate_h */
