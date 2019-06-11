//
//  NAVAudioEngine.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioEngine.h"

Local<Value> js_value_MusicSequence(MusicSequence _Nullable data)
{
  if (!data) {
    return Nan::Undefined();
  }
  JS_TODO(Nan::Undefined());
}

MusicSequence _Nullable to_value_MusicSequence(const Local<Value>& value, bool * _Nullable failed)
{
  if (failed) {
    *failed = false;
  }
  
  if (!is_value_MusicSequence(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected MusicSequence");
    }
    return nil;
  }
  
  JS_TODO(nil);
}

bool is_value_MusicSequence(const Local<Value>& value)
{
  return false; // TODO
}

#define instancetype AVAudioEngine
#define js_value_instancetype js_value_AVAudioEngine

NAVAudioEngine::NAVAudioEngine() {}
NAVAudioEngine::~NAVAudioEngine() {}

JS_INIT_CLASS(AVAudioEngine, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(attachNode);
  JS_ASSIGN_PROTO_METHOD(detachNode);
  JS_ASSIGN_PROTO_METHOD(connectToFromBusToBusFormat);
  JS_ASSIGN_PROTO_METHOD(connectToFormat);
  JS_ASSIGN_PROTO_METHOD(connectToConnectionPointsFromBusFormat);
  JS_ASSIGN_PROTO_METHOD(disconnectNodeInputBus);
  JS_ASSIGN_PROTO_METHOD(disconnectNodeInput);
  JS_ASSIGN_PROTO_METHOD(disconnectNodeOutputBus);
  JS_ASSIGN_PROTO_METHOD(disconnectNodeOutput);
  JS_ASSIGN_PROTO_METHOD(prepare);
  JS_ASSIGN_PROTO_METHOD(startAndReturnError);
  JS_ASSIGN_PROTO_METHOD(pause);
  JS_ASSIGN_PROTO_METHOD(reset);
  JS_ASSIGN_PROTO_METHOD(stop);
  JS_ASSIGN_PROTO_METHOD(inputConnectionPointForNodeInputBus);
  JS_ASSIGN_PROTO_METHOD(outputConnectionPointsForNodeOutputBus);
  JS_ASSIGN_PROTO_METHOD(enableManualRenderingModeFormatMaximumFrameCountError);
  JS_ASSIGN_PROTO_METHOD(disableManualRenderingMode);
  JS_ASSIGN_PROTO_METHOD(renderOfflineToBufferError);
  JS_ASSIGN_PROTO_METHOD(connectMIDIToFormatBlock);
  JS_ASSIGN_PROTO_METHOD(connectMIDIToNodesFormatBlock);
  JS_ASSIGN_PROTO_METHOD(disconnectMIDIFrom);
  JS_ASSIGN_PROTO_METHOD(disconnectMIDIFromNodes);
  JS_ASSIGN_PROTO_METHOD(disconnectMIDIInput);
  JS_ASSIGN_PROTO_METHOD(disconnectMIDIOutput);
  JS_ASSIGN_PROTO_PROP(musicSequence);
  JS_ASSIGN_PROTO_PROP_READONLY(outputNode);
  JS_ASSIGN_PROTO_PROP_READONLY(inputNode);
  JS_ASSIGN_PROTO_PROP_READONLY(mainMixerNode);
  JS_ASSIGN_PROTO_PROP_READONLY(isRunning);
  JS_ASSIGN_PROTO_PROP(isAutoShutdownEnabled);
  JS_ASSIGN_PROTO_PROP_READONLY(manualRenderingBlock);
  JS_ASSIGN_PROTO_PROP_READONLY(isInManualRenderingMode);
  JS_ASSIGN_PROTO_PROP_READONLY(manualRenderingMode);
  JS_ASSIGN_PROTO_PROP_READONLY(manualRenderingFormat);
  JS_ASSIGN_PROTO_PROP_READONLY(manualRenderingMaximumFrameCount);
  JS_ASSIGN_PROTO_PROP_READONLY(manualRenderingSampleTime);

  // static members (ctor)
  JS_INIT_CTOR(AVAudioEngine, NSObject);
  JS_ASSIGN_STATIC_METHOD(init);
JS_INIT_CLASS_END(AVAudioEngine, NSObject);

NAN_METHOD(NAVAudioEngine::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioEngine(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioEngine, info);
      return;
    }

    AVAudioEngine* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioEngine *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioEngine alloc] init];
    }
    if (self) {
      NAVAudioEngine *wrapper = new NAVAudioEngine();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioEngine::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVAudioEngine::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[AVAudioEngine alloc] init]));
  }
}

#include "NAVAudioNode.h"

NAN_METHOD(NAVAudioEngine::attachNode) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    [self attachNode: node];
  }
}

NAN_METHOD(NAVAudioEngine::detachNode) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    [self detachNode: node];
  }
}

#include "NAVAudioFormat.h"

NAN_METHOD(NAVAudioEngine::connectToFromBusToBusFormat) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node1);
    declare_pointer(AVAudioNode, node2);
    declare_value(AVAudioNodeBus, bus1);
    declare_value(AVAudioNodeBus, bus2);
    declare_nullable_pointer(AVAudioFormat, format);
    [self connect: node1 to: node2 fromBus: bus1 toBus: bus2 format: format];
  }
}

NAN_METHOD(NAVAudioEngine::connectToFormat) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node1);
    declare_pointer(AVAudioNode, node2);
    declare_nullable_pointer(AVAudioFormat, format);
    [self connect: node1 to: node2 format: format];
  }
}

NAN_METHOD(NAVAudioEngine::connectToConnectionPointsFromBusFormat) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, sourceNode);
    declare_pointer(NSArray<AVAudioConnectionPoint*>, destNodes);
    declare_value(AVAudioNodeBus, sourceBus);
    declare_nullable_pointer(AVAudioFormat, format);
    [self connect: sourceNode toConnectionPoints: destNodes fromBus: sourceBus format: format];
  }
}

NAN_METHOD(NAVAudioEngine::disconnectNodeInputBus) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    declare_value(AVAudioNodeBus, bus);
    [self disconnectNodeInput: node bus: bus];
  }
}

NAN_METHOD(NAVAudioEngine::disconnectNodeInput) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    [self disconnectNodeInput: node];
  }
}

NAN_METHOD(NAVAudioEngine::disconnectNodeOutputBus) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    declare_value(AVAudioNodeBus, bus);
    [self disconnectNodeOutput: node bus: bus];
  }
}

NAN_METHOD(NAVAudioEngine::disconnectNodeOutput) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    [self disconnectNodeOutput: node];
  }
}

NAN_METHOD(NAVAudioEngine::prepare) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    [self prepare];
  }
}

NAN_METHOD(NAVAudioEngine::startAndReturnError) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self startAndReturnError: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioEngine::pause) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    [self pause];
  }
}

NAN_METHOD(NAVAudioEngine::reset) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    [self reset];
  }
}

NAN_METHOD(NAVAudioEngine::stop) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    [self stop];
  }
}

#include "NAVAudioConnectionPoint.h"

NAN_METHOD(NAVAudioEngine::inputConnectionPointForNodeInputBus) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    declare_value(AVAudioNodeBus, bus);
    JS_SET_RETURN(js_value_AVAudioConnectionPoint([self inputConnectionPointForNode: node inputBus: bus]));
  }
}

NAN_METHOD(NAVAudioEngine::outputConnectionPointsForNodeOutputBus) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    declare_value(AVAudioNodeBus, bus);
    JS_SET_RETURN(js_value_NSArray<AVAudioConnectionPoint*>([self outputConnectionPointsForNode: node outputBus: bus]));
  }
}

NAN_METHOD(NAVAudioEngine::enableManualRenderingModeFormatMaximumFrameCountError) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioEngineManualRenderingMode, mode);
    declare_pointer(AVAudioFormat, pcmFormat);
    declare_value(AVAudioFrameCount, maximumFrameCount);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self enableManualRenderingMode: mode format: pcmFormat maximumFrameCount: maximumFrameCount error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioEngine::disableManualRenderingMode) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    [self disableManualRenderingMode];
  }
}

#include "NAVAudioPCMBuffer.h"

NAN_METHOD(NAVAudioEngine::renderOfflineToBufferError) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioFrameCount, numberOfFrames);
    declare_pointer(AVAudioPCMBuffer, buffer);
    declare_error();
    JS_SET_RETURN(js_value_AVAudioEngineManualRenderingStatus([self renderOffline: numberOfFrames toBuffer: buffer error: &error]));
    js_panic_NSError(error);
  }
}

#include "NAUAudioUnit.h"

NAN_METHOD(NAVAudioEngine::connectMIDIToFormatBlock) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, sourceNode);
    declare_pointer(AVAudioNode, destinationNode);
    declare_nullable_pointer(AVAudioFormat, format);
    declare_callback_function(tapBlock);
    [self connectMIDI: sourceNode to: destinationNode format: format
          block:^OSStatus(AUEventSampleTime eventSampleTime,
                          uint8_t cable, NSInteger length,
                          const uint8_t * _Nonnull midiBytes)
    {
      __block OSStatus result = (OSStatus)0;
      dispatch_main(^{
        auto ret = tapBlock("NAVAudioEngine::connectMIDIToFormatBlock",
            js_value_AUEventSampleTime(eventSampleTime),
            js_value_uint8_t(cable),
            js_value_NSInteger(length),
            js_value_ArrayBuffer(midiBytes, length)
          );
        if (!is_value_int32_t(ret)) {
          js_panic_noreturn("Expected result to be a int32_t");
        } else {
          result = to_value_int32_t(ret);
        }
      });
      return result;
    }];
  }
}

NAN_METHOD(NAVAudioEngine::connectMIDIToNodesFormatBlock) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, sourceNode);
    declare_pointer(NSArray<AVAudioNode*>, destinationNodes);
    declare_nullable_pointer(AVAudioFormat, format);
    declare_callback_function(tapBlock);
    [self connectMIDI: sourceNode toNodes: destinationNodes format: format
          block:^OSStatus(AUEventSampleTime eventSampleTime, uint8_t cable, NSInteger length, const uint8_t * _Nonnull midiBytes)
    {
      __block OSStatus result = (OSStatus)0;
      dispatch_main(^{
        auto ret = tapBlock("NAVAudioEngine::connectMIDIToFormatBlock",
            js_value_AUEventSampleTime(eventSampleTime),
            js_value_uint8_t(cable),
            js_value_NSInteger(length),
            js_value_ArrayBuffer(midiBytes, length)
          );
        if (!is_value_int32_t(ret)) {
          js_panic_noreturn("Expected result to be a int32_t");
        } else {
          result = to_value_int32_t(ret);
        }
      });
      return result;
    }];
  }
}

NAN_METHOD(NAVAudioEngine::disconnectMIDIFrom) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, sourceNode);
    declare_pointer(AVAudioNode, destinationNode);
    [self disconnectMIDI: sourceNode from: destinationNode];
  }
}

NAN_METHOD(NAVAudioEngine::disconnectMIDIFromNodes) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, sourceNode);
    declare_pointer(NSArray<AVAudioNode*>, destinationNodes);
    [self disconnectMIDI: sourceNode fromNodes: destinationNodes];
  }
}

NAN_METHOD(NAVAudioEngine::disconnectMIDIInput) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    [self disconnectMIDIInput: node];
  }
}

NAN_METHOD(NAVAudioEngine::disconnectMIDIOutput) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioNode, node);
    [self disconnectMIDIOutput: node];
  }
}

NAN_GETTER(NAVAudioEngine::musicSequenceGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MusicSequence([self musicSequence]));
  }
}

NAN_SETTER(NAVAudioEngine::musicSequenceSetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MusicSequence, input);
    [self setMusicSequence: input];
  }
}

#include "NAVAudioOutputNode.h"

NAN_GETTER(NAVAudioEngine::outputNodeGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioOutputNode([self outputNode]));
  }
}

#include "NAVAudioInputNode.h"

NAN_GETTER(NAVAudioEngine::inputNodeGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioInputNode([self inputNode]));
  }
}

#include "NAVAudioMixerNode.h"

NAN_GETTER(NAVAudioEngine::mainMixerNodeGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioMixerNode([self mainMixerNode]));
  }
}

NAN_GETTER(NAVAudioEngine::isRunningGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRunning]));
  }
}

NAN_GETTER(NAVAudioEngine::isAutoShutdownEnabledGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAutoShutdownEnabled]));
  }
}

NAN_SETTER(NAVAudioEngine::isAutoShutdownEnabledSetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutoShutdownEnabled: input];
  }
}

NAN_GETTER(NAVAudioEngine::manualRenderingBlockGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AVAudioEngineManualRenderingBlock([self manualRenderingBlock]));
    #endif
  }
}

NAN_GETTER(NAVAudioEngine::isInManualRenderingModeGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isInManualRenderingMode]));
  }
}

NAN_GETTER(NAVAudioEngine::manualRenderingModeGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioEngineManualRenderingMode([self manualRenderingMode]));
  }
}

NAN_GETTER(NAVAudioEngine::manualRenderingFormatGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFormat([self manualRenderingFormat]));
  }
}

NAN_GETTER(NAVAudioEngine::manualRenderingMaximumFrameCountGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFrameCount([self manualRenderingMaximumFrameCount]));
  }
}

NAN_GETTER(NAVAudioEngine::manualRenderingSampleTimeGetter) {
  JS_UNWRAP(AVAudioEngine, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFramePosition([self manualRenderingSampleTime]));
  }
}
