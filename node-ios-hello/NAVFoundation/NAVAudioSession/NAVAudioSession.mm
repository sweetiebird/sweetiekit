//
//  NAVAudioSession.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioSession.h"

#define instancetype AVAudioSession
#define js_value_instancetype js_value_AVAudioSession

NAVAudioSession::NAVAudioSession() {}
NAVAudioSession::~NAVAudioSession() {}

JS_INIT_CLASS(AVAudioSession, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(setActiveError);
  JS_ASSIGN_PROTO_METHOD(setActiveWithOptionsError);
  JS_ASSIGN_PROTO_METHOD(activateWithOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(setCategoryError);
  JS_ASSIGN_PROTO_METHOD(setCategoryWithOptionsError);
  JS_ASSIGN_PROTO_METHOD(setCategoryModeOptionsError);
  JS_ASSIGN_PROTO_METHOD(setCategoryModeRouteSharingPolicyOptionsError);
  JS_ASSIGN_PROTO_METHOD(setModeError);
  JS_ASSIGN_PROTO_METHOD(requestRecordPermission);
  JS_ASSIGN_PROTO_METHOD(overrideOutputAudioPortError);
  JS_ASSIGN_PROTO_METHOD(setPreferredInputError);
  JS_ASSIGN_PROTO_METHOD(setPreferredSampleRateError);
  JS_ASSIGN_PROTO_METHOD(setPreferredIOBufferDurationError);
  JS_ASSIGN_PROTO_METHOD(setPreferredInputNumberOfChannelsError);
  JS_ASSIGN_PROTO_METHOD(setPreferredOutputNumberOfChannelsError);
  JS_ASSIGN_PROTO_METHOD(setInputGainError);
  JS_ASSIGN_PROTO_METHOD(setInputDataSourceError);
  JS_ASSIGN_PROTO_METHOD(setOutputDataSourceError);
  JS_ASSIGN_PROTO_METHOD(setAggregatedIOPreferenceError);
#if !TARGET_OS_UIKITFORMAC
  JS_ASSIGN_PROTO_METHOD(setActiveWithFlagsError);
  JS_ASSIGN_PROTO_METHOD(setPreferredHardwareSampleRateError);
#endif
#if TODO
// AVAudioSessionDelegate
  JS_ASSIGN_PROTO_METHOD(beginInterruption);
  JS_ASSIGN_PROTO_METHOD(endInterruptionWithFlags);
  JS_ASSIGN_PROTO_METHOD(endInterruption);
  JS_ASSIGN_PROTO_METHOD(inputIsAvailableChanged);
#endif
// AVAudioSession
  JS_ASSIGN_PROTO_PROP_READONLY(availableCategories);
  JS_ASSIGN_PROTO_PROP_READONLY(category);
  JS_ASSIGN_PROTO_PROP_READONLY(categoryOptions);
  JS_ASSIGN_PROTO_PROP_READONLY(routeSharingPolicy);
  JS_ASSIGN_PROTO_PROP_READONLY(availableModes);
  JS_ASSIGN_PROTO_PROP_READONLY(mode);
  JS_ASSIGN_PROTO_PROP_READONLY(recordPermission);
  JS_ASSIGN_PROTO_PROP_READONLY(isOtherAudioPlaying);
  JS_ASSIGN_PROTO_PROP_READONLY(secondaryAudioShouldBeSilencedHint);
  JS_ASSIGN_PROTO_PROP_READONLY(currentRoute);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredInput);
  JS_ASSIGN_PROTO_PROP_READONLY(availableInputs);
  JS_ASSIGN_PROTO_PROP_READONLY(promptStyle);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredSampleRate);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredIOBufferDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredInputNumberOfChannels);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredOutputNumberOfChannels);
  JS_ASSIGN_PROTO_PROP_READONLY(maximumInputNumberOfChannels);
  JS_ASSIGN_PROTO_PROP_READONLY(maximumOutputNumberOfChannels);
  JS_ASSIGN_PROTO_PROP_READONLY(inputGain);
  JS_ASSIGN_PROTO_PROP_READONLY(isInputGainSettable);
  JS_ASSIGN_PROTO_PROP_READONLY(isInputAvailable);
  JS_ASSIGN_PROTO_PROP_READONLY(inputDataSources);
  JS_ASSIGN_PROTO_PROP_READONLY(inputDataSource);
  JS_ASSIGN_PROTO_PROP_READONLY(outputDataSources);
  JS_ASSIGN_PROTO_PROP_READONLY(outputDataSource);
  JS_ASSIGN_PROTO_PROP_READONLY(sampleRate);
  JS_ASSIGN_PROTO_PROP_READONLY(inputNumberOfChannels);
  JS_ASSIGN_PROTO_PROP_READONLY(outputNumberOfChannels);
  JS_ASSIGN_PROTO_PROP_READONLY(outputVolume);
  JS_ASSIGN_PROTO_PROP_READONLY(inputLatency);
  JS_ASSIGN_PROTO_PROP_READONLY(outputLatency);
  JS_ASSIGN_PROTO_PROP_READONLY(IOBufferDuration);
  JS_ASSIGN_PROTO_PROP(delegate);
#if !TARGET_OS_UIKITFORMAC
  JS_ASSIGN_PROTO_PROP_READONLY(inputIsAvailable);
  JS_ASSIGN_PROTO_PROP_READONLY(currentHardwareSampleRate);
  JS_ASSIGN_PROTO_PROP_READONLY(currentHardwareInputNumberOfChannels);
  JS_ASSIGN_PROTO_PROP_READONLY(currentHardwareOutputNumberOfChannels);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredHardwareSampleRate);
#endif

  // static members (ctor)
  JS_INIT_CTOR(AVAudioSession, NSObject);
  JS_ASSIGN_STATIC_METHOD(sharedInstance);
  JS_ASSIGN_STATIC_METHOD(init);

  // AVAudioSessionCategory
  JS_ASSIGN_ENUM(AVAudioSessionCategoryAmbient, NSString);
  JS_ASSIGN_ENUM(AVAudioSessionCategoryMultiRoute, NSString);
  JS_ASSIGN_ENUM(AVAudioSessionCategoryPlayAndRecord, NSString);
  JS_ASSIGN_ENUM(AVAudioSessionCategoryPlayback, NSString);
  JS_ASSIGN_ENUM(AVAudioSessionCategoryRecord, NSString);
  JS_ASSIGN_ENUM(AVAudioSessionCategorySoloAmbient, NSString);
JS_INIT_CLASS_END(AVAudioSession, NSObject);

NAN_METHOD(NAVAudioSession::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioSession(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioSession, info);
      return;
    }

    AVAudioSession* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioSession *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
#if !TARGET_OS_UIKITFORMAC
      self = [[AVAudioSession alloc] init];
#endif
    }
    if (self) {
      NAVAudioSession *wrapper = new NAVAudioSession();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioSession::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVAudioSession::sharedInstance) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSession([AVAudioSession sharedInstance]));
  }
}

NAN_METHOD(NAVAudioSession::setActiveError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, active);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setActive: active error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setActiveWithOptionsError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, active);
    declare_value(AVAudioSessionSetActiveOptions, options);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setActive: active withOptions: options error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::activateWithOptionsCompletionHandler) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(AVAudioSessionActivationOptions, options);
    declare_value(void-^-BOOL,activated,NSError-pointer,_Nullable,error, handler);
    [self activateWithOptions: options completionHandler: handler];
    #endif
  }
}

NAN_METHOD(NAVAudioSession::setCategoryError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioSessionCategory, category);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setCategory: category error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setCategoryWithOptionsError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioSessionCategory, category);
    declare_value(AVAudioSessionCategoryOptions, options);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setCategory: category withOptions: options error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setCategoryModeOptionsError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioSessionCategory, category);
    declare_value(AVAudioSessionMode, mode);
    declare_value(AVAudioSessionCategoryOptions, options);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setCategory: category mode: mode options: options error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setCategoryModeRouteSharingPolicyOptionsError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioSessionCategory, category);
    declare_value(AVAudioSessionMode, mode);
    declare_value(AVAudioSessionRouteSharingPolicy, policy);
    declare_value(AVAudioSessionCategoryOptions, options);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setCategory: category mode: mode routeSharingPolicy: policy options: options error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setModeError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioSessionMode, mode);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setMode: mode error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::requestRecordPermission) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback_function(response);
    [self requestRecordPermission:^(BOOL granted) {
      dispatch_main(^{
        response("NAVAudioSession::requestRecordPermission", js_value_BOOL(granted));
      });
    }];
  }
}

NAN_METHOD(NAVAudioSession::overrideOutputAudioPortError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioSessionPortOverride, portOverride);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self overrideOutputAudioPort: portOverride error: &error]));
    js_panic_NSError(error);
  }
}

#include "NAVAudioSessionPortDescription.h"

NAN_METHOD(NAVAudioSession::setPreferredInputError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(AVAudioSessionPortDescription, inPort);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setPreferredInput: inPort error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setPreferredSampleRateError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(double, sampleRate);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setPreferredSampleRate: sampleRate error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setPreferredIOBufferDurationError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setPreferredIOBufferDuration: duration error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setPreferredInputNumberOfChannelsError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, count);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setPreferredInputNumberOfChannels: count error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setPreferredOutputNumberOfChannelsError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, count);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setPreferredOutputNumberOfChannels: count error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setInputGainError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, gain);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setInputGain: gain error: &error]));
    js_panic_NSError(error);
  }
}

#include "NAVAudioSessionDataSourceDescription.h"

NAN_METHOD(NAVAudioSession::setInputDataSourceError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(AVAudioSessionDataSourceDescription, dataSource);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setInputDataSource: dataSource error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setOutputDataSourceError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(AVAudioSessionDataSourceDescription, dataSource);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setOutputDataSource: dataSource error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioSession::setAggregatedIOPreferenceError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioSessionIOType, inIOType);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setAggregatedIOPreference: inIOType error: &error]));
    js_panic_NSError(error);
  }
}

#if !TARGET_OS_UIKITFORMAC
NAN_METHOD(NAVAudioSession::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[AVAudioSession alloc] init]));
  }
}
#endif

#if !TARGET_OS_UIKITFORMAC
NAN_METHOD(NAVAudioSession::setActiveWithFlagsError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, active);
    declare_value(NSInteger, flags);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setActive: active withFlags: flags error: &error]));
    js_panic_NSError(error);
  }
}
#endif

#if !TARGET_OS_UIKITFORMAC
NAN_METHOD(NAVAudioSession::setPreferredHardwareSampleRateError) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(double, sampleRate);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setPreferredHardwareSampleRate: sampleRate error: &error]));
    js_panic_NSError(error);
  }
}
#endif

#if TODO
NAN_METHOD(NAVAudioSessionDelegate::beginInterruption) {
  JS_UNWRAP(AVAudioSessionDelegate, self);
  declare_autoreleasepool {
    [self beginInterruption];
  }
}

NAN_METHOD(NAVAudioSessionDelegate::endInterruptionWithFlags) {
  JS_UNWRAP(AVAudioSessionDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, flags);
    [self endInterruptionWithFlags: flags];
  }
}

NAN_METHOD(NAVAudioSessionDelegate::endInterruption) {
  JS_UNWRAP(AVAudioSessionDelegate, self);
  declare_autoreleasepool {
    [self endInterruption];
  }
}

NAN_METHOD(NAVAudioSessionDelegate::inputIsAvailableChanged) {
  JS_UNWRAP(AVAudioSessionDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, isInputAvailable);
    [self inputIsAvailableChanged: isInputAvailable];
  }
}
#endif

NAN_GETTER(NAVAudioSession::availableCategoriesGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionCategory>([self availableCategories]));
  }
}

NAN_GETTER(NAVAudioSession::categoryGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionCategory([self category]));
  }
}

NAN_GETTER(NAVAudioSession::categoryOptionsGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionCategoryOptions([self categoryOptions]));
  }
}

NAN_GETTER(NAVAudioSession::routeSharingPolicyGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionRouteSharingPolicy([self routeSharingPolicy]));
  }
}

NAN_GETTER(NAVAudioSession::availableModesGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionMode>([self availableModes]));
  }
}

NAN_GETTER(NAVAudioSession::modeGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionMode([self mode]));
  }
}

NAN_GETTER(NAVAudioSession::recordPermissionGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionRecordPermission([self recordPermission]));
  }
}

NAN_GETTER(NAVAudioSession::isOtherAudioPlayingGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isOtherAudioPlaying]));
  }
}

NAN_GETTER(NAVAudioSession::secondaryAudioShouldBeSilencedHintGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self secondaryAudioShouldBeSilencedHint]));
  }
}

#include "NAVAudioSessionRouteDescription.h"

NAN_GETTER(NAVAudioSession::currentRouteGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionRouteDescription([self currentRoute]));
  }
}

NAN_GETTER(NAVAudioSession::preferredInputGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionPortDescription([self preferredInput]));
  }
}

NAN_GETTER(NAVAudioSession::availableInputsGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionPortDescription*>([self availableInputs]));
  }
}

NAN_GETTER(NAVAudioSession::promptStyleGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    if (@available(iOS 12.2, *)) {
//      JS_SET_RETURN(js_value_AVAudioSessionPromptStyle([self promptStyle]));
    } else {
      js_panic_noreturn("promptStyle available on iOS 12.2 or later");
    }
  }
}

NAN_GETTER(NAVAudioSession::preferredSampleRateGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self preferredSampleRate]));
  }
}

NAN_GETTER(NAVAudioSession::preferredIOBufferDurationGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self preferredIOBufferDuration]));
  }
}

NAN_GETTER(NAVAudioSession::preferredInputNumberOfChannelsGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self preferredInputNumberOfChannels]));
  }
}

NAN_GETTER(NAVAudioSession::preferredOutputNumberOfChannelsGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self preferredOutputNumberOfChannels]));
  }
}

NAN_GETTER(NAVAudioSession::maximumInputNumberOfChannelsGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self maximumInputNumberOfChannels]));
  }
}

NAN_GETTER(NAVAudioSession::maximumOutputNumberOfChannelsGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self maximumOutputNumberOfChannels]));
  }
}

NAN_GETTER(NAVAudioSession::inputGainGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self inputGain]));
  }
}

NAN_GETTER(NAVAudioSession::isInputGainSettableGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isInputGainSettable]));
  }
}

NAN_GETTER(NAVAudioSession::isInputAvailableGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isInputAvailable]));
  }
}

NAN_GETTER(NAVAudioSession::inputDataSourcesGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionDataSourceDescription*>([self inputDataSources]));
  }
}

NAN_GETTER(NAVAudioSession::inputDataSourceGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionDataSourceDescription([self inputDataSource]));
  }
}

NAN_GETTER(NAVAudioSession::outputDataSourcesGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionDataSourceDescription*>([self outputDataSources]));
  }
}

NAN_GETTER(NAVAudioSession::outputDataSourceGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionDataSourceDescription([self outputDataSource]));
  }
}

NAN_GETTER(NAVAudioSession::sampleRateGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self sampleRate]));
  }
}

NAN_GETTER(NAVAudioSession::inputNumberOfChannelsGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self inputNumberOfChannels]));
  }
}

NAN_GETTER(NAVAudioSession::outputNumberOfChannelsGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self outputNumberOfChannels]));
  }
}

NAN_GETTER(NAVAudioSession::outputVolumeGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self outputVolume]));
  }
}

NAN_GETTER(NAVAudioSession::inputLatencyGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self inputLatency]));
  }
}

NAN_GETTER(NAVAudioSession::outputLatencyGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self outputLatency]));
  }
}

NAN_GETTER(NAVAudioSession::IOBufferDurationGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self IOBufferDuration]));
  }
}

NAN_GETTER(NAVAudioSessionPortDescription::portTypeGetter) {
  JS_UNWRAP(AVAudioSessionPortDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionPort([self portType]));
  }
}

NAN_GETTER(NAVAudioSessionPortDescription::portNameGetter) {
  JS_UNWRAP(AVAudioSessionPortDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self portName]));
  }
}

NAN_GETTER(NAVAudioSessionPortDescription::UIDGetter) {
  JS_UNWRAP(AVAudioSessionPortDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self UID]));
  }
}

NAN_GETTER(NAVAudioSessionPortDescription::hasHardwareVoiceCallProcessingGetter) {
  JS_UNWRAP(AVAudioSessionPortDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasHardwareVoiceCallProcessing]));
  }
}

NAN_GETTER(NAVAudioSessionPortDescription::channelsGetter) {
  JS_UNWRAP(AVAudioSessionPortDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionChannelDescription*>([self channels]));
  }
}

NAN_GETTER(NAVAudioSessionPortDescription::dataSourcesGetter) {
  JS_UNWRAP(AVAudioSessionPortDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionDataSourceDescription*>([self dataSources]));
  }
}

NAN_GETTER(NAVAudioSessionPortDescription::selectedDataSourceGetter) {
  JS_UNWRAP(AVAudioSessionPortDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionDataSourceDescription([self selectedDataSource]));
  }
}

NAN_GETTER(NAVAudioSessionPortDescription::preferredDataSourceGetter) {
  JS_UNWRAP(AVAudioSessionPortDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionDataSourceDescription([self preferredDataSource]));
  }
}

NAN_GETTER(NAVAudioSessionRouteDescription::inputsGetter) {
  JS_UNWRAP(AVAudioSessionRouteDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionPortDescription*>([self inputs]));
  }
}

NAN_GETTER(NAVAudioSessionRouteDescription::outputsGetter) {
  JS_UNWRAP(AVAudioSessionRouteDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionPortDescription*>([self outputs]));
  }
}

NAN_GETTER(NAVAudioSessionDataSourceDescription::dataSourceIDGetter) {
  JS_UNWRAP(AVAudioSessionDataSourceDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self dataSourceID]));
  }
}

NAN_GETTER(NAVAudioSessionDataSourceDescription::dataSourceNameGetter) {
  JS_UNWRAP(AVAudioSessionDataSourceDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self dataSourceName]));
  }
}

NAN_GETTER(NAVAudioSessionDataSourceDescription::locationGetter) {
  JS_UNWRAP(AVAudioSessionDataSourceDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionLocation([self location]));
  }
}

NAN_GETTER(NAVAudioSessionDataSourceDescription::orientationGetter) {
  JS_UNWRAP(AVAudioSessionDataSourceDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionOrientation([self orientation]));
  }
}

NAN_GETTER(NAVAudioSessionDataSourceDescription::supportedPolarPatternsGetter) {
  JS_UNWRAP(AVAudioSessionDataSourceDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionPolarPattern>([self supportedPolarPatterns]));
  }
}

NAN_GETTER(NAVAudioSessionDataSourceDescription::selectedPolarPatternGetter) {
  JS_UNWRAP(AVAudioSessionDataSourceDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionPolarPattern([self selectedPolarPattern]));
  }
}

NAN_GETTER(NAVAudioSessionDataSourceDescription::preferredPolarPatternGetter) {
  JS_UNWRAP(AVAudioSessionDataSourceDescription, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioSessionPolarPattern([self preferredPolarPattern]));
  }
}

NAN_GETTER(NAVAudioSession::delegateGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <AVAudioSessionDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NAVAudioSession::delegateSetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <AVAudioSessionDelegate>*/, input);
    [self setDelegate: input];
  }
}

#if !TARGET_OS_UIKITFORMAC
NAN_GETTER(NAVAudioSession::inputIsAvailableGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self inputIsAvailable]));
  }
}

NAN_GETTER(NAVAudioSession::currentHardwareSampleRateGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self currentHardwareSampleRate]));
  }
}

NAN_GETTER(NAVAudioSession::currentHardwareInputNumberOfChannelsGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self currentHardwareInputNumberOfChannels]));
  }
}

NAN_GETTER(NAVAudioSession::currentHardwareOutputNumberOfChannelsGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self currentHardwareOutputNumberOfChannels]));
  }
}

NAN_GETTER(NAVAudioSession::preferredHardwareSampleRateGetter) {
  JS_UNWRAP(AVAudioSession, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self preferredHardwareSampleRate]));
  }
}
#endif
