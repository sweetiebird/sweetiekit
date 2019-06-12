//
//  NSKLabelNode.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKLabelNode.h"

NSKLabelNode::NSKLabelNode () {}
NSKLabelNode::~NSKLabelNode () {}

JS_INIT_CLASS(SKLabelNode, SKNode);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, text);
  JS_ASSIGN_PROP(proto, attributedText);
  JS_ASSIGN_PROP(proto, preferredMaxLayoutWidth);
  JS_ASSIGN_PROP(proto, numberOfLines);
  JS_ASSIGN_PROP(proto, fontName);
  // static members (ctor)
  JS_INIT_CTOR(SKLabelNode, SKNode);
JS_INIT_CLASS_END(SKLabelNode, SKNode);

NAN_METHOD(NSKLabelNode::New) {
  JS_RECONSTRUCT(SKLabelNode);

  Local<Object> obj = info.This();

  NSKLabelNode *node = new NSKLabelNode();

  if (info[0]->IsExternal()) {
    node->SetNSObject((__bridge SKLabelNode *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        SKLabelNode *n = [[SKLabelNode alloc] init];
        [n setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        [n setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
        [n setFontSize:50];
        [n setFontName:@"Arial-BoldMT"];
        [n setLineBreakMode:NSLineBreakByWordWrapping];
        node->SetNSObject([[SKLabelNode alloc] init]);
      });
    }
  }
  node->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NSKLabelNode::textGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);

  __block NSString* str = nullptr;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      str = [node text];
    });
  }

  if (str != nullptr) {
    auto result = JS_STR([str UTF8String]);
    info.GetReturnValue().Set(result);
  }
}

NAN_SETTER(NSKLabelNode::textSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);

  std::string text;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    text = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [node setText:[NSString stringWithUTF8String:text.c_str()]];
    });
  }
}

#include "NNSAttributedString.h"

NAN_GETTER(NSKLabelNode::attributedTextGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([node attributedText], NNSAttributedString::type));
}

NAN_SETTER(NSKLabelNode::attributedTextSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);

  NSAttributedString *str = (NSAttributedString *)sweetiekit::FromJS(value);

  [node setAttributedText:str];
}

NAN_GETTER(NSKLabelNode::preferredMaxLayoutWidthGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);
  JS_SET_RETURN(JS_NUM([node preferredMaxLayoutWidth]));
}

NAN_SETTER(NSKLabelNode::preferredMaxLayoutWidthSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);
  
  CGFloat fValue = TO_FLOAT(value);
  [node setPreferredMaxLayoutWidth:fValue];
}

NAN_GETTER(NSKLabelNode::numberOfLinesGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);
  JS_SET_RETURN(JS_INT((int)[node numberOfLines]));
}

NAN_SETTER(NSKLabelNode::numberOfLinesSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);
  
  int iValue = TO_INT32(value);
  [node setNumberOfLines:iValue];
}

NAN_GETTER(NSKLabelNode::fontNameGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);

  JS_SET_RETURN(JS_STR([[node fontName] UTF8String]));
}

NAN_SETTER(NSKLabelNode::fontNameSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);

  NSString *name = NJSStringToNSString(value);
  [node setFontName:name];
}
