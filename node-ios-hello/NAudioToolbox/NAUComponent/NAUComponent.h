//
//  NAUComponent.h
//
//  Created by Shawn Presser on 7/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAUComponent_h
#define NAUComponent_h    

#include "NNSObject.h"

/*!
  @typedef      AudioUnitPropertyID
  @discussion      Type used for audio unit properties. 
            Properties are used to describe the state of an audio unit (for instance, 
            the input or output audio format)
*/
//typedef UInt32              AudioUnitPropertyID;
#define js_value_AudioUnitPropertyID js_value_UInt32
#define to_value_AudioUnitPropertyID to_value_UInt32
#define is_value_AudioUnitPropertyID is_value_UInt32
/*!
  @typedef      AudioUnitScope
  @discussion      Type used for audio unit scopes. Apple reserves the 0 < 1024 range for 
            audio unit scope identifiers.  
            Scopes are used to delineate a major attribute of an audio unit 
            (for instance, global, input, output)
*/
//typedef UInt32              AudioUnitScope;
#define js_value_AudioUnitScope js_value_UInt32
#define to_value_AudioUnitScope to_value_UInt32
#define is_value_AudioUnitScope is_value_UInt32
/*!
  @typedef      AudioUnitElement
  @discussion      Type used for audio unit elements.
            Scopes can have one or more member, and a member of a scope is 
            addressed / described by its element
            For instance, input bus 1 is input scope, element 1
*/
//typedef UInt32              AudioUnitElement;
#define js_value_AudioUnitElement js_value_UInt32
#define to_value_AudioUnitElement to_value_UInt32
#define is_value_AudioUnitElement is_value_UInt32
/*!
  @typedef      AudioUnitParameterID
  @discussion      Type used for audio unit parameters. 
            Parameters are typically used to control and set render state 
            (for instance, filter cut-off frequency)
*/
//typedef UInt32              AudioUnitParameterID;
#define js_value_AudioUnitParameterID js_value_UInt32
#define to_value_AudioUnitParameterID to_value_UInt32
#define is_value_AudioUnitParameterID is_value_UInt32
/*!
  @typedef      AudioUnitParameterValue
  @discussion      Type used for audio unit parameter values. 
            The value of a given parameter is specified using this type 
            (typically a Float32)
*/
//typedef  Float32              AudioUnitParameterValue;
#define js_value_AudioUnitParameterValue js_value_Float32
#define to_value_AudioUnitParameterValue to_value_Float32
#define is_value_AudioUnitParameterValue is_value_Float32

#define js_value_AUParameterEventType(x) JS_ENUM(AUParameterEventType, UInt32, x)
#define to_value_AUParameterEventType(x) TO_ENUM(AUParameterEventType, UInt32, x)
#define is_value_AUParameterEventType(x) IS_ENUM(AUParameterEventType, UInt32, x)

#define js_value_AudioUnit js_value_AudioComponentInstance
#define to_value_AudioUnit to_value_AudioComponentInstance
#define is_value_AudioUnit is_value_AudioComponentInstance

JS_WRAP_GLOBALS(AUComponent);
JS_WRAP_GLOBALS_END(AUComponent);

#endif /* NAUComponent_h */
