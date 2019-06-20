//
//  UIScrollViewDelegate.mm
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIScrollViewDelegate.h"

NUIScrollViewDelegate::NUIScrollViewDelegate() {}
NUIScrollViewDelegate::~NUIScrollViewDelegate() {}

JS_INIT_CLASS(UIScrollViewDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(scrollViewDidScroll);
  JS_ASSIGN_PROTO_PROP(scrollViewDidZoom);
  JS_ASSIGN_PROTO_PROP(scrollViewWillBeginDragging);
  JS_ASSIGN_PROTO_PROP(scrollViewWillEndDraggingWithVelocityTargetContentOffset);
  JS_ASSIGN_PROTO_PROP(scrollViewDidEndDraggingWillDecelerate);
  JS_ASSIGN_PROTO_PROP(scrollViewWillBeginDecelerating);
  JS_ASSIGN_PROTO_PROP(scrollViewDidEndDecelerating);
  JS_ASSIGN_PROTO_PROP(scrollViewDidEndScrollingAnimation);
  JS_ASSIGN_PROTO_PROP(viewForZoomingInScrollView);
  JS_ASSIGN_PROTO_PROP(scrollViewWillBeginZoomingWithView);
  JS_ASSIGN_PROTO_PROP(scrollViewDidEndZoomingWithViewAtScale);
  JS_ASSIGN_PROTO_PROP(scrollViewShouldScrollToTop);
  JS_ASSIGN_PROTO_PROP(scrollViewDidScrollToTop);
  JS_ASSIGN_PROTO_PROP(scrollViewDidChangeAdjustedContentInset);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIScrollViewDelegate, NSObject);
JS_INIT_CLASS_END(UIScrollViewDelegate, NSObject);

NAN_METHOD(NUIScrollViewDelegate::New) {
  JS_RECONSTRUCT(UIScrollViewDelegate);
  @autoreleasepool {
    UIScrollViewDelegate* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIScrollViewDelegate *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIScrollViewDelegate alloc] init];
    }
    if (self) {
      NUIScrollViewDelegate *wrapper = new NUIScrollViewDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIScrollViewDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(UIScrollViewDelegate, scrollViewDidScroll);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewDidZoom);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewWillBeginDragging);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewWillEndDraggingWithVelocityTargetContentOffset);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewDidEndDraggingWillDecelerate);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewWillBeginDecelerating);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewDidEndDecelerating);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewDidEndScrollingAnimation);
DELEGATE_PROP(UIScrollViewDelegate, viewForZoomingInScrollView);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewWillBeginZoomingWithView);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewDidEndZoomingWithViewAtScale);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewShouldScrollToTop);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewDidScrollToTop);
DELEGATE_PROP(UIScrollViewDelegate, scrollViewDidChangeAdjustedContentInset);

#include "NUIScrollView.h"

@implementation UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView // any offset changes
{
  call_delegate(noop(), scrollViewDidScroll,
    js_value_UIScrollView(scrollView));
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2) // any zoom scale changes
{
  call_delegate(noop(), scrollViewDidZoom,
    js_value_UIScrollView(scrollView));
}

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView 
{
  call_delegate(noop(), scrollViewWillBeginDragging,
    js_value_UIScrollView(scrollView));
}

// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0) 
{
  dispatch_main(^{
    auto jsPoint(js_value_boxed(targetContentOffset ? js_value_CGPoint(*targetContentOffset) : js_value_id(nil)));
    call_delegate(noop(), scrollViewWillEndDraggingWithVelocityTargetContentOffset,
      js_value_UIScrollView(scrollView),
      js_value_CGPoint(velocity),
      jsPoint);
    auto jsOutPoint(to_value_boxed_value(jsPoint));
    if (is_value_CGPoint(jsOutPoint)) {
      if (targetContentOffset) {
        *targetContentOffset = to_value_CGPoint(jsOutPoint);
      }
    }
  });
}

// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate 
{
  call_delegate(noop(), scrollViewDidEndDraggingWillDecelerate,
    js_value_UIScrollView(scrollView),
    js_value_BOOL(decelerate));
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView    // called on finger up as we are moving
{
  call_delegate(noop(), scrollViewWillBeginDecelerating,
    js_value_UIScrollView(scrollView));
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView       // called when scroll view grinds to a halt
{
  call_delegate(noop(), scrollViewDidEndDecelerating,
    js_value_UIScrollView(scrollView));
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView  // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
{
  call_delegate(noop(), scrollViewDidEndScrollingAnimation,
    js_value_UIScrollView(scrollView));
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView      // return a view that will be scaled. if delegate returns nil, nothing happens
{
  __block UIView* result = nil;
  call_delegate(result = to_value_UIView(JS_RESULT), viewForZoomingInScrollView,
    js_value_UIScrollView(scrollView));
  return result;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2)  // called before the scroll view begins zooming its content
{
  call_delegate(noop(), scrollViewWillBeginZoomingWithView,
    js_value_UIScrollView(scrollView),
    js_value_UIView(view));
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale  // scale between minimum and maximum. called after any 'bounce' animations
{
  call_delegate(noop(), scrollViewDidEndZoomingWithViewAtScale,
    js_value_UIScrollView(scrollView),
    js_value_UIView(view),
    js_value_CGFloat(scale));
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView    // return a yes if you want to scroll to the top. if not defined, assumes YES
{
  __block BOOL result = YES;
  call_delegate(result = to_value_BOOL(JS_RESULT), scrollViewShouldScrollToTop,
    js_value_UIScrollView(scrollView));
  return result;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView       // called when scrolling animation finished. may be called immediately if already at top
{
  call_delegate(noop(), scrollViewDidScrollToTop,
    js_value_UIScrollView(scrollView));
}

/* Also see -[UIScrollView adjustedContentInsetDidChange]
 */
- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView API_AVAILABLE(ios(11.0), tvos(11.0)) 
{
  call_delegate(noop(), scrollViewDidChangeAdjustedContentInset,
    js_value_UIScrollView(scrollView));
}

@end
