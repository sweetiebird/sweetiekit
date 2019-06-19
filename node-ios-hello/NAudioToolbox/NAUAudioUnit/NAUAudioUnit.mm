//
//  NAUAudioUnit.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAUAudioUnit.h"

#define instancetype AUAudioUnit
#define js_value_instancetype js_value_AUAudioUnit

NAUAudioUnit::NAUAudioUnit() {}
NAUAudioUnit::~NAUAudioUnit() {}

JS_INIT_CLASS(AUAudioUnit, NSObject);
  // instance members (proto)
// AUAudioUnit
  JS_ASSIGN_PROTO_METHOD(allocateRenderResourcesAndReturnError);
  JS_ASSIGN_PROTO_METHOD(deallocateRenderResources);
  JS_ASSIGN_PROTO_METHOD(reset);
  JS_ASSIGN_PROTO_METHOD(tokenByAddingRenderObserver);
  JS_ASSIGN_PROTO_METHOD(removeRenderObserver);
  JS_ASSIGN_PROTO_METHOD(parametersForOverviewWithCount);
  JS_ASSIGN_PROTO_METHOD(profileStateForCableChannel);
  JS_ASSIGN_PROTO_METHOD(enableProfile);
  JS_ASSIGN_PROTO_METHOD(disableProfile);
  JS_ASSIGN_PROTO_METHOD(setDeviceIDError);
  JS_ASSIGN_PROTO_METHOD(startHardwareAndReturnError);
  JS_ASSIGN_PROTO_METHOD(stopHardware);
#if TODO
// AUAudioUnitBusArray
  JS_ASSIGN_PROTO_METHOD(objectAtIndexedSubscript);
  JS_ASSIGN_PROTO_METHOD(setBusCountError);
  JS_ASSIGN_PROTO_METHOD(addObserverToAllBussesForKeyPathOptionsContext);
  JS_ASSIGN_PROTO_METHOD(removeObserverFromAllBussesForKeyPathContext);
// AUAudioUnitBus
  JS_ASSIGN_PROTO_METHOD(setFormatError);
#endif
// AUAudioUnit
  JS_ASSIGN_PROTO_PROP_READONLY(componentDescription);
  JS_ASSIGN_PROTO_PROP_READONLY(component);
  JS_ASSIGN_PROTO_PROP_READONLY(componentName);
  JS_ASSIGN_PROTO_PROP_READONLY(audioUnitName);
  JS_ASSIGN_PROTO_PROP_READONLY(manufacturerName);
  JS_ASSIGN_PROTO_PROP_READONLY(audioUnitShortName);
  JS_ASSIGN_PROTO_PROP_READONLY(componentVersion);
  JS_ASSIGN_PROTO_PROP_READONLY(renderResourcesAllocated);
  JS_ASSIGN_PROTO_PROP_READONLY(inputBusses);
  JS_ASSIGN_PROTO_PROP_READONLY(outputBusses);
  JS_ASSIGN_PROTO_PROP_READONLY(renderBlock);
  JS_ASSIGN_PROTO_PROP_READONLY(scheduleParameterBlock);
  JS_ASSIGN_PROTO_PROP(maximumFramesToRender);
  JS_ASSIGN_PROTO_PROP_READONLY(parameterTree);
  JS_ASSIGN_PROTO_PROP_READONLY(allParameterValues);
  JS_ASSIGN_PROTO_PROP_READONLY(isMusicDeviceOrEffect);
  JS_ASSIGN_PROTO_PROP_READONLY(virtualMIDICableCount);
  JS_ASSIGN_PROTO_PROP_READONLY(scheduleMIDIEventBlock);
  JS_ASSIGN_PROTO_PROP_READONLY(MIDIOutputNames);
  JS_ASSIGN_PROTO_PROP_READONLY(providesUserInterface);
  JS_ASSIGN_PROTO_PROP(MIDIOutputEventBlock);
  JS_ASSIGN_PROTO_PROP(fullState);
  JS_ASSIGN_PROTO_PROP(fullStateForDocument);
  JS_ASSIGN_PROTO_PROP_READONLY(factoryPresets);
  JS_ASSIGN_PROTO_PROP(currentPreset);
  JS_ASSIGN_PROTO_PROP_READONLY(latency);
  JS_ASSIGN_PROTO_PROP_READONLY(tailTime);
  JS_ASSIGN_PROTO_PROP(renderQuality);
  JS_ASSIGN_PROTO_PROP(shouldBypassEffect);
  JS_ASSIGN_PROTO_PROP_READONLY(canProcessInPlace);
  JS_ASSIGN_PROTO_PROP(isRenderingOffline);
  JS_ASSIGN_PROTO_PROP_READONLY(channelCapabilities);
  JS_ASSIGN_PROTO_PROP(musicalContextBlock);
  JS_ASSIGN_PROTO_PROP(transportStateBlock);
  JS_ASSIGN_PROTO_PROP(contextName);
  JS_ASSIGN_PROTO_PROP_READONLY(supportsMPE);
  JS_ASSIGN_PROTO_PROP(channelMap);
  JS_ASSIGN_PROTO_PROP(profileChangedBlock);
  JS_ASSIGN_PROTO_PROP_READONLY(canPerformInput);
  JS_ASSIGN_PROTO_PROP_READONLY(canPerformOutput);
  JS_ASSIGN_PROTO_PROP(isInputEnabled);
  JS_ASSIGN_PROTO_PROP(isOutputEnabled);
  JS_ASSIGN_PROTO_PROP(outputProvider);
  JS_ASSIGN_PROTO_PROP(inputHandler);
  JS_ASSIGN_PROTO_PROP_READONLY(deviceID);
  JS_ASSIGN_PROTO_PROP_READONLY(deviceInputLatency);
  JS_ASSIGN_PROTO_PROP_READONLY(deviceOutputLatency);
  JS_ASSIGN_PROTO_PROP_READONLY(isRunning);
#if TODO
// AUAudioUnitBusArray
  JS_ASSIGN_PROTO_PROP_READONLY(count);
  JS_ASSIGN_PROTO_PROP_READONLY(isCountChangeable);
  JS_ASSIGN_PROTO_PROP_READONLY(ownerAudioUnit);
  JS_ASSIGN_PROTO_PROP_READONLY(busType);
// AUAudioUnitBus
  JS_ASSIGN_PROTO_PROP_READONLY(format);
  JS_ASSIGN_PROTO_PROP(shouldAllocateBuffer);
  JS_ASSIGN_PROTO_PROP(isEnabled);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP_READONLY(index);
  JS_ASSIGN_PROTO_PROP_READONLY(busType);
  JS_ASSIGN_PROTO_PROP_READONLY(ownerAudioUnit);
  JS_ASSIGN_PROTO_PROP_READONLY(supportedChannelLayoutTags);
  JS_ASSIGN_PROTO_PROP(contextPresentationLatency);
// AUAudioUnitPreset
  JS_ASSIGN_PROTO_PROP(number);
  JS_ASSIGN_PROTO_PROP(name);
#endif

  // static members (ctor)
  JS_INIT_CTOR(AUAudioUnit, NSObject);
  JS_ASSIGN_STATIC_METHOD(instantiateWithComponentDescriptionOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(initWithComponentDescriptionOptionsError);
  JS_ASSIGN_PROTO_METHOD(initWithComponentDescriptionError);
#if TODO
// AUAudioUnitBusArray
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithAudioUnitBusTypeBusses);
  JS_ASSIGN_PROTO_METHOD(initWithAudioUnitBusType);
#endif
JS_INIT_CLASS_END(AUAudioUnit, NSObject);

NAN_METHOD(NAUAudioUnit::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AUAudioUnit(...)', turn into construct call.
      JS_SET_RETURN_NEW(AUAudioUnit, info);
      return;
    }

    AUAudioUnit* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AUAudioUnit *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAUAudioUnit *wrapper = new NAUAudioUnit();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AUAudioUnit::New: invalid arguments");
    }
  }
}

#include "NCoreAudioTypes.h"

NAN_METHOD(NAUAudioUnit::instantiateWithComponentDescriptionOptionsCompletionHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioComponentDescription, componentDescription);
    declare_value(AudioComponentInstantiationOptions, options);
    [AUAudioUnit instantiateWithComponentDescription: componentDescription options: options
      completionHandler:^(AUAudioUnit * _Nullable audioUnit, NSError * _Nullable error) {

    }];
  }
}

NAN_METHOD(NAUAudioUnit::initWithComponentDescriptionOptionsError) {
  JS_UNWRAP_OR_ALLOC(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioComponentDescription, componentDescription);
    declare_value(AudioComponentInstantiationOptions, options);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([self initWithComponentDescription: componentDescription options: options error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAUAudioUnit::initWithComponentDescriptionError) {
  JS_UNWRAP_OR_ALLOC(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioComponentDescription, componentDescription);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([self initWithComponentDescription: componentDescription error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAUAudioUnit::allocateRenderResourcesAndReturnError) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_args();
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self allocateRenderResourcesAndReturnError: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAUAudioUnit::deallocateRenderResources) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    [self deallocateRenderResources];
  }
}

NAN_METHOD(NAUAudioUnit::reset) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    [self reset];
  }
}

NAN_METHOD(NAUAudioUnit::tokenByAddingRenderObserver) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(AURenderObserver, observer);
    JS_SET_RETURN(js_value_NSInteger([self tokenByAddingRenderObserver: observer]));
    #endif
  }
}

NAN_METHOD(NAUAudioUnit::removeRenderObserver) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, token);
    [self removeRenderObserver: token];
  }
}

NAN_METHOD(NAUAudioUnit::parametersForOverviewWithCount) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, count);
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self parametersForOverviewWithCount: count]));
  }
}

NAN_METHOD(NAUAudioUnit::profileStateForCableChannel) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(uint8_t, cable);
    declare_value(MIDIChannelNumber, channel);
    JS_SET_RETURN(js_value_MIDICIProfileState([self profileStateForCable: cable channel: channel]));
    #endif
  }
}

NAN_METHOD(NAUAudioUnit::enableProfile) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(MIDICIProfile, profile);
    JS_SET_RETURN(js_value_BOOL([self enableProfile: profile]));
    #endif
  }
}

NAN_METHOD(NAUAudioUnit::disableProfile) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(MIDICIProfile, profile);
    JS_SET_RETURN(js_value_BOOL([self disableProfile: profile]));
    #endif
  }
}

NAN_METHOD(NAUAudioUnit::setDeviceIDError) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(AudioObjectID, deviceID);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setDeviceID: deviceID error: &error]));
    js_panic_NSError(error);
    #endif
  }
}

NAN_METHOD(NAUAudioUnit::startHardwareAndReturnError) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_args();
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self startHardwareAndReturnError: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAUAudioUnit::stopHardware) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    [self stopHardware];
  }
}

#if TODO
NAN_METHOD(NAUAudioUnitBusArray::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[AUAudioUnitBusArray alloc] init]));
  }
}

NAN_METHOD(NAUAudioUnitBusArray::initWithAudioUnitBusTypeBusses) {
  JS_UNWRAP_OR_ALLOC(AUAudioUnitBusArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AUAudioUnit, owner);
    declare_value(AUAudioUnitBusType, busType);
    declare_pointer(NSArray<AUAudioUnitBus*>, busArray);
    JS_SET_RETURN(js_value_instancetype([self initWithAudioUnit: owner busType: busType busses: busArray]));
  }
}

NAN_METHOD(NAUAudioUnitBusArray::initWithAudioUnitBusType) {
  JS_UNWRAP_OR_ALLOC(AUAudioUnitBusArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AUAudioUnit, owner);
    declare_value(AUAudioUnitBusType, busType);
    JS_SET_RETURN(js_value_instancetype([self initWithAudioUnit: owner busType: busType]));
  }
}

NAN_METHOD(NAUAudioUnitBusArray::objectAtIndexedSubscript) {
  JS_UNWRAP(AUAudioUnitBusArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index);
    JS_SET_RETURN(js_value_AUAudioUnitBus([self objectAtIndexedSubscript: index]));
  }
}

NAN_METHOD(NAUAudioUnitBusArray::setBusCountError) {
  JS_UNWRAP(AUAudioUnitBusArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, count);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setBusCount: count error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAUAudioUnitBusArray::addObserverToAllBussesForKeyPathOptionsContext) {
  JS_UNWRAP(AUAudioUnitBusArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSObject, observer);
    declare_pointer(NSString, keyPath);
    declare_value(NSKeyValueObservingOptions, options);
    declare_value(void-pointer-__nullable, context);
    [self addObserverToAllBusses: observer forKeyPath: keyPath options: options context: context];
  }
}

NAN_METHOD(NAUAudioUnitBusArray::removeObserverFromAllBussesForKeyPathContext) {
  JS_UNWRAP(AUAudioUnitBusArray, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSObject, observer);
    declare_pointer(NSString, keyPath);
    declare_value(void-pointer-__nullable, context);
    [self removeObserverFromAllBusses: observer forKeyPath: keyPath context: context];
  }
}

NAN_METHOD(NAUAudioUnitBus::setFormatError) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioFormat, format);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setFormat: format error: &error]));
    js_panic_NSError(error);
  }
}
#endif

#include "NCoreAudioTypes.h"

NAN_GETTER(NAUAudioUnit::componentDescriptionGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AudioComponentDescription([self componentDescription]));
  }
}

NAN_GETTER(NAUAudioUnit::componentGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AudioComponent([self component]));
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::componentNameGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self componentName]));
  }
}

NAN_GETTER(NAUAudioUnit::audioUnitNameGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self audioUnitName]));
  }
}

NAN_GETTER(NAUAudioUnit::manufacturerNameGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self manufacturerName]));
  }
}

NAN_GETTER(NAUAudioUnit::audioUnitShortNameGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self audioUnitShortName]));
  }
}

NAN_GETTER(NAUAudioUnit::componentVersionGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint32_t([self componentVersion]));
  }
}

NAN_GETTER(NAUAudioUnit::renderResourcesAllocatedGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self renderResourcesAllocated]));
  }
}

NAN_GETTER(NAUAudioUnit::inputBussesGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AUAudioUnitBusArray([self inputBusses]));
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::outputBussesGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AUAudioUnitBusArray([self outputBusses]));
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::renderBlockGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AURenderBlock([self renderBlock]));
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::scheduleParameterBlockGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AUScheduleParameterBlock([self scheduleParameterBlock]));
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::maximumFramesToRenderGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AUAudioFrameCount([self maximumFramesToRender]));
  }
}

NAN_SETTER(NAUAudioUnit::maximumFramesToRenderSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AUAudioFrameCount, input);
    [self setMaximumFramesToRender: input];
  }
}

#include "NAUParameterTree.h"

NAN_GETTER(NAUAudioUnit::parameterTreeGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AUParameterTree([self parameterTree]));
  }
}

NAN_GETTER(NAUAudioUnit::allParameterValuesGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allParameterValues]));
  }
}

NAN_GETTER(NAUAudioUnit::isMusicDeviceOrEffectGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMusicDeviceOrEffect]));
  }
}

NAN_GETTER(NAUAudioUnit::virtualMIDICableCountGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self virtualMIDICableCount]));
  }
}

NAN_GETTER(NAUAudioUnit::scheduleMIDIEventBlockGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AUScheduleMIDIEventBlock([self scheduleMIDIEventBlock]));
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::MIDIOutputNamesGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self MIDIOutputNames]));
  }
}

NAN_GETTER(NAUAudioUnit::providesUserInterfaceGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self providesUserInterface]));
  }
}

NAN_GETTER(NAUAudioUnit::MIDIOutputEventBlockGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AUMIDIOutputEventBlock([self MIDIOutputEventBlock]));
    #endif
  }
}

NAN_SETTER(NAUAudioUnit::MIDIOutputEventBlockSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_value(AUMIDIOutputEventBlock, input);
    [self setMIDIOutputEventBlock: input];
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::fullStateGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString, id>*/([self fullState]));
  }
}

NAN_SETTER(NAUAudioUnit::fullStateSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSString, id>*/, input);
    [self setFullState: input];
  }
}

NAN_GETTER(NAUAudioUnit::fullStateForDocumentGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString, id>*/([self fullStateForDocument]));
  }
}

NAN_SETTER(NAUAudioUnit::fullStateForDocumentSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSString, id>*/, input);
    [self setFullStateForDocument: input];
  }
}

NAN_GETTER(NAUAudioUnit::factoryPresetsGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AUAudioUnitPreset*>([self factoryPresets]));
  }
}

#include "NAUAudioUnitPreset.h"

NAN_GETTER(NAUAudioUnit::currentPresetGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AUAudioUnitPreset([self currentPreset]));
  }
}

NAN_SETTER(NAUAudioUnit::currentPresetSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(AUAudioUnitPreset, input);
    [self setCurrentPreset: input];
  }
}

NAN_GETTER(NAUAudioUnit::latencyGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self latency]));
  }
}

NAN_GETTER(NAUAudioUnit::tailTimeGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self tailTime]));
  }
}

NAN_GETTER(NAUAudioUnit::renderQualityGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self renderQuality]));
  }
}

NAN_SETTER(NAUAudioUnit::renderQualitySetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setRenderQuality: input];
  }
}

NAN_GETTER(NAUAudioUnit::shouldBypassEffectGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldBypassEffect]));
  }
}

NAN_SETTER(NAUAudioUnit::shouldBypassEffectSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShouldBypassEffect: input];
  }
}

NAN_GETTER(NAUAudioUnit::canProcessInPlaceGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canProcessInPlace]));
  }
}

NAN_GETTER(NAUAudioUnit::isRenderingOfflineGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRenderingOffline]));
  }
}

NAN_SETTER(NAUAudioUnit::isRenderingOfflineSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRenderingOffline: input];
  }
}

NAN_GETTER(NAUAudioUnit::channelCapabilitiesGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self channelCapabilities]));
  }
}

NAN_GETTER(NAUAudioUnit::musicalContextBlockGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AUHostMusicalContextBlock([self musicalContextBlock]));
    #endif
  }
}

NAN_SETTER(NAUAudioUnit::musicalContextBlockSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_value(AUHostMusicalContextBlock, input);
    [self setMusicalContextBlock: input];
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::transportStateBlockGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AUHostTransportStateBlock([self transportStateBlock]));
    #endif
  }
}

NAN_SETTER(NAUAudioUnit::transportStateBlockSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_value(AUHostTransportStateBlock, input);
    [self setTransportStateBlock: input];
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::contextNameGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self contextName]));
  }
}

NAN_SETTER(NAUAudioUnit::contextNameSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setContextName: input];
  }
}

NAN_GETTER(NAUAudioUnit::supportsMPEGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self supportsMPE]));
  }
}

NAN_GETTER(NAUAudioUnit::channelMapGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self channelMap]));
  }
}

NAN_SETTER(NAUAudioUnit::channelMapSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSNumber*>, input);
    [self setChannelMap: input];
  }
}

NAN_GETTER(NAUAudioUnit::profileChangedBlockGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AUMIDICIProfileChangedBlock([self profileChangedBlock]));
    #endif
  }
}

NAN_SETTER(NAUAudioUnit::profileChangedBlockSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_value(AUMIDICIProfileChangedBlock, input);
    [self setProfileChangedBlock: input];
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::canPerformInputGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canPerformInput]));
  }
}

NAN_GETTER(NAUAudioUnit::canPerformOutputGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canPerformOutput]));
  }
}

NAN_GETTER(NAUAudioUnit::isInputEnabledGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isInputEnabled]));
  }
}

NAN_SETTER(NAUAudioUnit::isInputEnabledSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setInputEnabled: input];
  }
}

NAN_GETTER(NAUAudioUnit::isOutputEnabledGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isOutputEnabled]));
  }
}

NAN_SETTER(NAUAudioUnit::isOutputEnabledSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setOutputEnabled: input];
  }
}

NAN_GETTER(NAUAudioUnit::outputProviderGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AURenderPullInputBlock([self outputProvider]));
    #endif
  }
}

NAN_SETTER(NAUAudioUnit::outputProviderSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_value(AURenderPullInputBlock, input);
    [self setOutputProvider: input];
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::inputHandlerGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AUInputHandler([self inputHandler]));
    #endif
  }
}

NAN_SETTER(NAUAudioUnit::inputHandlerSetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_setter();
    declare_value(AUInputHandler, input);
    [self setInputHandler: input];
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::deviceIDGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AudioObjectID([self deviceID]));
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::deviceInputLatencyGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_NSTimeInterval([self deviceInputLatency]));
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::deviceOutputLatencyGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_NSTimeInterval([self deviceOutputLatency]));
    #endif
  }
}

NAN_GETTER(NAUAudioUnit::isRunningGetter) {
  JS_UNWRAP(AUAudioUnit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRunning]));
  }
}

#if TODO
NAN_GETTER(NAUAudioUnitBusArray::countGetter) {
  JS_UNWRAP(AUAudioUnitBusArray, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self count]));
  }
}

NAN_GETTER(NAUAudioUnitBusArray::isCountChangeableGetter) {
  JS_UNWRAP(AUAudioUnitBusArray, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCountChangeable]));
  }
}

NAN_GETTER(NAUAudioUnitBusArray::ownerAudioUnitGetter) {
  JS_UNWRAP(AUAudioUnitBusArray, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AUAudioUnit([self ownerAudioUnit]));
  }
}

NAN_GETTER(NAUAudioUnitBusArray::busTypeGetter) {
  JS_UNWRAP(AUAudioUnitBusArray, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AUAudioUnitBusType([self busType]));
  }
}

NAN_GETTER(NAUAudioUnitBus::formatGetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFormat([self format]));
  }
}

NAN_GETTER(NAUAudioUnitBus::shouldAllocateBufferGetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldAllocateBuffer]));
  }
}

NAN_SETTER(NAUAudioUnitBus::shouldAllocateBufferSetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShouldAllocateBuffer: input];
  }
}

NAN_GETTER(NAUAudioUnitBus::isEnabledGetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NAUAudioUnitBus::isEnabledSetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnabled: input];
  }
}

NAN_GETTER(NAUAudioUnitBus::nameGetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NAUAudioUnitBus::nameSetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

NAN_GETTER(NAUAudioUnitBus::indexGetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self index]));
  }
}

NAN_GETTER(NAUAudioUnitBus::busTypeGetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AUAudioUnitBusType([self busType]));
  }
}

NAN_GETTER(NAUAudioUnitBus::ownerAudioUnitGetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AUAudioUnit([self ownerAudioUnit]));
  }
}

NAN_GETTER(NAUAudioUnitBus::supportedChannelLayoutTagsGetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self supportedChannelLayoutTags]));
  }
}

NAN_GETTER(NAUAudioUnitBus::contextPresentationLatencyGetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self contextPresentationLatency]));
  }
}

NAN_SETTER(NAUAudioUnitBus::contextPresentationLatencySetter) {
  JS_UNWRAP(AUAudioUnitBus, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setContextPresentationLatency: input];
  }
}

NAN_GETTER(NAUAudioUnitPreset::numberGetter) {
  JS_UNWRAP(AUAudioUnitPreset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self number]));
  }
}

NAN_SETTER(NAUAudioUnitPreset::numberSetter) {
  JS_UNWRAP(AUAudioUnitPreset, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setNumber: input];
  }
}

NAN_GETTER(NAUAudioUnitPreset::nameGetter) {
  JS_UNWRAP(AUAudioUnitPreset, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NAUAudioUnitPreset::nameSetter) {
  JS_UNWRAP(AUAudioUnitPreset, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}
#endif
