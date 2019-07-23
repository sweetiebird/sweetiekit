//
//  NAudioComponent.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAudioComponent.h"


#define NXThrowIfError(error, operation)                    \
  do {                                  \
    OSStatus __err = error;                        \
    if (__err) {                            \
      js_panic_CAXError(__err, operation);              \
    }                                  \
  } while (0)

#define js_panic_CAXError(error, operation) \
    if (error) { \
      Nan::ThrowError([[NSString stringWithFormat:@"%@: code %d", @operation, static_cast<int>(error)] UTF8String]); \
      return; \
    }


/*!
    @function       AudioComponentFindNext
    @abstract       Finds an audio component.
    @discussion     This function is used to find an audio component that is the closest match
                    to the provided values. Note that the list of available components may change
          dynamically in situations involving inter-app audio on iOS, or version 3
          audio unit extensions. See kAudioComponentRegistrationsChangedNotification.

    @param          inComponent
                        If NULL, then the search starts from the beginning until an audio
                        component is found that matches the description provided by inDesc.
                        If non-NULL, then the search starts (continues) from the previously
                        found audio component specified by inComponent, and will return the next
                        found audio component.
    @param          inDesc
                        The type, subtype and manufacturer fields are used to specify the audio
                        component to search for. A value of 0 (zero) for any of these fields is
                        a wildcard, so the first match found is returned.
    @result         An audio component that matches the search parameters, or NULL if none found.
*/
/*
extern AudioComponent __nullable
AudioComponentFindNext (    AudioComponent __nullable           inComponent,
                            const AudioComponentDescription *   inDesc) 
                                                                            API_AVAILABLE(macos(10.6), ios(2.0), watchos(2.0), tvos(9.0));

 */

#include "NCoreAudioTypes.h"

@import AudioToolbox;

NAN_METHOD(AudioComponentFindNext) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(AudioComponent, inComponent);
    declare_value(AudioComponentDescription, inDesc);
    js_return_value(AudioComponent, ::AudioComponentFindNext(inComponent, &inDesc));
  }
}

/*!
    @function       AudioComponentInstanceNew
    @abstract       Creates an audio component instance.
    @discussion     This function creates an instance of a given audio component. The audio
                    component instance is the object that does all of the work, whereas the
                    audio component is the way an application finds and then creates this object
                    to do this work. For example, an audio unit is a type of audio component
                    instance, so to use an audio unit, one finds its audio component, and then
                    creates a new instance of that component. This instance is then used to
                    perform the audio tasks for which it was designed (process, mix, synthesise,
                    etc.).
    @param          inComponent
                        the audio component (must not be NULL)
    @param          outInstance
                        the audio component instance
    @result         an OSStatus result code.
*/
/*
extern OSStatus 
AudioComponentInstanceNew(      AudioComponent                                inComponent,
                                AudioComponentInstance __nullable * __nonnull outInstance)
                                                                            API_AVAILABLE(macos(10.6), ios(2.0), watchos(2.0), tvos(9.0));
 */
NAN_METHOD(AudioComponentInstanceNew) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioComponent, inComponent);
    AudioComponentInstance instance = nullptr;
    NXThrowIfError(::AudioComponentInstanceNew(inComponent, &instance), "AudioComponentInstanceNew failed");
    js_return_value(AudioComponentInstance, instance);
    
  }
}

JS_INIT_GLOBALS(AudioComponent);
  // global values (exports)
  
  JS_ASSIGN_GLOBAL_METHOD(AudioComponentFindNext);
  JS_ASSIGN_GLOBAL_METHOD(AudioComponentInstanceNew);

  /*!
    @constant  kAudioComponentFlag_Unsearchable

    When this bit in AudioComponentDescription's componentFlags is set, AudioComponentFindNext
    will only return this component when performing a specific, non-wildcard search for the
    component, i.e. with non-zero values of componentType, componentSubType, and
    componentManufacturer. This can be useful when privately registering a component.
    
    @constant  kAudioComponentFlag_SandboxSafe
    
    An AudioComponent sets this bit in its componentFlags to indicate to the system that the
    AudioComponent is safe to open in a sandboxed process.
    
    @constant  kAudioComponentFlag_IsV3AudioUnit
    
    The system sets this flag automatically when registering components which implement a version 3
    Audio Unit.
    
    @constant  kAudioComponentFlag_RequiresAsyncInstantiation
    
    The system sets this flag automatically when registering components which require asynchronous
    instantiation via AudioComponentInstantiate (v3 audio units with views).
    
    @constant  kAudioComponentFlag_CanLoadInProcess
    
    The system sets this flag automatically when registering components which can be loaded into
    the current process. This is always true for V2 audio units; it depends on the packaging
    in the case of a V3 audio unit.
  */
  //typedef CF_OPTIONS(UInt32, AudioComponentFlags) {
      JS_ASSIGN_ENUM(kAudioComponentFlag_Unsearchable, uint32_t); //                 CF_ENUM_AVAILABLE(10_7, 5_0)   = 1,
      JS_ASSIGN_ENUM(kAudioComponentFlag_SandboxSafe, uint32_t); //                  CF_ENUM_AVAILABLE(10_8, 6_0)   = 2,
      JS_ASSIGN_ENUM(kAudioComponentFlag_IsV3AudioUnit, uint32_t); //                CF_ENUM_AVAILABLE(10_11, 9_0)  = 4,
      JS_ASSIGN_ENUM(kAudioComponentFlag_RequiresAsyncInstantiation, uint32_t); //   CF_ENUM_AVAILABLE(10_11, 9_0)  = 8,
      JS_ASSIGN_ENUM(kAudioComponentFlag_CanLoadInProcess, uint32_t); //       CF_ENUM_AVAILABLE(10_11, 9_0)  = 0x10
  //};

  /*! @enum       AudioComponentInstantiationOptions
      @brief      Options controlling component instantiation.
      @discussion
          Most component instances are loaded into the calling process.

          A version 3 audio unit, however, can be loaded into a separate extension service process,
          and this is the default behavior for these components. To be able to load one in-process
          requires that the developer package the audio unit in a bundle separate from the application
          extension, since an extension's main binary cannot be dynamically loaded into another
          process.
          
          An OS X host may request in-process loading of such audio units using
          kAudioComponentInstantiation_LoadInProcess.

          kAudioComponentFlag_IsV3AudioUnit specifies whether an audio unit is implemented using API
          version 3.

          These options are just requests to the implementation. It may fail and fall back to the
          default.
      @constant kAudioComponentInstantiation_LoadOutOfProcess
          Attempt to load the component into a separate extension process.
      @constant kAudioComponentInstantiation_LoadInProcess
          Attempt to load the component into the current process. Only available on OS X.
  */
  //typedef CF_OPTIONS(UInt32, AudioComponentInstantiationOptions) {
    JS_ASSIGN_ENUM(kAudioComponentInstantiation_LoadOutOfProcess, uint32_t); //    CF_ENUM_AVAILABLE(10_11,  9_0) = 1,
#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
    JS_ASSIGN_ENUM(kAudioComponentInstantiation_LoadInProcess, uint32_t); //       CF_ENUM_AVAILABLE(10_11,  NA)  = 2
#endif
  //};

JS_INIT_GLOBALS_END(AudioComponent);
