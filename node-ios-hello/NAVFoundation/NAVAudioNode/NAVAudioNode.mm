//
//  NAVAudioNode.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioNode.h"

#define instancetype AVAudioNode
#define js_value_instancetype js_value_AVAudioNode

NAVAudioNode::NAVAudioNode() {}
NAVAudioNode::~NAVAudioNode() {}

JS_INIT_CLASS(AVAudioNode, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(reset);
  JS_ASSIGN_PROTO_METHOD(inputFormatForBus);
  JS_ASSIGN_PROTO_METHOD(outputFormatForBus);
  JS_ASSIGN_PROTO_METHOD(nameForInputBus);
  JS_ASSIGN_PROTO_METHOD(nameForOutputBus);
  JS_ASSIGN_PROTO_METHOD(installTapOnBusBufferSizeFormatBlock);
  JS_ASSIGN_PROTO_METHOD(removeTapOnBus);
  JS_ASSIGN_PROTO_PROP_READONLY(engine);
  JS_ASSIGN_PROTO_PROP_READONLY(numberOfInputs);
  JS_ASSIGN_PROTO_PROP_READONLY(numberOfOutputs);
  JS_ASSIGN_PROTO_PROP_READONLY(lastRenderTime);
  JS_ASSIGN_PROTO_PROP_READONLY(AUAudioUnit);
  JS_ASSIGN_PROTO_PROP_READONLY(latency);
  JS_ASSIGN_PROTO_PROP_READONLY(outputPresentationLatency);

  // static members (ctor)
  JS_INIT_CTOR(AVAudioNode, NSObject);
JS_INIT_CLASS_END(AVAudioNode, NSObject);

NAN_METHOD(NAVAudioNode::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioNode(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioNode, info);
      return;
    }

    AVAudioNode* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioNode *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioNode alloc] init];
    }
    if (self) {
      NAVAudioNode *wrapper = new NAVAudioNode();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioNode::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVAudioNode::reset) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    [self reset];
  }
}

#include "NAVAudioFormat.h"

NAN_METHOD(NAVAudioNode::inputFormatForBus) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioNodeBus, bus);
    JS_SET_RETURN(js_value_AVAudioFormat([self inputFormatForBus: bus]));
  }
}

NAN_METHOD(NAVAudioNode::outputFormatForBus) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioNodeBus, bus);
    JS_SET_RETURN(js_value_AVAudioFormat([self outputFormatForBus: bus]));
  }
}

NAN_METHOD(NAVAudioNode::nameForInputBus) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioNodeBus, bus);
    JS_SET_RETURN(js_value_NSString([self nameForInputBus: bus]));
  }
}

NAN_METHOD(NAVAudioNode::nameForOutputBus) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioNodeBus, bus);
    JS_SET_RETURN(js_value_NSString([self nameForOutputBus: bus]));
  }
}

#include "NAVAudioTime.h"

NAN_METHOD(NAVAudioNode::installTapOnBusBufferSizeFormatBlock) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioNodeBus, bus);
    declare_value(AVAudioFrameCount, bufferSize);
    declare_nullable_pointer(AVAudioFormat, format);
    declare_callback_function(tapBlock);
    [self installTapOnBus: bus bufferSize: bufferSize format: format
          block:^(AVAudioPCMBuffer * _Nonnull buffer, AVAudioTime * _Nonnull when)
    {
      dispatch_main(^{
        tapBlock("NAVAudioNode::installTapOnBusBufferSizeFormatBlock",
          js_value_id(buffer),
          js_value_AVAudioTime(when));
      });
    }];
  }
}

NAN_METHOD(NAVAudioNode::removeTapOnBus) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioNodeBus, bus);
    [self removeTapOnBus: bus];
  }
}

#include "NAVAudioEngine.h"

NAN_GETTER(NAVAudioNode::engineGetter) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioEngine([self engine]));
  }
}

NAN_GETTER(NAVAudioNode::numberOfInputsGetter) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self numberOfInputs]));
  }
}

NAN_GETTER(NAVAudioNode::numberOfOutputsGetter) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self numberOfOutputs]));
  }
}

NAN_GETTER(NAVAudioNode::lastRenderTimeGetter) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioTime([self lastRenderTime]));
  }
}

#include "NAUAudioUnit.h"

NAN_GETTER(NAVAudioNode::AUAudioUnitGetter) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AUAudioUnit([self AUAudioUnit]));
  }
}

NAN_GETTER(NAVAudioNode::latencyGetter) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self latency]));
  }
}

NAN_GETTER(NAVAudioNode::outputPresentationLatencyGetter) {
  JS_UNWRAP(AVAudioNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self outputPresentationLatency]));
  }
}
