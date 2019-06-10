//
//  NAVAudioEngine.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioEngine_h
#define NAVAudioEngine_h    

#include "NNSObject.h"

#define js_value_AVAudioEngine(x) js_value_wrapper(x, AVAudioEngine)
#define to_value_AVAudioEngine(x) to_value_wrapper(x, AVAudioEngine)
#define is_value_AVAudioEngine(x) is_value_wrapper(x, AVAudioEngine)

// AVFoundation constants
#define js_value_AVAudioEngineManualRenderingMode(x) JS_ENUM(AVAudioEngineManualRenderingMode, NSInteger, x)
#define to_value_AVAudioEngineManualRenderingMode(x) TO_ENUM(AVAudioEngineManualRenderingMode, NSInteger, x)
#define is_value_AVAudioEngineManualRenderingMode(x) IS_ENUM(AVAudioEngineManualRenderingMode, NSInteger, x)

#define js_value_AVAudioEngineManualRenderingStatus(x) JS_ENUM(AVAudioEngineManualRenderingStatus, NSInteger, x)
#define to_value_AVAudioEngineManualRenderingStatus(x) TO_ENUM(AVAudioEngineManualRenderingStatus, NSInteger, x)
#define is_value_AVAudioEngineManualRenderingStatus(x) IS_ENUM(AVAudioEngineManualRenderingStatus, NSInteger, x)

Local<Value> js_value_MusicSequence(MusicSequence _Nullable value);
MusicSequence _Nullable to_value_MusicSequence(const Local<Value>& value, bool* _Nullable failed = nullptr);
bool is_value_MusicSequence(const Local<Value>& value);

JS_WRAP_CLASS(AVAudioEngine, NSObject);
  JS_STATIC_METHOD(init);
  JS_METHOD(attachNode);
  JS_METHOD(detachNode);
  JS_METHOD(connectToFromBusToBusFormat);
  JS_METHOD(connectToFormat);
  JS_METHOD(connectToConnectionPointsFromBusFormat);
  JS_METHOD(disconnectNodeInputBus);
  JS_METHOD(disconnectNodeInput);
  JS_METHOD(disconnectNodeOutputBus);
  JS_METHOD(disconnectNodeOutput);
  JS_METHOD(prepare);
  JS_METHOD(startAndReturnError);
  JS_METHOD(pause);
  JS_METHOD(reset);
  JS_METHOD(stop);
  JS_METHOD(inputConnectionPointForNodeInputBus);
  JS_METHOD(outputConnectionPointsForNodeOutputBus);
  JS_METHOD(enableManualRenderingModeFormatMaximumFrameCountError);
  JS_METHOD(disableManualRenderingMode);
  JS_METHOD(renderOfflineToBufferError);
  JS_METHOD(connectMIDIToFormatBlock);
  JS_METHOD(connectMIDIToNodesFormatBlock);
  JS_METHOD(disconnectMIDIFrom);
  JS_METHOD(disconnectMIDIFromNodes);
  JS_METHOD(disconnectMIDIInput);
  JS_METHOD(disconnectMIDIOutput);
  JS_PROP(musicSequence);
  JS_PROP_READONLY(outputNode);
  JS_PROP_READONLY(inputNode);
  JS_PROP_READONLY(mainMixerNode);
  JS_PROP_READONLY(isRunning);
  JS_PROP(isAutoShutdownEnabled);
  JS_PROP_READONLY(manualRenderingBlock);
  JS_PROP_READONLY(isInManualRenderingMode);
  JS_PROP_READONLY(manualRenderingMode);
  JS_PROP_READONLY(manualRenderingFormat);
  JS_PROP_READONLY(manualRenderingMaximumFrameCount);
  JS_PROP_READONLY(manualRenderingSampleTime);
JS_WRAP_CLASS_END(AVAudioEngine);

#endif /* NAVAudioEngine_h */
