//
//  NUIScrollViewDelegate.h
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIScrollViewDelegate_h
#define NUIScrollViewDelegate_h    

#include "NNSObject.h"

#define js_value_UIScrollViewDelegate(x) js_protocol_wrapper(x, UIScrollViewDelegate)
#define to_value_UIScrollViewDelegate(x) to_protocol_wrapper(x, UIScrollViewDelegate)
#define is_value_UIScrollViewDelegate(x) is_protocol_wrapper(x, UIScrollViewDelegate)

JS_WRAP_PROTOCOL(UIScrollViewDelegate, NSObject);
  JS_PROP(scrollViewDidScroll);
  JS_PROP(scrollViewDidZoom);
  JS_PROP(scrollViewWillBeginDragging);
  JS_PROP(scrollViewWillEndDraggingWithVelocityTargetContentOffset);
  JS_PROP(scrollViewDidEndDraggingWillDecelerate);
  JS_PROP(scrollViewWillBeginDecelerating);
  JS_PROP(scrollViewDidEndDecelerating);
  JS_PROP(scrollViewDidEndScrollingAnimation);
  JS_PROP(viewForZoomingInScrollView);
  JS_PROP(scrollViewWillBeginZoomingWithView);
  JS_PROP(scrollViewDidEndZoomingWithViewAtScale);
  JS_PROP(scrollViewShouldScrollToTop);
  JS_PROP(scrollViewDidScrollToTop);
  JS_PROP(scrollViewDidChangeAdjustedContentInset);
JS_WRAP_PROTOCOL_END(UIScrollViewDelegate, NSObject);

#if __OBJC__
@interface UIScrollViewDelegateType : NSObject<UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;                                               // any offset changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2); // any zoom scale changes

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0);
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;   // called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;      // called when scroll view grinds to a halt

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView; // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;     // return a view that will be scaled. if delegate returns nil, nothing happens
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2); // called before the scroll view begins zooming its content
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale; // scale between minimum and maximum. called after any 'bounce' animations

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView;   // return a yes if you want to scroll to the top. if not defined, assumes YES
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;      // called when scrolling animation finished. may be called immediately if already at top

/* Also see -[UIScrollView adjustedContentInsetDidChange]
 */
- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView API_AVAILABLE(ios(11.0), tvos(11.0));

@end
#endif

#endif /* NUIScrollViewDelegate_h */
