//
//  NAudioUnitProperties.mm
//
//  Created by Shawn Presser on 7/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAudioUnitProperties.h"

#include "NMacTypes.h"
#include "NAUComponent.h"
#include "SWTUtils.h"

JS_INIT_GLOBALS(AudioUnitProperties);
  // global values (exports)

  /*!
      @enum           Audio Unit scope types
      @abstract       The scope IDs for audio units define basic roles and contexts for an audio unit's state.
      @discussion    Each scope is a discrete context. Apple reserves scope IDs from 0 through 1024.

    @constant    kAudioUnitScope_Global  The context for audio unit characteristics that apply to the audio unit as a 
                        whole
    @constant    kAudioUnitScope_Input  The context for audio data coming into an audio unit
    @constant    kAudioUnitScope_Output  The context for audio data leaving an audio unit
    @constant    kAudioUnitScope_Group  A context specific to the control scope of parameters (for instance, 
                        MIDI Channels is an example of this scope)
    @constant    kAudioUnitScope_Part  A distinct rendering context. For instance a single timbre in a multi-timbral 
                        instrument, a single loop in a multi looping capable looper unit, etc.
    @constant    kAudioUnitScope_Note  A scope that can be used to apply changes to an individual note. The 
                        elementID used with this scope is the unique note ID returned from
                        a started note (see MusicDeviceStartNote)
    @constant    kAudioUnitScope_Layer  A context which functions as a layer within a part and allows
                        grouped control of LayerItem-scope parameters.
                        An example is the percussive attack layer for an electric organ instrument
    @constant    kAudioUnitScope_LayerItem  A scope which represents an individual element within a particular Layer scope.
                        The individual sample zones, envelope generators, and filters within a synth are
                        examples of this.
  */
  //CF_ENUM(AudioUnitScope) {
    JS_ASSIGN_ENUM(kAudioUnitScope_Global, AudioUnitScope); //     = 0,
    JS_ASSIGN_ENUM(kAudioUnitScope_Input, AudioUnitScope); //     = 1,
    JS_ASSIGN_ENUM(kAudioUnitScope_Output, AudioUnitScope); //     = 2,
    JS_ASSIGN_ENUM(kAudioUnitScope_Group, AudioUnitScope); //     = 3,
    JS_ASSIGN_ENUM(kAudioUnitScope_Part, AudioUnitScope); //     = 4,
    JS_ASSIGN_ENUM(kAudioUnitScope_Note, AudioUnitScope); //     = 5,
    JS_ASSIGN_ENUM(kAudioUnitScope_Layer, AudioUnitScope); //     = 6,
    JS_ASSIGN_ENUM(kAudioUnitScope_LayerItem, AudioUnitScope); //   = 7
  //};

  /*!
      @enum           Generic Property IDs
      @abstract       Properties that can apply to any audio unit.
    
    @constant    kAudioUnitProperty_ClassInfo
              Scope:      Global (or Part for a part scope preset)
              Value Type:    CFDictionaryRef
              Access:      Read / Write
              
              The complete state of an audio unit if on global scope. An audio unit that supports part scope, may also support presets on the part scope
              that apply to individual parts.
              
              After a host sets this property it needs to notify the parameter listeners that the values of the parameters of an AU may have changed (so
              views, etc, can update their state). Something like the following code should be used:
              
              <code>
              #include <AudioToolbox/AudioUnitUtilities.h>
              
              AudioUnitParameter changedUnit;
              changedUnit.mAudioUnit = theChangedAU;
              changedUnit.mParameterID = kAUParameterListener_AnyParameter;
              AUParameterListenerNotify (NULL, NULL, &changedUnit);
              </code>

              
    @constant    kAudioUnitProperty_MakeConnection
              Scope:      Input
              Value Type:    AudioUnitConnection
              Access:      Write
    
    @constant    kAudioUnitProperty_SampleRate
              Scope:      Input / Output
              Value Type:    Float64
              Access:      Read / Write
              
    @constant    kAudioUnitProperty_ParameterList
              Scope:      Any
              Value Type:    AudioUnitParameterID
              Access:      Read
              
              The list of parameter IDs on the specified scope
              
    @constant    kAudioUnitProperty_ParameterInfo
              Scope:      Any
              Element:    AudioUnitParameterID of the parameter being queried
              Value Type:    AudioUnitParameterInfo
              Access:      Read
              
              The info struct describes the general characteristics of an individual parameterID
              
    @constant    kAudioUnitProperty_FastDispatch
              Scope:      Global
              Value Type:    void* (function pointer)
              Access:      Read
              
              The caller provides the selector for a given audio unit API, and retrieves a function pointer for that selector. For instance,
              this enables the caller to retrieve the function pointer for the AudioUnitRender call, so that call can be made directly
              through to the audio unit to avoid the overhead of the ComponentMgr's dispatch.
    
    @constant    kAudioUnitProperty_CPULoad
              Scope:      Global
              Value Type:    Float64
              Access:      Read
              
              Can be used to retrieve the duty cycle (as a value from 0 to 1) of the render time that an audio unit is spending in its render call.
    
    @constant    kAudioUnitProperty_StreamFormat
              Scope:      Input / Output
              Value Type:    AudioStreamBasicDescription
              Access:      Read / Write
              
              An AudioStreamBasicDescription is used to specify the basic format for an audio data path. For instance, 2 channels, 44.1KHz, Float32 linear pcm.
              The value can be both set and retrieve from an I/O element (bus)
    
    @constant    kAudioUnitProperty_ElementCount
              Scope:      Any (though Global scope will always have an element count of 1)
              Value Type:    UInt32
              Access:      Read / Write
              
              Most audio units will only implement the read version of this call, thus they would have a fixed bus topology (number of input and output elements/buses).
              Some audio units possess the capability to add or remove elements, so in that case this property will be writable.
              
    @constant    kAudioUnitProperty_Latency
              Scope:      Global
              Value Type:    Float64
              Access:      Read
              
              The processing latency (the time it takes an audio unit to represent an input in its audio output) specified in seconds
              
    @constant    kAudioUnitProperty_SupportedNumChannels
              Scope:      Global
              Value Type:    AUChannelInfo array
              Access:      Read
              
              The size of this property will represent the number of AUChannelInfo structs that an audio unit provides. Each entry describes a particular number of 
              channels on any input, matched to a particular number of channels on any output. Thus an entry {2, 2} says the audio unit will support a channel configuration
              of 2 channels on an input and 2 channels on an output.
              
              Negative numbers (-1, -2) are used to indicate *any* number of channels. So {-1, -1} means any number of channels on input and output as long as they are the same.
              {-1, -2} means any number of channels on input or output buses
              
              A negative number less than -2 is used to indicate a total number of channels across every bus on that scope, regardless of how many channels are set on any
              particular bus.
              
              Zero on any side (typically only input) means that the audio unit doesn't have any input elements, and is expressing the capability of configuring its output channels.
              
    @constant    kAudioUnitProperty_MaximumFramesPerSlice
              Scope:      Global
              Value Type:    UInt32
              Access:      Read / Write
              
              This property is used to describe to an audio unit the maximum number of samples it will be asked to produce on any single given call to audio unit render. 
              
              If an audio unit can require more or less input data than its output request, then it should limit any given request for input to this number of frames (that is,
              it should "break up" its input pulls).
    
    @constant    kAudioUnitProperty_SetExternalBuffer
              Scope:      Global
              Value Type:    AudioUnitExternalBuffer
              Access:      Write
              
              This is used to provide to an audio unit a buffer that it can use with its input render callback's audio buffer list
    
    @constant    kAudioUnitProperty_ParameterValueStrings
              Scope:      Any
              Element:    AudioUnitParameterID of the parameter being queried 
              Value Type:    CFArrayRef
              Access:      Read
              
              Some audio unit parameters that are of an index type, can also provide names for each value of the parameter. This property returns an array containing CFStrings, where
              each element in the array is the name that should be used for that parameter value. The size of the array should be the same as the range between the parameters min and max values.
              The array's strings can then be used to build a menu for that parameter.
    
    @constant    kAudioUnitProperty_GetUIComponentList
              Scope:      Any
              Value Type:    AudioComponentDescription array
              Access:      Read
              
              Presents an array of AudioComponentDescription that are of type 'auvw' (AudioUnitCarbonView). These are the carbon based custom views for that audio unit. 
    
    @constant    kAudioUnitProperty_AudioChannelLayout
              Scope:      Input/Output
              Value Type:    struct AudioChannelLayout
              Access:      read/write

              Description:
              Describes for a given scope/element the order of channels within a given stream. 
              The number of channels it describes must match the number of channels set for that 
              scope/element. Each input and output bus in an audio unit can have one instance of 
              this property. 
              
              Some audio units require this property. For example, the 3DMixer unit must 
              implement this property on its output bus. If a host application attempts to 
              clear the value of this property on a bus that requires a valid value, the
              audio unit will return a kAudioUnitErr_InvalidPropertyValue error.
              
              Input and output buses can be in one of three states in regard to Audio 
              channel layout:
              
              1. implemented and set
              2. implemented but not set 
              3. unimplemented 
              
              Requesting the value of this property when it is implemented but not set
              results in a kAudioUnitErr_PropertyNotInUse error.
              
              Use the kAudioUnitProperty_AudioChannelLayout property whenever channel
              layout is relevant. By comparison, the kAudioUnitProperty_StreamFormat 
              property cannot specify channel layout or purpose.
              
              See also: kAudioUnitProperty_SupportedChannelLayoutTags, 
              kAudioUnitProperty_StreamFormat.
     
    @constant    kAudioUnitProperty_TailTime
              Scope:      Global
              Value Type:    Float64
              Access:      Read
              
              The time in seconds that will remain after the last valid input of any audio unit has been processed before the output is silent. For example, this could be the total
              decay time of a reverb or a delay. In general this will be a conservative estimate.
    
    @constant    kAudioUnitProperty_BypassEffect
              Scope:      Global
              Value Type:    UInt32
              Access:      Read / Write
              
              A boolean value that can be used to bypass the processing in an effect unit, so that the input is passed unchanged through to the output
    
    @constant    kAudioUnitProperty_LastRenderError
              Scope:      Global
              Value Type:    OSStatus
              Access:      Read
              
              This property is set if there is an error in AudioUnitRender. The AU will then fire a property changed notification to any listeners on this property and 
              those listeners can then use this property ID to retrieve that error.
    
    @constant    kAudioUnitProperty_SetRenderCallback
              Scope:      Input
              Value Type:    AURenderCallbackStruct
              Access:      Write
              
              This is used to provide the audio unit with input on the specified element (input bus) with audio data from the provided callback. The callback is delivered a buffer list
              which it must fill in with audio data. If no data is available, it should set the audio data to 0 (silence). In the normal case, f an error is returned, the audio is not processed 
              and the audio unit will return an error from AudioUnitRender.

    @constant    kAudioUnitProperty_FactoryPresets
              Scope:      Global
              Value Type:    CFArray of AUPreset structures
              Access:      Read
              
              An array of preset structures that provide a name and number for each preset. A factory preset is then chosen using the PresentPreset property. 
    
    @constant    kAudioUnitProperty_ContextName
              Scope:      Global
              Value Type:    CFString
              Access:      Read / Write
              
              The host can set this as information to the audio unit to describe something about the context within which the audio unit is instantiated. For instance, "track 3" could
              be set as the context, so that the audio unit's view could then display "My audio unit on track 3" as information to the user of the particular context for any audio unit.
              
    @constant    kAudioUnitProperty_RenderQuality
              Scope:      Global
              Value Type:    UInt32
              Access:      Read / Write
              
              A value (0 - 127) that can be used to control the quality (complexity) of the rendering operation. A typical usage is to set render quality to maximum for best quality, but
              if CPU usage is a concern a lesser quality can be set to trade off render quality.
    
    @constant    kAudioUnitProperty_HostCallbacks
              Scope:      Global
              Value Type:    HostCallbackInfo
              Access:      Write
              
              The audio unit should only call the host callbacks while it is in its render function. The audio unit must provide the client info when calling the callbacks as provided
              by the host. They are provided as a means for an audio unit to gain information from the host about parameters that may affect its rendering operation. 
              For example, what is the current beat of the host, is the transport running, and so forth.
              
              Any of the parameters of the callback function, when called by the audio unit, can be NULL. This indicates that the unit doesn't want to know that particular information. 
              The exception is that the unit must always specify the HostUserData which was be supplied to the unit when the property was set.

              If the host is unable to provide the requested information then it can return the kAudioUnitErr_CannotDoInCurrentContext error code

    @constant    kAudioUnitProperty_InPlaceProcessing
              Scope:      Global
              Value Type:    UInt32
              Access:      Read / Write
              
              A property that can be used to determine if the audio unit can process input data on the same data as is provided to it, and if so this can be turned off if the host
              has a particular buffer management strategy and such an operation would defeat that.
    
    @constant    kAudioUnitProperty_ElementName
              Scope:        any
              Value Type:      CFStringRef
              Access:        read/write
              Description:
              The name of the specified element. The Host owns a reference to this property value 
              (as with all other CF properties), and should release the string retrieved or used when setting.
    
    @constant    kAudioUnitProperty_CocoaUI
              Scope:        Global
              Value Type:      struct AudioUnitCocoaViewInfo
              Access:        read

              Publishes the audio unit's custom Cocoa NSViews. The Host can determine how big this structure is by 
              querying the size of the property (i.e., How many alternate UI classes there are for the unit)
              Typically, most audio units will provide 1 UI class per unit
    
    @constant    kAudioUnitProperty_SupportedChannelLayoutTags
              Scope:        Input/Output
              Value Type:      AudioChannelLayoutTags[ variable number of elements ]
              Access:        read only

              Used with GetProperty to ascertain what an audio unit understands about
              laying out of channel orders. This will normally return one or more of the specified layout tags.
              
              When a specific set of layouts are returned, the client then uses the 
              kAudioUnitProperty_AudioChannelLayout property (with one of those layout tags specified) to set 
              the unit to use that layout. In this case the client (and the audio unit when reporting its 
              AudioChannelLayout) is only expected to have set an AudioChannelLayout which only sets the 
              layout tag as the valid field.
              
              Custom Channel Maps:
              Some audio units may return the tag:
                kAudioChannelLayoutTag_UseChannelDescriptions
              
              In this case, the host then can look at supported number of channels on that scope
              (using the kAudioUnitProperty_SupportedNumChannels), and supply an AudioChannelLayout with the 
              kAudioUnitProperty_AudioChannelLayout property to specify the layout, number of channels
              and location of each of those channels. This custom channel map MUST have a channel valence
              that is supported by the Audio Unit.
              
              The UseChannelBitmap field is NOT used within the context of the AudioUnit.
    
    @constant    kAudioUnitProperty_ParameterIDName
              Scope:        any
              Element:      AudioUnitParameterID of the parameter being queried
              Value Type:      AudioUnitParameterIDName
              Access:        read

              An audio unit returns the full parameter name in the GetParameterInfo struct/property.
              In some display situations however, there may only be room for a few characters, and
              truncating this full name may give a less than optimal name for the user. Thus, 
              this property can be used to ask the audio unit whether it can supply a truncated name, with
              the host suggesting a length (number of characters). If the unit returns a longer
              name than the host requests, that name may be truncated to the requested characters in display.
              The unit could return a shorter name than requested as well. The unit returns a CFString
              that should be released by the host. When using this property, the host asks for
              the name in the same scope and element as the unit publishes the parameter.

    @constant    kAudioUnitProperty_ParameterClumpName
              Scope:        any
              Value Type:      AudioUnitParameterIDName
              Access:        read

              This works in a similar manner to the ParameterIDName property, except that the inID
              value is one of the clumpID's that are returned with the audio unit's ParameterInfo 
              structure.
    
    @constant    kAudioUnitProperty_PresentPreset
              Scope:        Global/Part
              Value Type:      AUPreset
              Access:        read/write

              This property replaces the deprecated CurrentPreset property, due to the ambiguity of
              ownership of the CFString of the preset name in the older CurrentPreset property. 
              With PresentPreset the client of the audio unit owns the CFString when it retrieves the
              preset with PresentPreset and is expected to release this (as with ALL properties 
              that retrieve a CF object from an audio unit).
    
    @constant    kAudioUnitProperty_OfflineRender
              Scope:        Global
              Value Type:      UInt32
              Access:        Read / Write
              
              This is used by the host to indicate when an audio unit (that normally operates within a general real-time calling model) is 
              rendering in an offline context. A typical usage of this is to set this to true when the rendering operation an audio unit is being used within is 
              going to write out the results to a file. The value defaults to false, as the common usage of audio units is for real-time processing
    
    @constant    kAudioUnitProperty_ParameterStringFromValue
              Scope:        any
              Value Type:      AudioUnitParameterStringFromValue
              Access:        read

              This property is used with parameters that are marked with the
              kAudioUnitParameterFlag_HasName parameter info flag. This indicates that some
              (or all) of the values represented by the parameter can and should be
              represented by a special display string.
              
              This is NOT to be confused with kAudioUnitProperty_ParameterValueStrings. That property
              is used with parameters that are indexed and is typically used for instance to build
              a menu item of choices for one of several parameter values.
              
              kAudioUnitProperty_ParameterStringFromValue can have a continuous range, and merely states
              to the host that if it is displaying those parameter's values, they should request
              a name any time any value of the parameter is set when displaying that parameter.
              
              For instance (a trivial example), a unit may present a gain parameter in a dB scale,
              and wish to display its minimum value as "negative infinity". In this case, the audio unit
              will not return names for any parameter value greater than its minimum value - so the host
              will then just display the parameter value as is. For values less than or equal to the 
              minimum value, the audio unit will return a string for "negative infinity" which the host can
              use to display appropriately.
              
              A less trivial example might be a parameter that presents its values as seconds. However,
              in some situations this value should be better displayed in a SMPTE style of display:
                HH:MM:SS:FF
              In this case, the audio unit would return a name for any value of the parameter.
              
              The GetProperty call is used in the same scope and element as the inParamID 
              that is declared in the struct passed in to this property.
              
              If the *inValue member is NULL, then the audio unit should take the current value
              of the specified parameter. If the *inValue member is NOT NULL, then the audio unit should
              return the name used for the specified value.
              
              On exit, the outName may point to a CFStringRef (which if so must be released by the caller).
              If the parameter has no special name that should be applied to that parameter value,
              then outName will be NULL, and the host should display the parameter value as
              appropriate.
            
    
    @constant    kAudioUnitProperty_ParameterValueFromString
              Scope:        any
              Value Type:      AudioUnitParameterValueFromString
              Access:        read
    
              This property returns the value of a parameter from its string representation. See kAudioUnitProperty_ParameterStringFromValue.
              
    @constant    kAudioUnitProperty_IconLocation  
              Scope:        Global
              Value Type:      CFURLRef
              Access:        Read
              
              A URL that will specify the location of an icon file that can be used when presenting UI for this audio unit.
    
    @constant    kAudioUnitProperty_PresentationLatency
              Scope:        Input/Output
              Value Type:      Float64
              Access:        write

              This property is set by a host to describe to the audio unit the presentation latency of both
              any of its input and/or output audio data. 
              It describes this latency in seconds. A value of zero means either no latency
              or an unknown latency.
              
              This is a write only property because the host is telling the audio unit the latency of both the 
              data it provides it for input and the latency from getting the data from the unit until it is 
              presented.
              
              The property is should be set on each active input and output bus (Scope/Element pair). 
              For example, an audio unit with multiple outputs will have the output data it produces processed 
              by different audio units, etc before it is mixed and presented. Thus, in this case, each output 
              element could have a different presentation latency.
              
              This should not be confused with the Latency property, where the audio unit describes to the host 
              any processing latency it introduces between its input and its output.
              
              For input:
                Describes how long ago the audio given to an audio unit was acquired. For instance, when 
                reading from a file to the first audio unit, then its input presentation latency will be zero. 
                When processing audio input from a  device, then this initial input latency will be the 
                presentation latency of the device itself, the device's safety offset and latency.
                
                The next audio unit's (connected to that first unit) input presentation latency will be the 
                input presentation latency of the first unit, plus the processing latency (as expressed by 
                kAudioUnitProperty_Latency) of the first unit.
                
              For output:
                Describes how long before the output audio of an audio unit is to be presented. For instance, 
                when writing to a file, then the last audio unit's output presentation latency will be zero. 
                When the audio from that audio unit is to be played to an AudioDevice, then that initial 
                presentation latency will be the latency of the device itself - which is the I/O buffer size, 
                and the device's safety offset and latency
                
                The previous audio unit's (connected to this last unit) output presentation latency will be that 
                initial presentation latency plus the processing latency (as expressed by 
                kAudioUnitProperty_Latency) of the last unit.
                
              So, for a given audio unit anywhere within a mixing graph, the input and output presentation 
              latencies describe to that unit how long from the moment of generation it will take for its 
              input to arrive, and how long it will take for its output to be presented. 
              
              You can use this property, for example, to provide metering for an audio unit that
              is generating output to be presented to the user at a future time.
    
    @constant    kAudioUnitProperty_DependentParameters
              Scope:        any
              Value Type:      array of AUDependentParameter
              Access:        read
      
              This property is used for parameters with the kAudioUnitParameterFlag_IsGlobalMeta 
              or kAudioUnitParameterFlag_IsElementMeta flags set. Hosts applications (and the 
              AudioUnitParameterListener mechanism) can interrogate this property to determine which parameters 
              are dependent on a
              meta-parameter.
              
              For parameters marked with kAudioUnitParameterFlag_IsGlobalMeta, any non-global
              dependent parameters are assumed to be dependent in every element of their scope.
              
              For parameters marked with kAudioUnitParameterFlag_IsElementMeta, then its dependent
              parameters must all be the same scope, and are assumed to apply only within a single element,
              not to other instances of the same parameter in other elements.
    
    @constant    kAudioUnitProperty_AUHostIdentifier
              Scope:        Global
              Value Type:      AUHostVersionIdentifier
              Access:        write

              Determine which application (and which version) an audio unit is being hosted by. 
              This is made more complex through the intervention of audio units such as Kore, that are hosting 
              other audio units (in this case of course, the real host of the audio unit is the hosting unit, 
              not the host application, so the previous mechanism of getting the main bundle ID is no longer 
              correct). 
              
              There are also inconsistencies in the way that bundle identifiers are applied (with apps changing 
              these from version to version), and we'd prefer to see a more consistent identifier used with 
              this property. This is in spirit similar to the string returned by CFBundle API, except that we 
              require this host string be consistent and reliable through different revisions of the host.

              The audio unit is responsible for retaining the hostName string if it needs to use it past the 
              duration of the actual call. The host should set this property as early as possible within the 
              lifetime of the unit in a session.
              
              This API used to take a NumVersion struct. It is redefined to take an AUHostVersionIdentifier struct
              which is binary compatible with the existing usage, but not source compatible.
              
    @constant    kAudioUnitProperty_MIDIOutputCallbackInfo
              Scope:        Global
              Value Type:      CFArrayRef
              Access:        read

              Used to determine how many MIDI output streams the audio unit can generate  (and the name for 
              each of these outputs). Each MIDI output is a complete MIDI data stream, such as embodied by a 
              MIDIEndpointRef in CoreMIDI.
              
              The host can retrieve an array of CFStringRefs published by the audio unit, where :
                - the size of the array is the number of MIDI Outputs the audio unit supports
                - each item in the array is the name for that output at that index
              
              The host should release the array when it is finished with it.
              
              Once the host has determined that the audio unit supports this feature, it can then provide a 
              callback, through which the audio unit can send the MIDI data.
              See the documentation for the kAudioUnitProperty_MIDIOutputCallback property.
    
    @constant    kAudioUnitProperty_MIDIOutputCallback
              Scope:        Global
              Value Type:      AUMIDIOutputCallbackStruct
              Access:        write

              The host sets this property on the audio unit with the callback (and its user data) set 
              appropriately.
              
              Operational Parameters:
                In the render call, just as is the expected usage of the AUHostCallbacks, the audio unit can 
                call the provided callback to provide MIDI data to the host that it will associate with the 
                current AudioUnitRender call in process.

              The audio unit in the callback provides:
                - the user data provided by the host when the callback was established
                - the AudioTimeStamp that was provided to the audio unit for this particular call of 
                  AudioUnitRender
                - the output number to associate this MIDI data with
                - a MIDI Packet List containing MIDI data. The time stamp values contained within the 
                MIDIPackets in this list are **sample offsets*** from the AudioTimeStamp provided. 
                This allows MIDI data to be time-stamped with a sample offset that is directly associated 
                with the audio data it is generating in the current call to the AudioUnitRender function

              There is no implied or expected association between the number (or position) of an audio unit's 
              audio or MIDI outputs.

    @constant    kAudioUnitProperty_InputSamplesInOutput
              Scope:      Global
              Value Type:    struct AUInputSamplesInOutputCallbackStruct
              Access:     read/write
   
              An audio unit calls this callback at the end of its render call. The audio unit supplies the 
              following information:

              outputTime      - The timestamp passed in to the audio unit's render call. This timestamp 
                        represents the time of the first output sample.
              inputSample     - The sample number of the first input sample that is present in the output 
                        audio.
              numInputSamples - The number of input samples that were used and are present in the output 
                        audio.

              This property allows a host application to determine which input samples correspond to a sample 
              in the output buffer. It is useful only for audio units that do time-stretching, such as the 
              AUVarispeed and AUTimePitch units, where the relationship between input and output samples is 
              non-trivial. For these units, the range of input samples that correspond to an output buffer 
              typically differs from the range of input samples that were pulled for that render call. 
              This difference arises because of internal buffering, processing latency, and other factors.
    
    @constant    kAudioUnitProperty_ClassInfoFromDocument
              Scope:      Global
              Value Type:    CFDictionary
              Access:     read/write
   
              If the audio unit implements this property then it is going to do different actions establishing
              its state from a document rather than from a user preset. Thus, a host app should use this property
              first (instead of kAudioUnitProperty_ClassInfo) when restoring the state of an audio unit when 
              opening a document. If the audio unit returns an error (or doesn't implement this property) then
              the host should use the same preset with the kAudioUnitProperty_ClassInfo. 
   

    @constant    kAudioUnitProperty_ShouldAllocateBuffer
              Scope:      input/output elements (settable per element)
              Value Type:    UInt32
              Access:     read/write
   
              By default this value is true. This affects the allocations of the buffers for I/O (the mData field
              of the AudioBufferList used with AudioUnitRender, callbacks and connections)
              
              If true, the element will create a buffer for rendering into.
              
              If false, the element will not create a buffer for rendering.
              
              For example, if the audio unit is only ever going to have a connection as its input and never a callback, then
              it should not need to create a buffer (the API contract expects an audio unit to provide a buffer for
              callbacks, but no buffer for connections).
              
              If the audio unit is always going to be pulled for audio with the client providing audio data buffers to 
              the AudioUnitRender call, then it will never need to create an audio buffer on the output side.
              
              So, this property can be used to control the default allocation strategy of an audio unit. If the audio unit
              needs a buffer, but one hasn't been allocated, then an error will be thrown from that call to AudioUnitRender.
              
              This property cannot be set on Initialised audio units as it may end up reallocating memory.


    @constant    kAudioUnitProperty_FrequencyResponse
              Scope:      input/output elements (settable per element)
              Value Type:    AudioUnitFrequencyResponseBin
              Access:     read
              
              The property provides a way for a user interface view to get points for drawing a graph of the frequency
              response of the AU. 
              
              An array of AudioUnitFrequencyResponseBin are passed in to kAudioUnitProperty_FrequencyResponse
              with the mFrequency field filled in. The array is returned with the mMagnitude fields filled in.
              If fewer than kNumberOfResponseFrequencies are needed, then the first unused bin should be marked with 
              a negative frequency.
    
    @constant    kAudioUnitProperty_ParameterHistoryInfo
              Scope:      Global
              Value Type:    AudioUnitParameterHistoryInfo
              Access:     read
              
              For parameters which have kAudioUnitParameterFlag_PlotHistory set, getting this property fills out the 
              AudioUnitParameterHistoryInfo struct containing the recommended update rate and history duration.

    @constant    kAudioUnitProperty_NickName
              Scope:      Global
              Value Type:    CFStringRef
              Access:      read/write
               
              Provides a way for a host to set a custom name on an AU. 
   
              An example of when this is useful is when a host is managing a processing chain that contains multiple AU
              instances of the same subtype (and type and manufacturer). The host uses this property to assign a 
              unique name to each AU instance indicating what that particular instance's function is in the processing
              chain and can later query the property to distinguish between AU instances with the same type/subtype/manu
              tuple. It is the host's responsibility to keep the names unique if uniqueness is required. 
   
              When getting this property, ownership follows Core Foundation's 'Copy Rule'. This property may return NULL 
              which indicates that no name has been set on the AU.

    @constant    kAudioUnitProperty_RequestViewController
              Scope:      Global
              Value Type:    block: void (^)(AUViewControllerBase *)
              Access:      write
              
              If the audio unit is implemented using the version 3 API, it may provide a
              view controller, returned via this property. As with any other CoreFoundation
              or Foundation object returned by AudioUnitGetProperty, the caller must
              release the returned reference (i.e. the Copy rule is used).

    @constant    kAudioUnitProperty_ParametersForOverview
              Scope:      Global
              Value Type:    variably-sized array of struct AudioUnitParameter
              Access:      read
              
              A host may query an audio unit for a list of its N most important
              parameters, via this property. The size of the array passed to
              AudioUnitGetProperty controls the number of AudioUnitParameter values
              returned.
      @constant       kAudioUnitProperty_SupportsMPE
                          Scope:          Global
                          Value Type:     UInt32
                          Access:         read
                          
                          Indicates whether an audio unit supports Multi-dimensional Polyphonic Expression.
  */
  //CF_ENUM(AudioUnitPropertyID)
  //{
  // range (0 -> 999)
    JS_ASSIGN_ENUM(kAudioUnitProperty_ClassInfo, AudioUnitPropertyID); //           = 0,
    JS_ASSIGN_ENUM(kAudioUnitProperty_MakeConnection, AudioUnitPropertyID); //         = 1,
    JS_ASSIGN_ENUM(kAudioUnitProperty_SampleRate, AudioUnitPropertyID); //           = 2,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ParameterList, AudioUnitPropertyID); //         = 3,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ParameterInfo, AudioUnitPropertyID); //         = 4,
    JS_ASSIGN_ENUM(kAudioUnitProperty_CPULoad, AudioUnitPropertyID); //             = 6,
    JS_ASSIGN_ENUM(kAudioUnitProperty_StreamFormat, AudioUnitPropertyID); //           = 8,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ElementCount, AudioUnitPropertyID); //           = 11,
    JS_ASSIGN_ENUM(kAudioUnitProperty_Latency, AudioUnitPropertyID); //             = 12,
    JS_ASSIGN_ENUM(kAudioUnitProperty_SupportedNumChannels, AudioUnitPropertyID); //       = 13,
    JS_ASSIGN_ENUM(kAudioUnitProperty_MaximumFramesPerSlice, AudioUnitPropertyID); //     = 14,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ParameterValueStrings, AudioUnitPropertyID); //     = 16,
    JS_ASSIGN_ENUM(kAudioUnitProperty_AudioChannelLayout, AudioUnitPropertyID); //       = 19,  
    JS_ASSIGN_ENUM(kAudioUnitProperty_TailTime, AudioUnitPropertyID); //             = 20,
    JS_ASSIGN_ENUM(kAudioUnitProperty_BypassEffect, AudioUnitPropertyID); //           = 21,
    JS_ASSIGN_ENUM(kAudioUnitProperty_LastRenderError, AudioUnitPropertyID); //         = 22,
    JS_ASSIGN_ENUM(kAudioUnitProperty_SetRenderCallback, AudioUnitPropertyID); //       = 23,
    JS_ASSIGN_ENUM(kAudioUnitProperty_FactoryPresets, AudioUnitPropertyID); //         = 24,
    JS_ASSIGN_ENUM(kAudioUnitProperty_RenderQuality, AudioUnitPropertyID); //         = 26,
    JS_ASSIGN_ENUM(kAudioUnitProperty_HostCallbacks, AudioUnitPropertyID); //         = 27,
    JS_ASSIGN_ENUM(kAudioUnitProperty_InPlaceProcessing, AudioUnitPropertyID); //       = 29,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ElementName, AudioUnitPropertyID); //           = 30,
    JS_ASSIGN_ENUM(kAudioUnitProperty_SupportedChannelLayoutTags, AudioUnitPropertyID); //   = 32,
    JS_ASSIGN_ENUM(kAudioUnitProperty_PresentPreset, AudioUnitPropertyID); //         = 36,
    JS_ASSIGN_ENUM(kAudioUnitProperty_DependentParameters, AudioUnitPropertyID); //       = 45,
    JS_ASSIGN_ENUM(kAudioUnitProperty_InputSamplesInOutput, AudioUnitPropertyID); //       = 49,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ShouldAllocateBuffer, AudioUnitPropertyID); //       = 51,
    JS_ASSIGN_ENUM(kAudioUnitProperty_FrequencyResponse, AudioUnitPropertyID); //       = 52,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ParameterHistoryInfo, AudioUnitPropertyID); //       = 53,
    JS_ASSIGN_ENUM(kAudioUnitProperty_NickName, AudioUnitPropertyID); //                      = 54,
      JS_ASSIGN_ENUM(kAudioUnitProperty_OfflineRender, AudioUnitPropertyID); //         = 37,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ParameterIDName, AudioUnitPropertyID); //         = 34,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ParameterStringFromValue, AudioUnitPropertyID); //     = 33,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ParameterClumpName, AudioUnitPropertyID); //       = 35,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ParameterValueFromString, AudioUnitPropertyID); //     = 38,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ContextName, AudioUnitPropertyID); //           = 25,
    JS_ASSIGN_ENUM(kAudioUnitProperty_PresentationLatency, AudioUnitPropertyID); //       = 40,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ClassInfoFromDocument, AudioUnitPropertyID); //     = 50,
    JS_ASSIGN_ENUM(kAudioUnitProperty_RequestViewController, AudioUnitPropertyID); //     = 56,
    JS_ASSIGN_ENUM(kAudioUnitProperty_ParametersForOverview, AudioUnitPropertyID); //     = 57,
    JS_ASSIGN_ENUM(kAudioUnitProperty_SupportsMPE, AudioUnitPropertyID); //           = 58,

#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(kAudioUnitProperty_FastDispatch, AudioUnitPropertyID); //           = 5,
    JS_ASSIGN_ENUM(kAudioUnitProperty_SetExternalBuffer, AudioUnitPropertyID); //       = 15,
    JS_ASSIGN_ENUM(kAudioUnitProperty_GetUIComponentList, AudioUnitPropertyID); //       = 18,
    JS_ASSIGN_ENUM(kAudioUnitProperty_CocoaUI, AudioUnitPropertyID); //             = 31,
    JS_ASSIGN_ENUM(kAudioUnitProperty_IconLocation, AudioUnitPropertyID); //           = 39,
    JS_ASSIGN_ENUM(kAudioUnitProperty_AUHostIdentifier, AudioUnitPropertyID); //         = 46,
#endif

    JS_ASSIGN_ENUM(kAudioUnitProperty_MIDIOutputCallbackInfo, AudioUnitPropertyID); //        = 47,
    JS_ASSIGN_ENUM(kAudioUnitProperty_MIDIOutputCallback, AudioUnitPropertyID); //            = 48,
  //};
#if AU_SUPPORT_INTERAPP_AUDIO
  /*
      @enum           Inter-App Audio Property IDs
      @abstract       Properties used in inter-app audio.

    @constant    kAudioUnitProperty_RemoteControlEventListener
    @discussion      Scope:      Global
              Value Type:    AudioUnitRemoteControlEventListener
              Access:      read/write
              
            Provides a way for a host to receive AudioUnitRemoteControlEvents from a remote "node"
            audio unit. The supplied listener block is called when the audio unit sends a remote
            control event.

    @constant    kAudioUnitProperty_IsInterAppConnected
    @discussion      Scope: Global
              Value Type: UInt32 (0-1)
              Access: read-only
            
            Both host and node apps can query and listen to this property to determine when
            the audio unit has been connected to another app.

    @constant    kAudioUnitProperty_PeerURL
    @discussion      Scope: Global
              Value Type: CFURLRef
              Access: read-only
            
            Both host and node apps can query this property to obtain a URL which, when
            opened, will activate the other app.
            
            N.B. This URL is only valid while the host has an open connection to the node.
  */
  //CF_ENUM(AudioUnitPropertyID)
  //{
    JS_ASSIGN_ENUM(kAudioUnitProperty_RemoteControlEventListener, AudioUnitPropertyID); //   = 100,
    JS_ASSIGN_ENUM(kAudioUnitProperty_IsInterAppConnected, AudioUnitPropertyID); //       = 101,
    JS_ASSIGN_ENUM(kAudioUnitProperty_PeerURL, AudioUnitPropertyID); //             = 102
  //};
#endif // AU_SUPPORT_INTERAPP_AUDIO

  /*!
      @abstract       Keys contains in an audio unit preset (ClassInfo) dictionary
      @discussion     These strings are used as keys in the AUPreset-"classInfo" dictionary
            The actual keys are CFStrings to use these keys you define the key as:
              static const CFStringRef kMyVersionString = CFSTR(kAUPresetVersionKey);
  */
  JS_ASSIGN_ENUM(kAUPresetVersionKey, const_char_ptr); //      "version"
  JS_ASSIGN_ENUM(kAUPresetTypeKey, const_char_ptr); //        "type"
  JS_ASSIGN_ENUM(kAUPresetSubtypeKey, const_char_ptr); //      "subtype"
  JS_ASSIGN_ENUM(kAUPresetManufacturerKey, const_char_ptr); //   "manufacturer"
  JS_ASSIGN_ENUM(kAUPresetDataKey, const_char_ptr); //       "data"
  JS_ASSIGN_ENUM(kAUPresetNameKey, const_char_ptr); //       "name"
  JS_ASSIGN_ENUM(kAUPresetNumberKey, const_char_ptr); //       "preset-number"
  JS_ASSIGN_ENUM(kAUPresetRenderQualityKey, const_char_ptr); //   "render-quality"
  JS_ASSIGN_ENUM(kAUPresetCPULoadKey, const_char_ptr); //       "cpu-load"
  JS_ASSIGN_ENUM(kAUPresetElementNameKey, const_char_ptr); //     "element-name"
  JS_ASSIGN_ENUM(kAUPresetExternalFileRefs, const_char_ptr); //   "file-references"

#if !TARGET_OS_IPHONE
    // these are keys to use when a preset contains data from other plugin formats
    // vstdata is used to signify VST state from a vst "bank"
    JS_ASSIGN_ENUM(kAUPresetVSTDataKey, const_char_ptr); //       "vstdata"
    // vstpreset is used to signify VST state from a vst "preset"
    JS_ASSIGN_ENUM(kAUPresetVSTPresetKey, const_char_ptr); //     "vstpreset"

    JS_ASSIGN_ENUM(kAUPresetMASDataKey, const_char_ptr); //       "masdata"
#endif

  /*!
      @define         kAUPresetPartKey
      @discussion     This key if present, distinguishes a global preset that is set 
            on the global scope with a part-based preset that is set on the part scope. 
            The value of this key is audio unit defined
  */
  JS_ASSIGN_ENUM(kAUPresetPartKey, const_char_ptr); //       "part"













  /*!
      @enum           Apple AUConverter Property IDs
      @abstract       The collection of property IDs for Apple AUConverter
    
    @constant    kAudioUnitProperty_SampleRateConverterComplexity
    @discussion      Scope:      Global
              Value Type:    UInt32
              Access:      read/write
  */
  //CF_ENUM(AudioUnitPropertyID) {
    JS_ASSIGN_ENUM(kAudioUnitProperty_SampleRateConverterComplexity, AudioUnitPropertyID); //   = 3014
  //};

  /*!
    @enum      Audio Unit Sample Rate Converter Complexity
    @discussion    The lowest quality of the Mastering algorithm is higher than the highest quality of the Normal algorithm.
    @constant    kAudioUnitSampleRateConverterComplexity_Normal
    @discussion      Normal quality sample rate conversion.
    @constant    kAudioUnitSampleRateConverterComplexity_Mastering
    @discussion      Mastering quality sample rate conversion. More expensive.
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSampleRateConverterComplexity_Linear, UInt32); //         = 'line',  // linear interpolation
    JS_ASSIGN_ENUM(kAudioUnitSampleRateConverterComplexity_Normal, UInt32); //         = 'norm',  // the default
    JS_ASSIGN_ENUM(kAudioUnitSampleRateConverterComplexity_Mastering, UInt32); //       = 'bats'  // higher quality, more expensive
  //};

  //=====================================================================================================================
#pragma mark - AUHAL and device units
  /*!
      @enum           Apple Output Property IDs
      @abstract       The collection of property IDs for Apple output units
    
    @constant    kAudioOutputUnitProperty_CurrentDevice
    @discussion      Scope:      Global
              Value Type:    AudioObjectID
              Access:      read/write
              
              The audio device being used (or to be used) by and output device unit
              
    @constant    kAudioOutputUnitProperty_ChannelMap
    @discussion      Scope:      Input/Output
              Value Type:    Array of SInt32
              Access:      Read / Write

              This will also work with AUConverter. This property is used to map input channels from an input (source) to a destination.
              The number of channels represented in the channel map is the number of channels of the destination. The channel map entries
              contain a channel number of the source that should be mapped to that destination channel. If -1 is specified, then that 
              destination channel will not contain any channel from the source (so it will be silent)
              
    @constant    kAudioOutputUnitProperty_EnableIO
    @discussion      Scope: { scope output, element 0 = output } { scope input, element 1 = input }
              Value Type: UInt32
              Access: read/write
                Output units default to output-only operation. Host applications may disable 
                output or enable input operation using this property, if the output unit 
                supports it. 0=disabled, 1=enabled using I/O proc.

    @constant    kAudioOutputUnitProperty_StartTime
    @discussion      Scope: Global
              Value Type: AudioOutputUnitStartAtTimeParams
              Access: write only
                When this property is set on an output unit, it will cause the next Start request
                (but no subsequent Starts) to use AudioDeviceStartAtTime, using the specified 
                timestamp, passing false for inRequestedStartTimeIsInput.

    @constant    kAudioOutputUnitProperty_SetInputCallback
    @discussion      Scope: Global
              Value Type: AURenderCallbackStruct
              Access: read/write
                When an output unit has been enabled for input operation, this callback can be 
                used to provide a single callback to the host application from the input 
                I/O proc, in order to notify the host that input is available and may be 
                obtained by calling the AudioUnitRender function.
                
                Note that the inputProc will always receive a NULL AudioBufferList in ioData.
                You must call AudioUnitRender in order to obtain the audio.

    @constant    kAudioOutputUnitProperty_HasIO
    @discussion      Scope: { scope output, element 0 = output } { scope input, element 1 = input }
              Value Type: UInt32
              Access:
                See kAudioOutputUnitProperty_EnableIO
                Property value is 1 if there are any valid hardware streams on the specified element.

    @constant    kAudioOutputUnitProperty_StartTimestampsAtZero
    @discussion      Scope: Global
              Value Type: UInt32
              Access: read/write

                Apple output units typically begin their stream of timestamps presented to their
                inputs at sample time 0. Some applications may wish to receive the HAL's timestamps
                directly instead. When this property is set to false, the output unit's sample times
                will be direct reflections of the HAL's -- except when a sample rate conversion
                makes this impossible.
                
                This property also applies to AUConverter. Its value defaults to 1 for AUHAL;
                1 for other AUs.
  */
  //CF_ENUM(AudioUnitPropertyID) {
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_CurrentDevice, AudioUnitPropertyID); //       = 2000,
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_ChannelMap, AudioUnitPropertyID); //         = 2002, // this will also work with AUConverter
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_EnableIO, AudioUnitPropertyID); //         = 2003,
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_StartTime, AudioUnitPropertyID); //         = 2004,
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_SetInputCallback, AudioUnitPropertyID); //     = 2005,
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_HasIO, AudioUnitPropertyID); //           = 2006,
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_StartTimestampsAtZero, AudioUnitPropertyID); //   = 2007  // this will also work with AUConverter
  //};

#if AU_SUPPORT_INTERAPP_AUDIO
  /*!
      @enum           Apple Inter-App Output Property IDs
      @abstract       The collection of property IDs for Apple output units with inter-app audio on iOS.
    
    @constant    kAudioOutputUnitProperty_MIDICallbacks
    @discussion      Scope: Global
              Value Type: AudioOutputUnitMIDICallbacks
              Access: read/write

            When an output unit is published as a remote instrument or music effect, this
            property must be set on the unit in order to receive MIDI events from the
            host. The specified callbacks will be called at render time, immediately
            prior to the request to render a buffer.

    @constant    kAudioOutputUnitProperty_HostReceivesRemoteControlEvents
    @discussion      Scope: Global
              Value Type: UInt32
              Access: read-only
            Indicates whether the connected host app (if any) receives remote control events.

    @constant    kAudioOutputUnitProperty_RemoteControlToHost
    @discussion      Scope: Global
              Value Type: AudioUnitRemoteControlEvent
              Access: write-only
            A node app can set this property on its output unit in order to send a remote
            control event to the host app.

    @constant    kAudioOutputUnitProperty_HostTransportState
    @discussion      Scope: Global
              Value Type: UInt32 (dummy, always 0)
              Access: listener only
            Indicates that the host's record or play transport state has changed and that any
            UI reflecting it should be updated. The actual state must be fetched from the
            HostCallbacks.

    @constant    kAudioOutputUnitProperty_NodeComponentDescription
    @discussion      Scope: Global
              Value Type: AudioComponentDescription
              Access: read-only
            If a single output unit is published with multiple component descriptions, the
            node app needs to know which component description the host used to connect.
            This property returns that component description.
  */
  //CF_ENUM(AudioUnitPropertyID) {
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_MIDICallbacks, AudioUnitPropertyID); //       = 2010,
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_HostReceivesRemoteControlEvents, AudioUnitPropertyID); //  = 2011,
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_RemoteControlToHost, AudioUnitPropertyID); //   = 2012,
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_HostTransportState, AudioUnitPropertyID); //     = 2013,
    JS_ASSIGN_ENUM(kAudioOutputUnitProperty_NodeComponentDescription, AudioUnitPropertyID); //  = 2014
  //};

#endif // AU_SUPPORT_INTERAPP_AUDIO

JS_INIT_GLOBALS_END(AudioUnitProperties);
