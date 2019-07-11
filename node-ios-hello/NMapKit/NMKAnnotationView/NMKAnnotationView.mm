//
//  MKAnnotationView.mm
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKAnnotationView.h"
#include "NUIImage.h"

#define instancetype MKAnnotationView
#define js_value_instancetype js_value_MKAnnotationView

NMKAnnotationView::NMKAnnotationView () {}
NMKAnnotationView::~NMKAnnotationView () {}

JS_INIT_CLASS(MKAnnotationView, UIView);
  JS_ASSIGN_PROTO_METHOD(initWithAnnotationReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(prepareForReuse);
  JS_ASSIGN_PROTO_METHOD(prepareForDisplay);
  JS_ASSIGN_PROTO_METHOD(setSelectedAnimated);
  JS_ASSIGN_PROTO_METHOD(setDragStateAnimated);
  JS_ASSIGN_PROTO_PROP_READONLY(reuseIdentifier);
  JS_ASSIGN_PROTO_PROP(annotation);
  JS_ASSIGN_PROTO_PROP(image);
  JS_ASSIGN_PROTO_PROP(centerOffset);
  JS_ASSIGN_PROTO_PROP(calloutOffset);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_PROP(leftCalloutOffset);
  JS_ASSIGN_PROTO_PROP(rightCalloutOffset);
#endif
  JS_ASSIGN_PROTO_PROP(isEnabled);
  JS_ASSIGN_PROTO_PROP(isHighlighted);
  JS_ASSIGN_PROTO_PROP(isSelected);
  JS_ASSIGN_PROTO_PROP(canShowCallout);
  JS_ASSIGN_PROTO_PROP(leftCalloutAccessoryView);
  JS_ASSIGN_PROTO_PROP(rightCalloutAccessoryView);
  JS_ASSIGN_PROTO_PROP(detailCalloutAccessoryView);
  JS_ASSIGN_PROTO_PROP(isDraggable);
  JS_ASSIGN_PROTO_PROP(dragState);
  JS_ASSIGN_PROTO_PROP(clusteringIdentifier);
  JS_ASSIGN_PROTO_PROP_READONLY(clusterAnnotationView);
  JS_ASSIGN_PROTO_PROP(displayPriority);
  JS_ASSIGN_PROTO_PROP(collisionMode);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MKAnnotationView, UIView);
  // constants (exports)
  
  // Post this notification to re-query callout information.
  JS_ASSIGN_ENUM(MKAnnotationCalloutInfoDidChangeNotification, NSString);

  //typedef NS_ENUM(NSUInteger, MKAnnotationViewDragState) {
    JS_ASSIGN_ENUM(MKAnnotationViewDragStateNone, NSInteger); // = 0,      // View is at rest, sitting on the map.
    JS_ASSIGN_ENUM(MKAnnotationViewDragStateStarting, NSInteger); //,      // View is beginning to drag (e.g. pin lift)
    JS_ASSIGN_ENUM(MKAnnotationViewDragStateDragging, NSInteger); //,      // View is dragging ("lift" animations are complete)
    JS_ASSIGN_ENUM(MKAnnotationViewDragStateCanceling, NSInteger); //,     // View was not dragged and should return to its starting position (e.g. pin drop)
    JS_ASSIGN_ENUM(MKAnnotationViewDragStateEnding, NSInteger); //         // View was dragged, new coordinate is set and view should return to resting position (e.g. pin drop)
  //} NS_ENUM_AVAILABLE(10_9, 4_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED;

  //typedef float MKFeatureDisplayPriority NS_TYPED_EXTENSIBLE_ENUM NS_AVAILABLE(10_13, 11_0) __TVOS_AVAILABLE(11_0) __WATCHOS_PROHIBITED;
  JS_ASSIGN_ENUM(MKFeatureDisplayPriorityRequired, MKFeatureDisplayPriority); // NS_AVAILABLE(10_13, 11_0) __TVOS_AVAILABLE(11_0) __WATCHOS_PROHIBITED = 1000;
  JS_ASSIGN_ENUM(MKFeatureDisplayPriorityDefaultHigh, MKFeatureDisplayPriority); // NS_AVAILABLE(10_13, 11_0) __TVOS_AVAILABLE(11_0) __WATCHOS_PROHIBITED = 750;
  JS_ASSIGN_ENUM(MKFeatureDisplayPriorityDefaultLow, MKFeatureDisplayPriority); // NS_AVAILABLE(10_13, 11_0) __TVOS_AVAILABLE(11_0) __WATCHOS_PROHIBITED = 250;

  //typedef NS_ENUM(NSInteger, MKAnnotationViewCollisionMode) {
    JS_ASSIGN_ENUM(MKAnnotationViewCollisionModeRectangle, NSInteger);
    JS_ASSIGN_ENUM(MKAnnotationViewCollisionModeCircle, NSInteger);
  //} NS_AVAILABLE(10_13, 11_0) __TVOS_AVAILABLE(11_0) __WATCHOS_PROHIBITED;

JS_INIT_CLASS_END(MKAnnotationView, UIView);

NAN_METHOD(NMKAnnotationView::New) {
  JS_RECONSTRUCT(MKAnnotationView);
  @autoreleasepool {
    MKAnnotationView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MKAnnotationView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[MKAnnotationView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[MKAnnotationView alloc] init];
    }
    if (self) {
      NMKAnnotationView *wrapper = new NMKAnnotationView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MKAnnotationView::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMKAnnotationView::initWithAnnotationReuseIdentifier) {
  JS_UNWRAP_OR_ALLOC(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* <MKAnnotation>*/, annotation);
    declare_nullable_pointer(NSString, reuseIdentifier);
    JS_SET_RETURN(js_value_instancetype([self initWithAnnotation: annotation reuseIdentifier: reuseIdentifier]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NMKAnnotationView::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NMKAnnotationView::prepareForReuse) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    [self prepareForReuse];
  }
}

NAN_METHOD(NMKAnnotationView::prepareForDisplay) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    [self prepareForDisplay];
  }
}

NAN_METHOD(NMKAnnotationView::setSelectedAnimated) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, selected);
    declare_value(BOOL, animated);
    [self setSelected: selected animated: animated];
  }
}

NAN_METHOD(NMKAnnotationView::setDragStateAnimated) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKAnnotationViewDragState, newDragState);
    declare_value(BOOL, animated);
    [self setDragState: newDragState animated: animated];
  }
}

NAN_GETTER(NMKAnnotationView::reuseIdentifierGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self reuseIdentifier]));
  }
}

NAN_GETTER(NMKAnnotationView::annotationGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MKAnnotation>*/([self annotation]));
  }
}

NAN_SETTER(NMKAnnotationView::annotationSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MKAnnotation>*/, input);
    [self setAnnotation: input];
  }
}

NAN_GETTER(NMKAnnotationView::imageGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self image]));
  }
}

NAN_SETTER(NMKAnnotationView::imageSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setImage: input];
  }
}

NAN_GETTER(NMKAnnotationView::centerOffsetGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self centerOffset]));
  }
}

NAN_SETTER(NMKAnnotationView::centerOffsetSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setCenterOffset: input];
  }
}

NAN_GETTER(NMKAnnotationView::calloutOffsetGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self calloutOffset]));
  }
}

NAN_SETTER(NMKAnnotationView::calloutOffsetSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setCalloutOffset: input];
  }
}

#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

NAN_GETTER(NMKAnnotationView::leftCalloutOffsetGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self leftCalloutOffset]));
  }
}

NAN_SETTER(NMKAnnotationView::leftCalloutOffsetSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setLeftCalloutOffset: input];
  }
}

NAN_GETTER(NMKAnnotationView::rightCalloutOffsetGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self rightCalloutOffset]));
  }
}

NAN_SETTER(NMKAnnotationView::rightCalloutOffsetSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setRightCalloutOffset: input];
  }
}
#endif

NAN_GETTER(NMKAnnotationView::isEnabledGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NMKAnnotationView::isEnabledSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnabled: input];
  }
}

NAN_GETTER(NMKAnnotationView::isHighlightedGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isHighlighted]));
  }
}

NAN_SETTER(NMKAnnotationView::isHighlightedSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHighlighted: input];
  }
}

NAN_GETTER(NMKAnnotationView::isSelectedGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSelected]));
  }
}

NAN_SETTER(NMKAnnotationView::isSelectedSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSelected: input];
  }
}

NAN_GETTER(NMKAnnotationView::canShowCalloutGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canShowCallout]));
  }
}

NAN_SETTER(NMKAnnotationView::canShowCalloutSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCanShowCallout: input];
  }
}

#if TARGET_OS_IPHONE || TARGET_OS_UIKITFORMAC

NAN_GETTER(NMKAnnotationView::leftCalloutAccessoryViewGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self leftCalloutAccessoryView]));
  }
}

NAN_SETTER(NMKAnnotationView::leftCalloutAccessoryViewSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setLeftCalloutAccessoryView: input];
  }
}

#else

#include <AppKit/NSView.h>
//#include "NNSView.h"
#define js_value_NSView(x) js_value_wrapper_unknown(x, NSView)
#define to_value_NSView(x) to_value_wrapper_unknown(x, NSView)
#define is_value_NSView(x) is_value_wrapper_unknown(x, NSView)

NAN_GETTER(NMKAnnotationView::leftCalloutAccessoryViewGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSView([self leftCalloutAccessoryView]));
  }
}

NAN_SETTER(NMKAnnotationView::leftCalloutAccessoryViewSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSView, input);
    [self setLeftCalloutAccessoryView: input];
  }
}

#endif


#if TARGET_OS_IPHONE || TARGET_OS_UIKITFORMAC

NAN_GETTER(NMKAnnotationView::rightCalloutAccessoryViewGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self rightCalloutAccessoryView]));
  }
}

NAN_SETTER(NMKAnnotationView::rightCalloutAccessoryViewSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setRightCalloutAccessoryView: input];
  }
}

#else

NAN_GETTER(NMKAnnotationView::rightCalloutAccessoryViewGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSView([self rightCalloutAccessoryView]));
  }
}

NAN_SETTER(NMKAnnotationView::rightCalloutAccessoryViewSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSView, input);
    [self setRightCalloutAccessoryView: input];
  }
}

#endif

#if TARGET_OS_IPHONE || TARGET_OS_UIKITFORMAC

NAN_GETTER(NMKAnnotationView::detailCalloutAccessoryViewGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self detailCalloutAccessoryView]));
  }
}

NAN_SETTER(NMKAnnotationView::detailCalloutAccessoryViewSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setDetailCalloutAccessoryView: input];
  }
}

#else

NAN_GETTER(NMKAnnotationView::detailCalloutAccessoryViewGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSView([self detailCalloutAccessoryView]));
  }
}

NAN_SETTER(NMKAnnotationView::detailCalloutAccessoryViewSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSView, input);
    [self setDetailCalloutAccessoryView: input];
  }
}

#endif

NAN_GETTER(NMKAnnotationView::isDraggableGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDraggable]));
  }
}

NAN_SETTER(NMKAnnotationView::isDraggableSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDraggable: input];
  }
}

NAN_GETTER(NMKAnnotationView::dragStateGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MKAnnotationViewDragState([self dragState]));
  }
}

NAN_SETTER(NMKAnnotationView::dragStateSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MKAnnotationViewDragState, input);
    [self setDragState: input];
  }
}

NAN_GETTER(NMKAnnotationView::clusteringIdentifierGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self clusteringIdentifier]));
  }
}

NAN_SETTER(NMKAnnotationView::clusteringIdentifierSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setClusteringIdentifier: input];
  }
}

NAN_GETTER(NMKAnnotationView::clusterAnnotationViewGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MKAnnotationView([self clusterAnnotationView]));
  }
}

NAN_GETTER(NMKAnnotationView::displayPriorityGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MKFeatureDisplayPriority([self displayPriority]));
  }
}

NAN_SETTER(NMKAnnotationView::displayPrioritySetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MKFeatureDisplayPriority, input);
    [self setDisplayPriority: input];
  }
}

NAN_GETTER(NMKAnnotationView::collisionModeGetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MKAnnotationViewCollisionMode([self collisionMode]));
  }
}

NAN_SETTER(NMKAnnotationView::collisionModeSetter) {
  JS_UNWRAP(MKAnnotationView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MKAnnotationViewCollisionMode, input);
    [self setCollisionMode: input];
  }
}
