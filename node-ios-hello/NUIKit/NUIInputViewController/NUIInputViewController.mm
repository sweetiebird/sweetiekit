//
//  NUIInputViewController.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIInputViewController.h"

#define instancetype UIInputViewController
#define js_value_instancetype js_value_UIInputViewController

NUIInputViewController::NUIInputViewController() {}
NUIInputViewController::~NUIInputViewController() {}

JS_INIT_CLASS(UIInputViewController, UIViewController);
#if TODO
// UITextDocumentProxy
  JS_ASSIGN_PROTO_METHOD(adjustTextPositionByCharacterOffset);
#endif
// UIInputViewController
  JS_ASSIGN_PROTO_METHOD(dismissKeyboard);
  JS_ASSIGN_PROTO_METHOD(advanceToNextInputMode);
  JS_ASSIGN_PROTO_METHOD(handleInputModeListFromViewWithEvent);
  JS_ASSIGN_PROTO_METHOD(requestSupplementaryLexiconWithCompletion);
#if TODO
// UITextDocumentProxy
  JS_ASSIGN_PROTO_PROP_READONLY(documentContextBeforeInput);
  JS_ASSIGN_PROTO_PROP_READONLY(documentContextAfterInput);
  JS_ASSIGN_PROTO_PROP_READONLY(selectedText);
  JS_ASSIGN_PROTO_PROP_READONLY(documentInputMode);
  JS_ASSIGN_PROTO_PROP_READONLY(documentIdentifier);
#endif
// UIInputViewController
  JS_ASSIGN_PROTO_PROP(inputView);
  JS_ASSIGN_PROTO_PROP_READONLY(textDocumentProxy);
  JS_ASSIGN_PROTO_PROP(primaryLanguage);
  JS_ASSIGN_PROTO_PROP(hasDictationKey);
  JS_ASSIGN_PROTO_PROP_READONLY(hasFullAccess);
  JS_ASSIGN_PROTO_PROP_READONLY(needsInputModeSwitchKey);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIInputViewController, UIViewController);
  // constant values (exports)
JS_INIT_CLASS_END(UIInputViewController, UIViewController);

NAN_METHOD(NUIInputViewController::New) {
  JS_RECONSTRUCT(UIInputViewController);
  @autoreleasepool {
    UIInputViewController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIInputViewController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIInputViewController alloc] init];
    }
    if (self) {
      NUIInputViewController *wrapper = new NUIInputViewController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIInputViewController::New: invalid arguments");
    }
  }
}

#if TODO
NAN_METHOD(NUITextDocumentProxy::adjustTextPositionByCharacterOffset) {
  JS_UNWRAP(UITextDocumentProxy, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, offset);
    [self adjustTextPositionByCharacterOffset: offset];
  }
}
#endif

NAN_METHOD(NUIInputViewController::dismissKeyboard) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    [self dismissKeyboard];
  }
}

NAN_METHOD(NUIInputViewController::advanceToNextInputMode) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    [self advanceToNextInputMode];
  }
}

#include "NUIView.h"
#include "NUIEvent.h"

NAN_METHOD(NUIInputViewController::handleInputModeListFromViewWithEvent) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    declare_pointer(UIEvent, event);
    [self handleInputModeListFromView: view withEvent: event];
  }
}

#include "NUILexicon.h"

NAN_METHOD(NUIInputViewController::requestSupplementaryLexiconWithCompletion) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(completionHandler);
    [self requestSupplementaryLexiconWithCompletion:^(UILexicon * _Nonnull lexicon) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NUIInputViewController::requestSupplementaryLexiconWithCompletion",
            js_value_UILexicon(lexicon));
        }
      });
    }];
  }
}

#if TODO
NAN_GETTER(NUITextDocumentProxy::documentContextBeforeInputGetter) {
  JS_UNWRAP(UITextDocumentProxy, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self documentContextBeforeInput]));
  }
}

NAN_GETTER(NUITextDocumentProxy::documentContextAfterInputGetter) {
  JS_UNWRAP(UITextDocumentProxy, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self documentContextAfterInput]));
  }
}

NAN_GETTER(NUITextDocumentProxy::selectedTextGetter) {
  JS_UNWRAP(UITextDocumentProxy, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self selectedText]));
  }
}

NAN_GETTER(NUITextDocumentProxy::documentInputModeGetter) {
  JS_UNWRAP(UITextDocumentProxy, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextInputMode([self documentInputMode]));
  }
}

NAN_GETTER(NUITextDocumentProxy::documentIdentifierGetter) {
  JS_UNWRAP(UITextDocumentProxy, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUUID([self documentIdentifier]));
  }
}
#endif

#include "NUIInputView.h"

NAN_GETTER(NUIInputViewController::inputViewGetter) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInputView([self inputView]));
  }
}

NAN_SETTER(NUIInputViewController::inputViewSetter) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIInputView, input);
    [self setInputView: input];
  }
}

NAN_GETTER(NUIInputViewController::textDocumentProxyGetter) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UITextDocumentProxy>*/([self textDocumentProxy]));
  }
}

NAN_GETTER(NUIInputViewController::primaryLanguageGetter) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self primaryLanguage]));
  }
}

NAN_SETTER(NUIInputViewController::primaryLanguageSetter) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPrimaryLanguage: input];
  }
}

NAN_GETTER(NUIInputViewController::hasDictationKeyGetter) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasDictationKey]));
  }
}

NAN_SETTER(NUIInputViewController::hasDictationKeySetter) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHasDictationKey: input];
  }
}

NAN_GETTER(NUIInputViewController::hasFullAccessGetter) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasFullAccess]));
  }
}

NAN_GETTER(NUIInputViewController::needsInputModeSwitchKeyGetter) {
  JS_UNWRAP(UIInputViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self needsInputModeSwitchKey]));
  }
}

