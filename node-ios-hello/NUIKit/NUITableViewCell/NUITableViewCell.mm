//
//  NUITableViewCell.mm
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITableViewCell.h"

NUITableViewCell::NUITableViewCell() {}
NUITableViewCell::~NUITableViewCell() {}

JS_INIT_CLASS(UITableViewCell, UIView);
  // instance members (proto)
  JS_SET_PROP_READONLY(proto, "textLabel", TextLabel);
  JS_SET_PROP_READONLY(proto, "detailTextLabel", DetailTextLabel);
  JS_SET_PROP(proto, "isEditing", IsEditing);
  JS_SET_PROP(proto, "isSelected", IsSelected);
  JS_ASSIGN_PROP(proto, selectionStyle);
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

  Local<Object> ctrlObj = info.This();

  NUITableViewCell *ctrl = new NUITableViewCell();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UITableViewCell *)(info[0].As<External>()->Value()));
  } else {
#if 1
    @autoreleasepool {
      //auto cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
      double styleVal = info.Length() > 0 && info[0]->IsNumber() ? UITableViewCellStyle(TO_DOUBLE(info[0])) : 0;
      UITableViewCellStyle style = UITableViewCellStyle(styleVal);
      auto cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:@"id"];
      //[cell initWithFrame:CGRectMake(0, 0, 300, 40)];
      ctrl->SetNSObject(cell);
    }
#elif 1
    ctrl->SetNSObject([[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 300, 40)]);
#else
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          ctrl->SetNSObject([[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 300, 40)]);
      });
    }
#endif
  }
  ctrl->Wrap(ctrlObj);

  JS_SET_RETURN(ctrlObj);
}

#include "NUILabel.h"

NAN_GETTER(NUITableViewCell::TextLabelGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableViewCell, ui);
  
  __block UILabel* result = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      result = [ui textLabel];
    });
  }

  if (result != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)result)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(result, NUILabel::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      JS_SET_RETURN(value);
  }
}

NAN_GETTER(NUITableViewCell::DetailTextLabelGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableViewCell, ui);
  
  __block UILabel* result = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      result = [ui detailTextLabel];
    });
  }

  if (result != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)result)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(result, NUILabel::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      JS_SET_RETURN(value);
  }
}

NAN_GETTER(NUITableViewCell::IsEditingGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableViewCell, ui);

  JS_SET_RETURN(JS_BOOL([ui isEditing]));
}

NAN_SETTER(NUITableViewCell::IsEditingSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableViewCell, ui);

  [ui setEditing:TO_BOOL(value)];
}

NAN_GETTER(NUITableViewCell::IsSelectedGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableViewCell, ui);

  JS_SET_RETURN(JS_BOOL([ui isSelected]));
}

NAN_SETTER(NUITableViewCell::IsSelectedSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableViewCell, ui);

  [ui setSelected:TO_BOOL(value)];
}

NAN_GETTER(NUITableViewCell::selectionStyleGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableViewCell, ui);
  
  UITableViewCellSelectionStyle style = [ui selectionStyle];
  int styleInt = 0;

  if (style == UITableViewCellSelectionStyleBlue) {
    styleInt = 1;
  } else if (style == UITableViewCellSelectionStyleGray) {
    styleInt = 2;
  } else if (style == UITableViewCellSelectionStyleDefault) {
    styleInt = 3;
  }

  JS_SET_RETURN(JS_NUM(styleInt));
}

NAN_SETTER(NUITableViewCell::selectionStyleSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITableViewCell, ui);

  double styleVal = TO_DOUBLE(value);
  UITableViewCellSelectionStyle style = UITableViewCellSelectionStyle(styleVal);

  @autoreleasepool {
    [ui setSelectionStyle:style];
  }
}
