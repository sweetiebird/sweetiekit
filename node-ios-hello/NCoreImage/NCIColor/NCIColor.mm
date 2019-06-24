//
//  NCIColor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCIColor.h"

#define instancetype CIColor
#define js_value_instancetype js_value_CIColor

NCIColor::NCIColor() {}
NCIColor::~NCIColor() {}

JS_INIT_CLASS(CIColor, NSObject);
  JS_ASSIGN_STATIC_METHOD(colorWithCGColor);
  JS_ASSIGN_STATIC_METHOD(colorWithRedGreenBlueAlpha);
  JS_ASSIGN_STATIC_METHOD(colorWithRedGreenBlue);
  JS_ASSIGN_STATIC_METHOD(colorWithRedGreenBlueAlphaColorSpace);
  JS_ASSIGN_STATIC_METHOD(colorWithRedGreenBlueColorSpace);
  JS_ASSIGN_STATIC_METHOD(colorWithString);
  JS_ASSIGN_PROTO_METHOD(initWithCGColor);
  JS_ASSIGN_PROTO_METHOD(initWithRedGreenBlueAlpha);
  JS_ASSIGN_PROTO_METHOD(initWithRedGreenBlue);
  JS_ASSIGN_PROTO_METHOD(initWithRedGreenBlueAlphaColorSpace);
  JS_ASSIGN_PROTO_METHOD(initWithRedGreenBlueColorSpace);
  JS_ASSIGN_PROTO_PROP_READONLY(numberOfComponents);
  JS_ASSIGN_PROTO_PROP_READONLY(components);
  JS_ASSIGN_PROTO_PROP_READONLY(alpha);
  JS_ASSIGN_PROTO_PROP_READONLY(colorSpace);
  JS_ASSIGN_PROTO_PROP_READONLY(red);
  JS_ASSIGN_PROTO_PROP_READONLY(green);
  JS_ASSIGN_PROTO_PROP_READONLY(blue);
  JS_ASSIGN_PROTO_PROP_READONLY(stringRepresentation);
  JS_ASSIGN_STATIC_PROP_READONLY(blackColor);
  JS_ASSIGN_STATIC_PROP_READONLY(whiteColor);
  JS_ASSIGN_STATIC_PROP_READONLY(grayColor);
  JS_ASSIGN_STATIC_PROP_READONLY(redColor);
  JS_ASSIGN_STATIC_PROP_READONLY(greenColor);
  JS_ASSIGN_STATIC_PROP_READONLY(blueColor);
  JS_ASSIGN_STATIC_PROP_READONLY(cyanColor);
  JS_ASSIGN_STATIC_PROP_READONLY(magentaColor);
  JS_ASSIGN_STATIC_PROP_READONLY(yellowColor);
  JS_ASSIGN_STATIC_PROP_READONLY(clearColor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CIColor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(CIColor, NSObject);

NAN_METHOD(NCIColor::New) {
  JS_RECONSTRUCT(CIColor);
  @autoreleasepool {
    CIColor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CIColor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CIColor alloc] init];
    }
    if (self) {
      NCIColor *wrapper = new NCIColor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CIColor::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCIColor::colorWithCGColor) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGColorRef, c);
    JS_SET_RETURN(js_value_instancetype([CIColor colorWithCGColor: c]));
  }
}

NAN_METHOD(NCIColor::colorWithRedGreenBlueAlpha) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, r);
    declare_value(CGFloat, g);
    declare_value(CGFloat, b);
    declare_value(CGFloat, a);
    JS_SET_RETURN(js_value_instancetype([CIColor colorWithRed: r green: g blue: b alpha: a]));
  }
}

NAN_METHOD(NCIColor::colorWithRedGreenBlue) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, r);
    declare_value(CGFloat, g);
    declare_value(CGFloat, b);
    JS_SET_RETURN(js_value_instancetype([CIColor colorWithRed: r green: g blue: b]));
  }
}

NAN_METHOD(NCIColor::colorWithRedGreenBlueAlphaColorSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, r);
    declare_value(CGFloat, g);
    declare_value(CGFloat, b);
    declare_value(CGFloat, a);
    declare_value(CGColorSpaceRef, colorSpace);
    JS_SET_RETURN(js_value_instancetype([CIColor colorWithRed: r green: g blue: b alpha: a colorSpace: colorSpace]));
  }
}

NAN_METHOD(NCIColor::colorWithRedGreenBlueColorSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, r);
    declare_value(CGFloat, g);
    declare_value(CGFloat, b);
    declare_value(CGColorSpaceRef, colorSpace);
    JS_SET_RETURN(js_value_instancetype([CIColor colorWithRed: r green: g blue: b colorSpace: colorSpace]));
  }
}

NAN_METHOD(NCIColor::colorWithString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, representation);
    JS_SET_RETURN(js_value_instancetype([CIColor colorWithString: representation]));
  }
}

NAN_METHOD(NCIColor::initWithCGColor) {
  JS_UNWRAP_OR_ALLOC(CIColor, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGColorRef, c);
    JS_SET_RETURN(js_value_instancetype([self initWithCGColor: c]));
  }
}

NAN_METHOD(NCIColor::initWithRedGreenBlueAlpha) {
  JS_UNWRAP_OR_ALLOC(CIColor, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, r);
    declare_value(CGFloat, g);
    declare_value(CGFloat, b);
    declare_value(CGFloat, a);
    JS_SET_RETURN(js_value_instancetype([self initWithRed: r green: g blue: b alpha: a]));
  }
}

NAN_METHOD(NCIColor::initWithRedGreenBlue) {
  JS_UNWRAP_OR_ALLOC(CIColor, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, r);
    declare_value(CGFloat, g);
    declare_value(CGFloat, b);
    JS_SET_RETURN(js_value_instancetype([self initWithRed: r green: g blue: b]));
  }
}

NAN_METHOD(NCIColor::initWithRedGreenBlueAlphaColorSpace) {
  JS_UNWRAP_OR_ALLOC(CIColor, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, r);
    declare_value(CGFloat, g);
    declare_value(CGFloat, b);
    declare_value(CGFloat, a);
    declare_value(CGColorSpaceRef, colorSpace);
    JS_SET_RETURN(js_value_instancetype([self initWithRed: r green: g blue: b alpha: a colorSpace: colorSpace]));
  }
}

NAN_METHOD(NCIColor::initWithRedGreenBlueColorSpace) {
  JS_UNWRAP_OR_ALLOC(CIColor, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, r);
    declare_value(CGFloat, g);
    declare_value(CGFloat, b);
    declare_value(CGColorSpaceRef, colorSpace);
    JS_SET_RETURN(js_value_instancetype([self initWithRed: r green: g blue: b colorSpace: colorSpace]));
  }
}

NAN_GETTER(NCIColor::numberOfComponentsGetter) {
  JS_UNWRAP(CIColor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_size_t([self numberOfComponents]));
  }
}

NAN_GETTER(NCIColor::componentsGetter) {
  JS_UNWRAP(CIColor, self);
  declare_autoreleasepool {
    const CGFloat* components = [self components];
    uint32_t count = static_cast<uint32_t>([self numberOfComponents]);
    Local<Array> result(Array::New(JS_ISOLATE(), static_cast<int>(count)));
    for (uint32_t i = 0; i < count; i++) {
      (void)result->Set(i, js_value_CGFloat(components[i]));
    }
    JS_SET_RETURN(result);
  }
}

NAN_GETTER(NCIColor::alphaGetter) {
  JS_UNWRAP(CIColor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self alpha]));
  }
}

NAN_GETTER(NCIColor::colorSpaceGetter) {
  JS_UNWRAP(CIColor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGColorSpaceRef([self colorSpace]));
  }
}

NAN_GETTER(NCIColor::redGetter) {
  JS_UNWRAP(CIColor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self red]));
  }
}

NAN_GETTER(NCIColor::greenGetter) {
  JS_UNWRAP(CIColor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self green]));
  }
}

NAN_GETTER(NCIColor::blueGetter) {
  JS_UNWRAP(CIColor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self blue]));
  }
}

NAN_GETTER(NCIColor::stringRepresentationGetter) {
  JS_UNWRAP(CIColor, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self stringRepresentation]));
  }
}

NAN_GETTER(NCIColor::blackColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIColor([CIColor blackColor]));
  }
}

NAN_GETTER(NCIColor::whiteColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIColor([CIColor whiteColor]));
  }
}

NAN_GETTER(NCIColor::grayColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIColor([CIColor grayColor]));
  }
}

NAN_GETTER(NCIColor::redColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIColor([CIColor redColor]));
  }
}

NAN_GETTER(NCIColor::greenColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIColor([CIColor greenColor]));
  }
}

NAN_GETTER(NCIColor::blueColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIColor([CIColor blueColor]));
  }
}

NAN_GETTER(NCIColor::cyanColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIColor([CIColor cyanColor]));
  }
}

NAN_GETTER(NCIColor::magentaColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIColor([CIColor magentaColor]));
  }
}

NAN_GETTER(NCIColor::yellowColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIColor([CIColor yellowColor]));
  }
}

NAN_GETTER(NCIColor::clearColorGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CIColor([CIColor clearColor]));
  }
}
