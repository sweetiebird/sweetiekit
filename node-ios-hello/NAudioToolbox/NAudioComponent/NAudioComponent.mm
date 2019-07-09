//
//  NAudioComponent.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAudioComponent.h"

#if 0
#include "NAUAudioUnit.h" // for OSType

/*
typedef struct AudioComponentDescription {
    OSType              componentType;
    OSType              componentSubType;
    OSType              componentManufacturer;
    UInt32              componentFlags;
    UInt32              componentFlagsMask;
} AudioComponentDescription;
*/

Local<Value>
js_value_AudioComponentDescription(const AudioComponentDescription& value)
{
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("componentType"), js_value_OSType(value.componentType));
  result->Set(JS_STR("componentSubType"), js_value_OSType(value.componentSubType));
  result->Set(JS_STR("componentManufacturer"), js_value_OSType(value.componentManufacturer));
  result->Set(JS_STR("componentFlags"), js_value_uint32_t(value.componentFlags));
  result->Set(JS_STR("componentFlagsMask"), js_value_uint32_t(value.componentFlagsMask));
  return scope.Escape(result);
}

AudioComponentDescription
to_value_AudioComponentDescription(const Local<Value>& value, bool* _Nullable failed)
{
  AudioComponentDescription result;
  if (failed) {
    *failed = false;
  }
  if (!is_value_AudioComponentDescription(value))
  {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected a AudioComponentDescription");
    }
    return result;
  }
  Local<Object> object(JS_OBJ(value));
  result.componentType = to_value_OSType(object->Get(JS_STR("componentType")));
  result.componentSubType = to_value_OSType(object->Get(JS_STR("componentSubType")));
  result.componentManufacturer = to_value_OSType(object->Get(JS_STR("componentManufacturer")));
  result.componentFlags = to_value_uint32_t(object->Get(JS_STR("componentFlags")));
  result.componentFlagsMask = to_value_uint32_t(object->Get(JS_STR("componentFlagsMask")));
  return result;
}

bool
is_value_AudioComponentDescription(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> object(JS_OBJ(value));
  if (!is_value_OSType(object->Get(JS_STR("componentType")))) {
    return false;
  }
  if (!is_value_OSType(object->Get(JS_STR("componentSubType")))) {
    return false;
  }
  if (!is_value_OSType(object->Get(JS_STR("componentManufacturer")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("componentFlags")))) {
    return false;
  }
  if (!is_value_uint32_t(object->Get(JS_STR("componentFlagsMask")))) {
    return false;
  }
  return true;
}
#endif

JS_INIT_GLOBALS(AudioComponent);
  // global values (exports)

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
