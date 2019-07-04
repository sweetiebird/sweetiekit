//
//  NUITableViewCell.mm
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewCell.h"

#define instancetype UITableViewCell
#define js_value_instancetype js_value_UITableViewCell

NUITableViewCell::NUITableViewCell() {}
NUITableViewCell::~NUITableViewCell() {}

JS_INIT_CLASS(UITableViewCell, UIView);
  JS_ASSIGN_PROTO_METHOD(initWithStyleReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(prepareForReuse);
  JS_ASSIGN_PROTO_METHOD(setSelectedAnimated);
  JS_ASSIGN_PROTO_METHOD(setHighlightedAnimated);
  JS_ASSIGN_PROTO_METHOD(setEditingAnimated);
  JS_ASSIGN_PROTO_METHOD(willTransitionToState);
  JS_ASSIGN_PROTO_METHOD(didTransitionToState);
  JS_ASSIGN_PROTO_METHOD(dragStateDidChange);
  JS_ASSIGN_PROTO_METHOD(initWithFrameReuseIdentifier);
  JS_ASSIGN_PROTO_PROP_READONLY(imageView);
  JS_ASSIGN_PROTO_PROP_READONLY(textLabel);
  JS_ASSIGN_PROTO_PROP_READONLY(detailTextLabel);
  JS_ASSIGN_PROTO_PROP_READONLY(contentView);
  JS_ASSIGN_PROTO_PROP(backgroundView);
  JS_ASSIGN_PROTO_PROP(selectedBackgroundView);
  JS_ASSIGN_PROTO_PROP(multipleSelectionBackgroundView);
  JS_ASSIGN_PROTO_PROP_READONLY(reuseIdentifier);
  JS_ASSIGN_PROTO_PROP(selectionStyle);
  JS_ASSIGN_PROTO_PROP(isSelected);
  JS_ASSIGN_PROTO_PROP(isHighlighted);
  JS_ASSIGN_PROTO_PROP_READONLY(editingStyle);
  JS_ASSIGN_PROTO_PROP(showsReorderControl);
  JS_ASSIGN_PROTO_PROP(shouldIndentWhileEditing);
  JS_ASSIGN_PROTO_PROP(accessoryType);
  JS_ASSIGN_PROTO_PROP(accessoryView);
  JS_ASSIGN_PROTO_PROP(editingAccessoryType);
  JS_ASSIGN_PROTO_PROP(editingAccessoryView);
  JS_ASSIGN_PROTO_PROP(indentationLevel);
  JS_ASSIGN_PROTO_PROP(indentationWidth);
  JS_ASSIGN_PROTO_PROP(separatorInset);
  JS_ASSIGN_PROTO_PROP(isEditing);
  JS_ASSIGN_PROTO_PROP_READONLY(showingDeleteConfirmation);
  JS_ASSIGN_PROTO_PROP(focusStyle);
  JS_ASSIGN_PROTO_PROP(userInteractionEnabledWhileDragging);
  JS_ASSIGN_PROTO_PROP(text);
  JS_ASSIGN_PROTO_PROP(font);
  JS_ASSIGN_PROTO_PROP(textAlignment);
  JS_ASSIGN_PROTO_PROP(lineBreakMode);
  JS_ASSIGN_PROTO_PROP(textColor);
  JS_ASSIGN_PROTO_PROP(selectedTextColor);
  JS_ASSIGN_PROTO_PROP(image);
  JS_ASSIGN_PROTO_PROP(selectedImage);
  JS_ASSIGN_PROTO_PROP(hidesAccessoryWhenEditing);
  JS_ASSIGN_PROTO_PROP(target);
  JS_ASSIGN_PROTO_PROP(editAction);
  JS_ASSIGN_PROTO_PROP(accessoryAction);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITableViewCell, UIView);
  // constants (exports)

//typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
  JS_ASSIGN_ENUM(UITableViewCellStyleDefault, NSInteger); //    // Simple cell with text label and optional image view (behavior of UITableViewCell in iPhoneOS 2.x)
  JS_ASSIGN_ENUM(UITableViewCellStyleValue1, NSInteger); //      // Left aligned label on left and right aligned label on right with blue text (Used in Settings)
  JS_ASSIGN_ENUM(UITableViewCellStyleValue2, NSInteger); //      // Right aligned label on left with blue text and left aligned label on right (Used in Phone/Contacts)
  JS_ASSIGN_ENUM(UITableViewCellStyleSubtitle, NSInteger); //   // Left aligned label on top and left aligned label on bottom with gray text (Used in iPod).
//};             // available in iPhone OS 3.0

//typedef NS_ENUM(NSInteger, UITableViewCellSeparatorStyle) {
  JS_ASSIGN_ENUM(UITableViewCellSeparatorStyleNone, NSInteger);
  JS_ASSIGN_ENUM(UITableViewCellSeparatorStyleSingleLine, NSInteger);
  JS_ASSIGN_ENUM(UITableViewCellSeparatorStyleSingleLineEtched, NSInteger); //  NS_ENUM_DEPRECATED_IOS(2_0, 11_0, "Use UITableViewCellSeparatorStyleSingleLine for a single line separator.")
//} __TVOS_PROHIBITED;

//typedef NS_ENUM(NSInteger, UITableViewCellSelectionStyle) {
  JS_ASSIGN_ENUM(UITableViewCellSelectionStyleNone, NSInteger);
  JS_ASSIGN_ENUM(UITableViewCellSelectionStyleBlue, NSInteger);
  JS_ASSIGN_ENUM(UITableViewCellSelectionStyleGray, NSInteger);
  JS_ASSIGN_ENUM(UITableViewCellSelectionStyleDefault, NSInteger); //  NS_ENUM_AVAILABLE_IOS(7_0)
//};

//typedef NS_ENUM(NSInteger, UITableViewCellFocusStyle) {
  JS_ASSIGN_ENUM(UITableViewCellFocusStyleDefault, NSInteger);
  JS_ASSIGN_ENUM(UITableViewCellFocusStyleCustom, NSInteger);
//} NS_ENUM_AVAILABLE_IOS(9_0);

//typedef NS_ENUM(NSInteger, UITableViewCellEditingStyle) {
  JS_ASSIGN_ENUM(UITableViewCellEditingStyleNone, NSInteger);
  JS_ASSIGN_ENUM(UITableViewCellEditingStyleDelete, NSInteger);
  JS_ASSIGN_ENUM(UITableViewCellEditingStyleInsert, NSInteger);
//};

//typedef NS_ENUM(NSInteger, UITableViewCellAccessoryType) {
  JS_ASSIGN_ENUM(UITableViewCellAccessoryNone, NSInteger); //                                                        // don't show any accessory view
  JS_ASSIGN_ENUM(UITableViewCellAccessoryDisclosureIndicator, NSInteger); //                                         // regular chevron. doesn't track
  JS_ASSIGN_ENUM(UITableViewCellAccessoryDetailDisclosureButton, NSInteger); //  __TVOS_PROHIBITED,                 // info button w/ chevron. tracks
  JS_ASSIGN_ENUM(UITableViewCellAccessoryCheckmark, NSInteger); //                                                   // checkmark. doesn't track
  JS_ASSIGN_ENUM(UITableViewCellAccessoryDetailButton, NSInteger); //  NS_ENUM_AVAILABLE_IOS(7_0)  __TVOS_PROHIBITED // info button. tracks
//};

//typedef NS_OPTIONS(NSUInteger, UITableViewCellStateMask) {
  JS_ASSIGN_ENUM(UITableViewCellStateDefaultMask, NSUInteger); //                      = 0,
  JS_ASSIGN_ENUM(UITableViewCellStateShowingEditControlMask, NSUInteger); //           = 1 << 0,
  JS_ASSIGN_ENUM(UITableViewCellStateShowingDeleteConfirmationMask, NSUInteger); //    = 1 << 1
//};

//typedef NS_ENUM(NSInteger, UITableViewCellDragState) {
  JS_ASSIGN_ENUM(UITableViewCellDragStateNone, NSInteger);
  JS_ASSIGN_ENUM(UITableViewCellDragStateLifting, NSInteger); //   // The cell is lifting from the table view before it joins the drag session.
  JS_ASSIGN_ENUM(UITableViewCellDragStateDragging, NSInteger); //  // The cell is involved in a drag session.
//} API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);

JS_INIT_CLASS_END(UITableViewCell, UIView);

NAN_METHOD(NUITableViewCell::New) {
  JS_RECONSTRUCT(UITableViewCell);
  @autoreleasepool {
    UITableViewCell* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITableViewCell *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITableViewCell alloc] init];
    }
    if (self) {
      NUITableViewCell *wrapper = new NUITableViewCell();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITableViewCell::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUITableViewCell::initWithStyleReuseIdentifier) {
  JS_UNWRAP_OR_ALLOC(UITableViewCell, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UITableViewCellStyle, style);
    declare_nullable_pointer(NSString, reuseIdentifier);
    JS_SET_RETURN(js_value_instancetype([self initWithStyle: style reuseIdentifier: reuseIdentifier]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUITableViewCell::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UITableViewCell, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUITableViewCell::prepareForReuse) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    [self prepareForReuse];
  }
}

NAN_METHOD(NUITableViewCell::setSelectedAnimated) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, selected);
    declare_value(BOOL, animated);
    [self setSelected: selected animated: animated];
  }
}

NAN_METHOD(NUITableViewCell::setHighlightedAnimated) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, highlighted);
    declare_value(BOOL, animated);
    [self setHighlighted: highlighted animated: animated];
  }
}

NAN_METHOD(NUITableViewCell::setEditingAnimated) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, editing);
    declare_value(BOOL, animated);
    [self setEditing: editing animated: animated];
  }
}

NAN_METHOD(NUITableViewCell::willTransitionToState) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UITableViewCellStateMask, state);
    [self willTransitionToState: state];
  }
}

NAN_METHOD(NUITableViewCell::didTransitionToState) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UITableViewCellStateMask, state);
    [self didTransitionToState: state];
  }
}

NAN_METHOD(NUITableViewCell::dragStateDidChange) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UITableViewCellDragState, dragState);
    [self dragStateDidChange: dragState];
  }
}

NAN_METHOD(NUITableViewCell::initWithFrameReuseIdentifier) {
  JS_UNWRAP_OR_ALLOC(UITableViewCell, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    declare_nullable_pointer(NSString, reuseIdentifier);
    JS_SET_RETURN(js_value_id([self initWithFrame: frame reuseIdentifier: reuseIdentifier]));
  }
}

#include "NUIImageView.h"

NAN_GETTER(NUITableViewCell::imageViewGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImageView([self imageView]));
  }
}

#include "NUILabel.h"

NAN_GETTER(NUITableViewCell::textLabelGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UILabel([self textLabel]));
  }
}

NAN_GETTER(NUITableViewCell::detailTextLabelGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UILabel([self detailTextLabel]));
  }
}

NAN_GETTER(NUITableViewCell::contentViewGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self contentView]));
  }
}

NAN_GETTER(NUITableViewCell::backgroundViewGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self backgroundView]));
  }
}

NAN_SETTER(NUITableViewCell::backgroundViewSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setBackgroundView: input];
  }
}

NAN_GETTER(NUITableViewCell::selectedBackgroundViewGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self selectedBackgroundView]));
  }
}

NAN_SETTER(NUITableViewCell::selectedBackgroundViewSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setSelectedBackgroundView: input];
  }
}

NAN_GETTER(NUITableViewCell::multipleSelectionBackgroundViewGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self multipleSelectionBackgroundView]));
  }
}

NAN_SETTER(NUITableViewCell::multipleSelectionBackgroundViewSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setMultipleSelectionBackgroundView: input];
  }
}

NAN_GETTER(NUITableViewCell::reuseIdentifierGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self reuseIdentifier]));
  }
}

NAN_GETTER(NUITableViewCell::selectionStyleGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewCellSelectionStyle([self selectionStyle]));
  }
}

NAN_SETTER(NUITableViewCell::selectionStyleSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITableViewCellSelectionStyle, input);
    [self setSelectionStyle: input];
  }
}

NAN_GETTER(NUITableViewCell::isSelectedGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSelected]));
  }
}

NAN_SETTER(NUITableViewCell::isSelectedSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSelected: input];
  }
}

NAN_GETTER(NUITableViewCell::isHighlightedGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isHighlighted]));
  }
}

NAN_SETTER(NUITableViewCell::isHighlightedSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHighlighted: input];
  }
}

NAN_GETTER(NUITableViewCell::editingStyleGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewCellEditingStyle([self editingStyle]));
  }
}

NAN_GETTER(NUITableViewCell::showsReorderControlGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsReorderControl]));
  }
}

NAN_SETTER(NUITableViewCell::showsReorderControlSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsReorderControl: input];
  }
}

NAN_GETTER(NUITableViewCell::shouldIndentWhileEditingGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldIndentWhileEditing]));
  }
}

NAN_SETTER(NUITableViewCell::shouldIndentWhileEditingSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShouldIndentWhileEditing: input];
  }
}

NAN_GETTER(NUITableViewCell::accessoryTypeGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewCellAccessoryType([self accessoryType]));
  }
}

NAN_SETTER(NUITableViewCell::accessoryTypeSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITableViewCellAccessoryType, input);
    [self setAccessoryType: input];
  }
}

NAN_GETTER(NUITableViewCell::accessoryViewGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView ([self accessoryView]));
  }
}

NAN_SETTER(NUITableViewCell::accessoryViewSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView , input);
    [self setAccessoryView: input];
  }
}

NAN_GETTER(NUITableViewCell::editingAccessoryTypeGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewCellAccessoryType([self editingAccessoryType]));
  }
}

NAN_SETTER(NUITableViewCell::editingAccessoryTypeSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITableViewCellAccessoryType, input);
    [self setEditingAccessoryType: input];
  }
}

NAN_GETTER(NUITableViewCell::editingAccessoryViewGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView ([self editingAccessoryView]));
  }
}

NAN_SETTER(NUITableViewCell::editingAccessoryViewSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView , input);
    [self setEditingAccessoryView: input];
  }
}

NAN_GETTER(NUITableViewCell::indentationLevelGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self indentationLevel]));
  }
}

NAN_SETTER(NUITableViewCell::indentationLevelSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setIndentationLevel: input];
  }
}

NAN_GETTER(NUITableViewCell::indentationWidthGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self indentationWidth]));
  }
}

NAN_SETTER(NUITableViewCell::indentationWidthSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setIndentationWidth: input];
  }
}

NAN_GETTER(NUITableViewCell::separatorInsetGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self separatorInset]));
  }
}

NAN_SETTER(NUITableViewCell::separatorInsetSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIEdgeInsets, input);
    [self setSeparatorInset: input];
  }
}

NAN_GETTER(NUITableViewCell::isEditingGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEditing]));
  }
}

NAN_SETTER(NUITableViewCell::isEditingSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEditing: input];
  }
}

NAN_GETTER(NUITableViewCell::showingDeleteConfirmationGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showingDeleteConfirmation]));
  }
}

NAN_GETTER(NUITableViewCell::focusStyleGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITableViewCellFocusStyle([self focusStyle]));
  }
}

NAN_SETTER(NUITableViewCell::focusStyleSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITableViewCellFocusStyle, input);
    [self setFocusStyle: input];
  }
}

NAN_GETTER(NUITableViewCell::userInteractionEnabledWhileDraggingGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self userInteractionEnabledWhileDragging]));
  }
}

NAN_SETTER(NUITableViewCell::userInteractionEnabledWhileDraggingSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUserInteractionEnabledWhileDragging: input];
  }
}

NAN_GETTER(NUITableViewCell::textGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self text]));
  }
}

NAN_SETTER(NUITableViewCell::textSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setText: input];
  }
}

#include "NUIFont.h"

NAN_GETTER(NUITableViewCell::fontGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIFont([self font]));
  }
}

NAN_SETTER(NUITableViewCell::fontSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIFont, input);
    [self setFont: input];
  }
}

NAN_GETTER(NUITableViewCell::textAlignmentGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTextAlignment([self textAlignment]));
  }
}

NAN_SETTER(NUITableViewCell::textAlignmentSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTextAlignment, input);
    [self setTextAlignment: input];
  }
}

#include "NNSParagraphStyle.h"

NAN_GETTER(NUITableViewCell::lineBreakModeGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSLineBreakMode([self lineBreakMode]));
  }
}

NAN_SETTER(NUITableViewCell::lineBreakModeSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSLineBreakMode, input);
    [self setLineBreakMode: input];
  }
}

NAN_GETTER(NUITableViewCell::textColorGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self textColor]));
  }
}

NAN_SETTER(NUITableViewCell::textColorSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setTextColor: input];
  }
}

NAN_GETTER(NUITableViewCell::selectedTextColorGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self selectedTextColor]));
  }
}

NAN_SETTER(NUITableViewCell::selectedTextColorSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setSelectedTextColor: input];
  }
}

#include "NUIImage.h"

NAN_GETTER(NUITableViewCell::imageGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self image]));
  }
}

NAN_SETTER(NUITableViewCell::imageSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setImage: input];
  }
}

NAN_GETTER(NUITableViewCell::selectedImageGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self selectedImage]));
  }
}

NAN_SETTER(NUITableViewCell::selectedImageSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setSelectedImage: input];
  }
}

NAN_GETTER(NUITableViewCell::hidesAccessoryWhenEditingGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesAccessoryWhenEditing]));
  }
}

NAN_SETTER(NUITableViewCell::hidesAccessoryWhenEditingSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesAccessoryWhenEditing: input];
  }
}

NAN_GETTER(NUITableViewCell::targetGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self target]));
  }
}

NAN_SETTER(NUITableViewCell::targetSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setTarget: input];
  }
}

NAN_GETTER(NUITableViewCell::editActionGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SEL([self editAction]));
  }
}

NAN_SETTER(NUITableViewCell::editActionSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SEL, input);
    [self setEditAction: input];
  }
}

NAN_GETTER(NUITableViewCell::accessoryActionGetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SEL([self accessoryAction]));
  }
}

NAN_SETTER(NUITableViewCell::accessoryActionSetter) {
  JS_UNWRAP(UITableViewCell, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SEL, input);
    [self setAccessoryAction: input];
  }
}

