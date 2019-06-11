//
//  NAVAudioSession.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioSession_h
#define NAVAudioSession_h    

#include "NNSObject.h"

#define js_value_AVAudioSession(x) js_value_wrapper(x, AVAudioSession)
#define to_value_AVAudioSession(x) to_value_wrapper(x, AVAudioSession)
#define is_value_AVAudioSession(x) is_value_wrapper(x, AVAudioSession)

// AVFoundation constants

/* Category property */
#define js_value_AVAudioSessionCategory(x) JS_ENUM(AVAudioSessionCategory, NSString, x)
#define to_value_AVAudioSessionCategory(x) TO_ENUM(AVAudioSessionCategory, NSString, x)
#define is_value_AVAudioSessionCategory(x) IS_ENUM(AVAudioSessionCategory, NSString, x)

/* Mode property */
//typedef NSString *AVAudioSessionMode NS_TYPED_ENUM;
#define js_value_AVAudioSessionMode(x) JS_ENUM(AVAudioSessionMode, NSString, x)
#define to_value_AVAudioSessionMode(x) TO_ENUM(AVAudioSessionMode, NSString, x)
#define is_value_AVAudioSessionMode(x) IS_ENUM(AVAudioSessionMode, NSString, x)

/* AVAudioSessionPort */
//typedef NSString *AVAudioSessionPort NS_TYPED_ENUM;
#define js_value_AVAudioSessionPort(x) JS_ENUM(AVAudioSessionPort, NSString, x)
#define to_value_AVAudioSessionPort(x) TO_ENUM(AVAudioSessionPort, NSString, x)
#define is_value_AVAudioSessionPort(x) IS_ENUM(AVAudioSessionPort, NSString, x)

/* AVAudioSessionLocation */
//typedef NSString *AVAudioSessionLocation NS_TYPED_ENUM;
#define js_value_AVAudioSessionLocation(x) JS_ENUM(AVAudioSessionLocation, NSString, x)
#define to_value_AVAudioSessionLocation(x) TO_ENUM(AVAudioSessionLocation, NSString, x)
#define is_value_AVAudioSessionLocation(x) IS_ENUM(AVAudioSessionLocation, NSString, x)

/* AVAudioSessionOrientation */
//typedef NSString *AVAudioSessionOrientation NS_TYPED_ENUM;
#define js_value_AVAudioSessionOrientation(x) JS_ENUM(AVAudioSessionOrientation, NSString, x)
#define to_value_AVAudioSessionOrientation(x) TO_ENUM(AVAudioSessionOrientation, NSString, x)
#define is_value_AVAudioSessionOrientation(x) IS_ENUM(AVAudioSessionOrientation, NSString, x)

/* AVAudioSessionPolarPattern */
//typedef NSString *AVAudioSessionPolarPattern NS_TYPED_ENUM;
#define js_value_AVAudioSessionPolarPattern(x) JS_ENUM(AVAudioSessionPolarPattern, NSString, x)
#define to_value_AVAudioSessionPolarPattern(x) TO_ENUM(AVAudioSessionPolarPattern, NSString, x)
#define is_value_AVAudioSessionPolarPattern(x) IS_ENUM(AVAudioSessionPolarPattern, NSString, x)

#define js_value_AVAudioSessionInterruptionOptions(x) JS_OPTS(AVAudioSessionInterruptionOptions, NSUInteger, x)
#define to_value_AVAudioSessionInterruptionOptions(x) TO_OPTS(AVAudioSessionInterruptionOptions, NSUInteger, x)
#define is_value_AVAudioSessionInterruptionOptions(x) IS_OPTS(AVAudioSessionInterruptionOptions, NSUInteger, x)

#define js_value_AVAudioSessionSetActiveOptions(x) JS_OPTS(AVAudioSessionSetActiveOptions, NSUInteger, x)
#define to_value_AVAudioSessionSetActiveOptions(x) TO_OPTS(AVAudioSessionSetActiveOptions, NSUInteger, x)
#define is_value_AVAudioSessionSetActiveOptions(x) IS_OPTS(AVAudioSessionSetActiveOptions, NSUInteger, x)

#define js_value_AVAudioSessionActivationOptions(x) JS_OPTS(AVAudioSessionActivationOptions, NSUInteger, x)
#define to_value_AVAudioSessionActivationOptions(x) TO_OPTS(AVAudioSessionActivationOptions, NSUInteger, x)
#define is_value_AVAudioSessionActivationOptions(x) IS_OPTS(AVAudioSessionActivationOptions, NSUInteger, x)

#define js_value_AVAudioSessionCategoryOptions(x) JS_OPTS(AVAudioSessionCategoryOptions, NSUInteger, x)
#define to_value_AVAudioSessionCategoryOptions(x) TO_OPTS(AVAudioSessionCategoryOptions, NSUInteger, x)
#define is_value_AVAudioSessionCategoryOptions(x) IS_OPTS(AVAudioSessionCategoryOptions, NSUInteger, x)

#define js_value_AVAudioSessionRouteSharingPolicy(x) JS_ENUM(AVAudioSessionRouteSharingPolicy, NSInteger, x)
#define to_value_AVAudioSessionRouteSharingPolicy(x) TO_ENUM(AVAudioSessionRouteSharingPolicy, NSInteger, x)
#define is_value_AVAudioSessionRouteSharingPolicy(x) IS_ENUM(AVAudioSessionRouteSharingPolicy, NSInteger, x)

#define js_value_AVAudioSessionPortOverride(x) JS_ENUM(AVAudioSessionPortOverride, NSUInteger, x)
#define to_value_AVAudioSessionPortOverride(x) TO_ENUM(AVAudioSessionPortOverride, NSUInteger, x)
#define is_value_AVAudioSessionPortOverride(x) IS_ENUM(AVAudioSessionPortOverride, NSUInteger, x)

#define js_value_AVAudioSessionIOType(x) JS_ENUM(AVAudioSessionIOType, NSUInteger, x)
#define to_value_AVAudioSessionIOType(x) TO_ENUM(AVAudioSessionIOType, NSUInteger, x)
#define is_value_AVAudioSessionIOType(x) IS_ENUM(AVAudioSessionIOType, NSUInteger, x)

#define js_value_AVAudioSessionRecordPermission(x) JS_ENUM(AVAudioSessionRecordPermission, NSUInteger, x)
#define to_value_AVAudioSessionRecordPermission(x) TO_ENUM(AVAudioSessionRecordPermission, NSUInteger, x)
#define is_value_AVAudioSessionRecordPermission(x) IS_ENUM(AVAudioSessionRecordPermission, NSUInteger, x)

#define js_value_AVAudioSessionPromptStyle(x) JS_ENUM(AVAudioSessionPromptStyle, NSUInteger, x)
#define to_value_AVAudioSessionPromptStyle(x) TO_ENUM(AVAudioSessionPromptStyle, NSUInteger, x)
#define is_value_AVAudioSessionPromptStyle(x) IS_ENUM(AVAudioSessionPromptStyle, NSUInteger, x)

#define js_value_AudioChannelLabel(x) js_value_uint32_t(x)
#define to_value_AudioChannelLabel(x) to_value_uint32_t(x)
#define is_value_AudioChannelLabel(x) is_value_uint32_t(x)

JS_WRAP_CLASS(AVAudioSession, NSObject);
// AVAudioSession
  JS_STATIC_METHOD(sharedInstance);
  JS_METHOD(setActiveError);
  JS_METHOD(setActiveWithOptionsError);
  JS_METHOD(activateWithOptionsCompletionHandler);
  JS_METHOD(setCategoryError);
  JS_METHOD(setCategoryWithOptionsError);
  JS_METHOD(setCategoryModeOptionsError);
  JS_METHOD(setCategoryModeRouteSharingPolicyOptionsError);
  JS_METHOD(setModeError);
  JS_METHOD(requestRecordPermission);
  JS_METHOD(overrideOutputAudioPortError);
  JS_METHOD(setPreferredInputError);
  JS_METHOD(setPreferredSampleRateError);
  JS_METHOD(setPreferredIOBufferDurationError);
  JS_METHOD(setPreferredInputNumberOfChannelsError);
  JS_METHOD(setPreferredOutputNumberOfChannelsError);
  JS_METHOD(setInputGainError);
  JS_METHOD(setInputDataSourceError);
  JS_METHOD(setOutputDataSourceError);
  JS_METHOD(setAggregatedIOPreferenceError);
  JS_STATIC_METHOD(init);
  JS_METHOD(setActiveWithFlagsError);
  JS_METHOD(setPreferredHardwareSampleRateError);
#if TODO
// AVAudioSessionDelegate
  JS_METHOD(beginInterruption);
  JS_METHOD(endInterruptionWithFlags);
  JS_METHOD(endInterruption);
  JS_METHOD(inputIsAvailableChanged);
#endif
// AVAudioSession
  JS_PROP_READONLY(availableCategories);
  JS_PROP_READONLY(category);
  JS_PROP_READONLY(categoryOptions);
  JS_PROP_READONLY(routeSharingPolicy);
  JS_PROP_READONLY(availableModes);
  JS_PROP_READONLY(mode);
  JS_PROP_READONLY(recordPermission);
  JS_PROP_READONLY(isOtherAudioPlaying);
  JS_PROP_READONLY(secondaryAudioShouldBeSilencedHint);
  JS_PROP_READONLY(currentRoute);
  JS_PROP_READONLY(preferredInput);
  JS_PROP_READONLY(availableInputs);
  JS_PROP_READONLY(promptStyle);
  JS_PROP_READONLY(preferredSampleRate);
  JS_PROP_READONLY(preferredIOBufferDuration);
  JS_PROP_READONLY(preferredInputNumberOfChannels);
  JS_PROP_READONLY(preferredOutputNumberOfChannels);
  JS_PROP_READONLY(maximumInputNumberOfChannels);
  JS_PROP_READONLY(maximumOutputNumberOfChannels);
  JS_PROP_READONLY(inputGain);
  JS_PROP_READONLY(isInputGainSettable);
  JS_PROP_READONLY(isInputAvailable);
  JS_PROP_READONLY(inputDataSources);
  JS_PROP_READONLY(inputDataSource);
  JS_PROP_READONLY(outputDataSources);
  JS_PROP_READONLY(outputDataSource);
  JS_PROP_READONLY(sampleRate);
  JS_PROP_READONLY(inputNumberOfChannels);
  JS_PROP_READONLY(outputNumberOfChannels);
  JS_PROP_READONLY(outputVolume);
  JS_PROP_READONLY(inputLatency);
  JS_PROP_READONLY(outputLatency);
  JS_PROP_READONLY(IOBufferDuration);
// AVAudioSession
  JS_PROP(delegate);
  JS_PROP_READONLY(inputIsAvailable);
  JS_PROP_READONLY(currentHardwareSampleRate);
  JS_PROP_READONLY(currentHardwareInputNumberOfChannels);
  JS_PROP_READONLY(currentHardwareOutputNumberOfChannels);
  JS_PROP_READONLY(preferredHardwareSampleRate);

JS_WRAP_CLASS_END(AVAudioSession);

#endif /* NAVAudioSession_h */
