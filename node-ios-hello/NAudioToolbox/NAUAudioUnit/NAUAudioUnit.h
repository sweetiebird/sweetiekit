//
//  NAUAudioUnit.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAUAudioUnit_h
#define NAUAudioUnit_h    

#include "NNSObject.h"

#define js_value_AUAudioUnit(x) js_value_wrapper(x, AUAudioUnit)
#define to_value_AUAudioUnit(x) to_value_wrapper(x, AUAudioUnit)
#define is_value_AUAudioUnit(x) is_value_wrapper(x, AUAudioUnit)

// AudioToolbox constants
#define js_value_AUEventSampleTime js_value_int64_t
#define to_value_AUEventSampleTime to_value_int64_t
#define is_value_AUEventSampleTime is_value_int64_t

#define js_value_AudioComponentInstantiationOptions(x) JS_OPTS(AudioComponentInstantiationOptions, NSUInteger, x)
#define to_value_AudioComponentInstantiationOptions(x) TO_OPTS(AudioComponentInstantiationOptions, NSUInteger, x)
#define is_value_AudioComponentInstantiationOptions(x) IS_OPTS(AudioComponentInstantiationOptions, NSUInteger, x)

#define js_value_OSStatus js_value_int32_t
#define to_value_OSStatus to_value_int32_t
#define is_value_OSStatus is_value_int32_t

#define js_value_OSType js_value_uint32_t
#define to_value_OSType to_value_uint32_t
#define is_value_OSType is_value_uint32_t

#define js_value_AUAudioUnitStatus js_value_OSStatus
#define to_value_AUAudioUnitStatus to_value_OSStatus
#define is_value_AUAudioUnitStatus is_value_OSStatus

#define js_value_AUEventSampleTime js_value_int64_t
#define to_value_AUEventSampleTime to_value_int64_t
#define is_value_AUEventSampleTime is_value_int64_t

#define js_value_AUAudioFrameCount js_value_uint32_t
#define to_value_AUAudioFrameCount to_value_uint32_t
#define is_value_AUAudioFrameCount is_value_uint32_t

#define js_value_AUAudioChannelCount js_value_uint32_t
#define to_value_AUAudioChannelCount to_value_uint32_t
#define is_value_AUAudioChannelCount is_value_uint32_t

#define js_value_AUAudioUnitBusType(x) JS_ENUM(AUAudioUnitBusType, NSInteger, x)
#define to_value_AUAudioUnitBusType(x) TO_ENUM(AUAudioUnitBusType, NSInteger, x)
#define is_value_AUAudioUnitBusType(x) IS_ENUM(AUAudioUnitBusType, NSInteger, x)

#define js_value_AudioObjectID js_value_uint32_t
#define to_value_AudioObjectID to_value_uint32_t
#define is_value_AudioObjectID is_value_uint32_t

JS_WRAP_CLASS(AUAudioUnit, NSObject);
// AUAudioUnit
  JS_STATIC_METHOD(instantiateWithComponentDescriptionOptionsCompletionHandler);
  JS_STATIC_METHOD(initWithComponentDescriptionOptionsError);
  JS_STATIC_METHOD(initWithComponentDescriptionError);
  JS_METHOD(allocateRenderResourcesAndReturnError);
  JS_METHOD(deallocateRenderResources);
  JS_METHOD(reset);
  JS_METHOD(tokenByAddingRenderObserver);
  JS_METHOD(removeRenderObserver);
  JS_METHOD(parametersForOverviewWithCount);
  JS_METHOD(profileStateForCableChannel);
  JS_METHOD(enableProfile);
  JS_METHOD(disableProfile);
  JS_METHOD(setDeviceIDError);
  JS_METHOD(startHardwareAndReturnError);
  JS_METHOD(stopHardware);
#if TODO
// AUAudioUnitBusArray
  JS_STATIC_METHOD(init);
  JS_STATIC_METHOD(initWithAudioUnitBusTypeBusses);
  JS_STATIC_METHOD(initWithAudioUnitBusType);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(setBusCountError);
  JS_METHOD(addObserverToAllBussesForKeyPathOptionsContext);
  JS_METHOD(removeObserverFromAllBussesForKeyPathContext);
// AUAudioUnitBus
  JS_METHOD(setFormatError);
#endif
// AUAudioUnit
  JS_PROP_READONLY(componentDescription);
  JS_PROP_READONLY(component);
  JS_PROP_READONLY(componentName);
  JS_PROP_READONLY(audioUnitName);
  JS_PROP_READONLY(manufacturerName);
  JS_PROP_READONLY(audioUnitShortName);
  JS_PROP_READONLY(componentVersion);
  JS_PROP_READONLY(renderResourcesAllocated);
  JS_PROP_READONLY(inputBusses);
  JS_PROP_READONLY(outputBusses);
  JS_PROP_READONLY(renderBlock);
  JS_PROP_READONLY(scheduleParameterBlock);
  JS_PROP(maximumFramesToRender);
  JS_PROP_READONLY(parameterTree);
  JS_PROP_READONLY(allParameterValues);
  JS_PROP_READONLY(isMusicDeviceOrEffect);
  JS_PROP_READONLY(virtualMIDICableCount);
  JS_PROP_READONLY(scheduleMIDIEventBlock);
  JS_PROP_READONLY(MIDIOutputNames);
  JS_PROP_READONLY(providesUserInterface);
  JS_PROP(MIDIOutputEventBlock);
  JS_PROP(fullState);
  JS_PROP(fullStateForDocument);
  JS_PROP_READONLY(factoryPresets);
  JS_PROP(currentPreset);
  JS_PROP_READONLY(latency);
  JS_PROP_READONLY(tailTime);
  JS_PROP(renderQuality);
  JS_PROP(shouldBypassEffect);
  JS_PROP_READONLY(canProcessInPlace);
  JS_PROP(isRenderingOffline);
  JS_PROP_READONLY(channelCapabilities);
  JS_PROP(musicalContextBlock);
  JS_PROP(transportStateBlock);
  JS_PROP(contextName);
  JS_PROP_READONLY(supportsMPE);
  JS_PROP(channelMap);
  JS_PROP(profileChangedBlock);
  JS_PROP_READONLY(canPerformInput);
  JS_PROP_READONLY(canPerformOutput);
  JS_PROP(isInputEnabled);
  JS_PROP(isOutputEnabled);
  JS_PROP(outputProvider);
  JS_PROP(inputHandler);
  JS_PROP_READONLY(deviceID);
  JS_PROP_READONLY(deviceInputLatency);
  JS_PROP_READONLY(deviceOutputLatency);
  JS_PROP_READONLY(isRunning);
#if TODO
// AUAudioUnitBusArray
  JS_PROP_READONLY(count);
  JS_PROP_READONLY(isCountChangeable);
  JS_PROP_READONLY(ownerAudioUnit);
  JS_PROP_READONLY(busType);
// AUAudioUnitBus
  JS_PROP_READONLY(format);
  JS_PROP(shouldAllocateBuffer);
  JS_PROP(isEnabled);
  JS_PROP(name);
  JS_PROP_READONLY(index);
  JS_PROP_READONLY(busType);
  JS_PROP_READONLY(ownerAudioUnit);
  JS_PROP_READONLY(supportedChannelLayoutTags);
  JS_PROP(contextPresentationLatency);
// AUAudioUnitPreset
  JS_PROP(number);
  JS_PROP(name);
#endif
JS_WRAP_CLASS_END(AUAudioUnit);

#endif /* NAUAudioUnit_h */
