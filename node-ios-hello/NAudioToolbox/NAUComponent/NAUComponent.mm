//
//  NAUComponent.mm
//
//  Created by Shawn Presser on 7/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAUComponent.h"

#include "NAudioComponent.h"
#include "NCoreAudioTypes.h"
#include "NMacTypes.h"

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
  @function    AudioUnitGetProperty
  @abstract    retrieves the value of a specified property
  @discussion    The API can is used to retrieve the value of the property. Property values for 
          audio units are always passed by reference
          
  @param      inUnit
          the audio unit
  @param      inID
          the property identifier
  @param      inScope
          the scope of the property
  @param      inElement
          the element of the scope
  @param      outData
          used to retrieve the value of the property. It should point to memory at least 
          as large as the value described by ioDataSize
  @param      ioDataSize  
          on input contains the size of the data pointed to by outData, on output, the 
          size of the data that was returned.

  @result      noErr, or various audio unit errors related to properties
*/
/*
extern OSStatus
AudioUnitGetProperty(        AudioUnit        inUnit,
                  AudioUnitPropertyID    inID,
                  AudioUnitScope      inScope,
                  AudioUnitElement    inElement,
                  void *          outData,
                  UInt32 *        ioDataSize)        
                        API_AVAILABLE(macos(10.0), ios(2.0), watchos(2.0), tvos(9.0));
 */


NAN_METHOD(AudioUnitGetProperty) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioUnit, inUnit);
    declare_value(AudioUnitPropertyID, inID);
    declare_value(AudioUnitScope, inScope);
    declare_value(AudioUnitElement, inElement);
    if (is_value_UInt32(info[JS_ARGC])) {
      declare_value(UInt32, inValue);
      UInt32 inValueSize = sizeof(inValue);
      NXThrowIfError(::AudioUnitGetProperty(inUnit, inID, inScope, inElement, &inValue, &inValueSize), "AudioUnitGetProperty failed");
      js_return_value(UInt32, inValue);
    } else if (is_value_AudioStreamBasicDescription(info[JS_ARGC])) {
      declare_value(AudioStreamBasicDescription, inValue);
      UInt32 inValueSize = sizeof(inValue);
      NXThrowIfError(::AudioUnitGetProperty(inUnit, inID, inScope, inElement, &inValue, &inValueSize), "AudioUnitGetProperty failed");
      js_return_value(AudioStreamBasicDescription, inValue);
    } else {
      js_panic_noreturn("AudioUnitGetProperty failed: value type not yet implemented");
    }
  }
}

/*!
  @function    AudioUnitSetProperty
  @abstract    sets the value of a specified property
  @discussion    The API can is used to set the value of the property. Property values for 
          audio units are always passed by reference
          
  @param      inUnit
          the audio unit
  @param      inID
          the property identifier
  @param      inScope
          the scope of the property
  @param      inElement
          the element of the scope
  @param      inData
          if not null, then is the new value for the property that will be set. If null, 
          then inDataSize should be zero, and the call is then used to remove a 
          previously set value for a property. This removal is only valid for
          some properties, as most properties will always have a default value if not 
          set.
  @param      inDataSize  
          the size of the data being provided in inData

  @result      noErr, or various audio unit errors related to properties
*/
/*
extern OSStatus
AudioUnitSetProperty(        AudioUnit        inUnit,
                  AudioUnitPropertyID    inID,
                  AudioUnitScope      inScope,
                  AudioUnitElement    inElement,
                  const void * __nullable  inData,
                  UInt32          inDataSize)        
                        API_AVAILABLE(macos(10.0), ios(2.0), watchos(2.0), tvos(9.0));
 */

NAN_METHOD(AudioUnitSetProperty) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioUnit, inUnit);
    declare_value(AudioUnitPropertyID, inID);
    declare_value(AudioUnitScope, inScope);
    declare_value(AudioUnitElement, inElement);
    if (is_value_UInt32(info[JS_ARGC])) {
      declare_value(UInt32, inValue);
      NXThrowIfError(::AudioUnitSetProperty(inUnit, inID, inScope, inElement, &inValue, sizeof(inValue)), "AudioUnitSetProperty failed");
    } else if (is_value_AudioStreamBasicDescription(info[JS_ARGC])) {
      declare_value(AudioStreamBasicDescription, inValue);
      NXThrowIfError(::AudioUnitSetProperty(inUnit, inID, inScope, inElement, &inValue, sizeof(inValue)), "AudioUnitSetProperty failed");
    } else {
      js_panic_noreturn("AudioUnitSetProperty failed: value type not yet implemented");
    }
  }
}

JS_INIT_GLOBALS(AUComponent);
  JS_ASSIGN_GLOBAL_METHOD(AudioUnitGetProperty);
  JS_ASSIGN_GLOBAL_METHOD(AudioUnitSetProperty);

  // global values (exports)
  /*!
      @enum           Audio Unit Types
      @abstract    different types of audio units
    @discussion    Audio units are classified into different types, where those types perform 
            different roles and functions.
            There are some general categories of functionality that apply across different 
            types of audio units:
            (1) Real-time usage
              The audio unit will complete its operations in less time than is 
              represented by the render buffer. All audio units with the exception of 
              the OfflineEffect should meet this criteria
            (2) Real-time I/O
              Will request the same amount of audio input as it is being asked to 
              produce for output. Effects, Panners, Mixers and MusicDevices are required 
              to adhere to this restriction. FormatConverter's can with some constraints
              be used in this situation (for instance, sample rate conversion, float-int),
              but the host of the audio unit is responsible for insuring this.
            (3) UI versus Programmatic usage
              UI usage covers the case of using an audio unit in a Digital Audio 
              Workstation (DAW) with appropriate UI (for example a filter in Garage Band 
              or Logic). Effects, Panners, MusicDevices are all expected to be usable 
              within this context. 
              Programmatic usage is where an audio unit is used by a host app as part of
              a general signal processing chain.
              For instance, a mixer audio unit can be used to take several different 
              audio sources in a game and mix them together. Mixers, Output units are 
              for programmatic usage. FormatConverter and Generator types are generally
              programmatic audio units, but if they can be used in a UI situation, they 
              specify a custom view. The app can then use that to decide that, with 
              appropriate constraints, the audio unit could be presented in a DAW type 
              application. For instance, the AUConverter audio unit from apple can do 
              sample rate conversion, etc, but has not general utility for a user in a 
              DAW app. Apple's Varispeed or AUTimePitch audio units can be used to change
              the playback rate and pitch and so could be used to good affect by a user 
              in a DAW type environment, as well as just providing this general 
              functionality to any program.
            
    @constant    kAudioUnitType_Output
            An output unit can be used as the head of an AUGraph. Apple provides a number 
            of output units that interface directly with an audio device
            
    @constant    kAudioUnitType_MusicDevice
            Used to describe software musical instruments such as samplers and 
            synthesisers. They respond to MIDI and create notes, which are then controlled
            through parameters or MIDI control messages. See <AudioToolbox/MusicDevice.h>
                      
    @constant    kAudioUnitType_MusicEffect
            Is an effect that is also able to respond directly to MIDI control messages, 
            typically through the mapping of these MIDI messages to different parameters 
            of the effect's DSP algorithm.
            
    @constant    kAudioUnitType_FormatConverter
            A format converter is a general category for audio units that can change the 
            format (for instance, sample rate conversion) from an input to an output, as 
            well as other, non-I/O type manipulations (like a deferred render or varispeed 
            type of operation). As such, a format converter can ask for as much or as 
            little audio input to produce a given output. They are still expected to
            complete their rendering within the time represented by the output buffer. 
            For format converters that have some utility as an "audio effect or processor", 
            it is quite common to provide an offline version of this audio unit as well. 
            For instance, Apple ships a format converter (for use in a "real-time" like 
            situation) and an offline version (for processing audio files) of the Time 
            Pitch and Varispeed audio units.
            
    @constant    kAudioUnitType_Effect
            An audio unit that will process some x number of audio input samples to produce 
            x number of audio output samples. The common case for an effect is to have a 
            single input to a single output, though some effects take side-chain inputs as 
            well. Effects can be run in "offline" contexts (such as processing a file), but 
            they are expected to run in real-time. A delay unit or reverb is a good 
            example of this.
            
    @constant    kAudioUnitType_Mixer
            An audio unit that takes some number of inputs, mixing them to provide 1 or 
            more audio outputs. A stere mixer (mono and stereo inputs to produce one 
            stereo output) is an example of this.
            
    @constant    kAudioUnitType_Panner
            A panner is a specialised effect that will pan a single audio input to a single
            output. Panner units are required to support a collection of standardised 
            parameters that specify the panning coordinates (aside from whatever custom 
            parameters the panner may provide). A surround panner is an example of this
            
    @constant    kAudioUnitType_Generator
            A generator will have no audio input, but will just produce audio output. In 
            some ways it is similar to a MusicDevice, except that a generator provides no 
            MIDI input, or notion of "notes". A tone generator is a good example of this.
            
    @constant    kAudioUnitType_OfflineEffect
            An offline effect is used to process data from a file and is also used to 
            publish a capability that cannot be run in real-time. For instance, the process
            of normalisation requires seeing the entire audio input before the scalar to 
            apply in the normalisation process can be estimated. As such, offline effects 
            also have a notion of a priming stage that can be performed before the actual 
            rendering/processing phase is executed.

      @constant    kAudioUnitType_MIDIProcessor
                      Plugins of this type process midi input and produce midi output. They do not produce audio.

  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitType_Output, UInt32); //           = 'auou',
    JS_ASSIGN_ENUM(kAudioUnitType_MusicDevice, UInt32); //         = 'aumu',
    JS_ASSIGN_ENUM(kAudioUnitType_MusicEffect, UInt32); //         = 'aumf',
    JS_ASSIGN_ENUM(kAudioUnitType_FormatConverter, UInt32); //       = 'aufc',
    JS_ASSIGN_ENUM(kAudioUnitType_Effect, UInt32); //           = 'aufx',
    JS_ASSIGN_ENUM(kAudioUnitType_Mixer, UInt32); //           = 'aumx',
    JS_ASSIGN_ENUM(kAudioUnitType_Panner, UInt32); //           = 'aupn',
    JS_ASSIGN_ENUM(kAudioUnitType_Generator, UInt32); //         = 'augn',
    JS_ASSIGN_ENUM(kAudioUnitType_OfflineEffect, UInt32); //       = 'auol',
    JS_ASSIGN_ENUM(kAudioUnitType_MIDIProcessor, UInt32); //       = 'aumi'
  //};

#if AU_SUPPORT_INTERAPP_AUDIO
  /*!
      @enum           Audio Unit Types (for inter-app audio)
      @abstract    types of inter-app audio units

      @constant       kAudioUnitType_RemoteEffect
      @constant       kAudioUnitType_RemoteGenerator
      @constant       kAudioUnitType_RemoteInstrument
      @constant       kAudioUnitType_RemoteMusicEffect
    
    @discussion
          These Audio Unit types are identical to the corresponding "non-remote" types (e.g.
          kAudioUnitType_Effect, etc.), with the exception that they are the types that must be
          used for AudioUnits defined by applications calling AudioOutputUnitPublish.

      When Audio Components of these types are instantiated via AudioComponentInstanceNew,
      a connection is made to the process which published the component via AudioOutputUnitPublish.

      When using Audio Units which are instances of these components, one must take care to
      initialize the unit only immediately before beginning a series of render operations, and
      uninitialize it immediately afterwards, since while initialized, the Audio Unit's background
      process is being kept awake and is consuming system resources.
      
      When using AudioUnitGetProperty and AudioUnitSetProperty, only Apple-defined properties
      are supported.

      For kAudioUnitProperty_HostCallbacks, hosts can set this property on any remote audio unit.
      This will cause the host callbacks to be called on each render cycle and the results 
      communicated to the remote AU's process. The owner of the published AU ("node") can *get*
      this property on its output units, obtaining the structure of function pointers, and call
      the host callbacks during the render cycle.
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitType_RemoteEffect, UInt32); //          = 'aurx',
    JS_ASSIGN_ENUM(kAudioUnitType_RemoteGenerator, UInt32); //       = 'aurg',
    JS_ASSIGN_ENUM(kAudioUnitType_RemoteInstrument, UInt32); //      = 'auri',
    JS_ASSIGN_ENUM(kAudioUnitType_RemoteMusicEffect, UInt32); //     = 'aurm'
  //};

  /*!
      @enum           Apple audio unit manufacturer ID.
      @discussion    the unique ID used to identifier audio units provided by Apple, Inc.
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitManufacturer_Apple, UInt32); //       = 'appl'
  //};
    
  /*!
    @enum      Apple input/output audio unit sub types
    @discussion    These are the subtypes for the various input/output units that Apple ships. Input/output
            units add an additional notion of Start and Stop.
            see <AudioToolbox/AudioOutputUnit.h>

    @constant    kAudioUnitSubType_GenericOutput
            A generic output unit provides the start/stop API, and provides the basic 
            services to convert Linear PCM formats.

    @constant    kAudioUnitSubType_VoiceProcessingIO
              - Available on OS X and with iOS 3.0 or greater
            This audio unit can do input as well as output. Bus 0 is used for the output 
            side, bus 1 is used to get audio input (thus, on the iPhone, it works in a 
            very similar way to the Remote I/O). This audio unit does signal processing on 
            the incoming audio (taking out any of the audio that is played from the device 
            at a given time from the incoming audio).
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_GenericOutput, UInt32); //       = 'genr',
    JS_ASSIGN_ENUM(kAudioUnitSubType_VoiceProcessingIO, UInt32); //     = 'vpio'
  //};

#if !TARGET_OS_IPHONE
  /*!
    @enum      Apple input/output audio unit sub types (OS X)
    @constant    kAudioUnitSubType_HALOutput      
              - desktop only (a.k.a. "AUHAL")
            The audio unit that interfaces to any audio device. The user specifies which 
            audio device to track. The audio unit can do input from the device as well as 
            output to the device. Bus 0 is used for the output side, bus 1 is used
            to get audio input from the device.
            
    @constant    kAudioUnitSubType_DefaultOutput    
              - desktop only
            A specialisation of AUHAL that is used to track the user's selection of the 
            default device as set in the Sound Prefs
            
    @constant    kAudioUnitSubType_SystemOutput    
              - desktop only
            A specialisation of AUHAL that is used to track the user's selection of the 
            device to use for sound effects, alerts
            and other UI sounds.

  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_HALOutput, UInt32); //         = 'ahal',
    JS_ASSIGN_ENUM(kAudioUnitSubType_DefaultOutput, UInt32); //       = 'def ',
    JS_ASSIGN_ENUM(kAudioUnitSubType_SystemOutput, UInt32); //       = 'sys ',
  //};
#else
  /*!
    @enum      Apple input/output audio unit sub types (iOS)
    @constant    kAudioUnitSubType_RemoteIO      
            The audio unit that interfaces to the iOS audio system. The
            audio unit can do input as well as output. Bus 0 is used for the output side, 
            bus 1 is used to get audio input.
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_RemoteIO, UInt32); //         = 'rioc',
  //};
#endif

  /*!
    @enum      Apple music instrument audio unit sub types 

    @constant    kAudioUnitSubType_DLSSynth      
              - desktop only
            A multi-timbral music device that can use sample banks in either DLS or 
            SoundFont formats. It fully supports GM-MIDI and the basic extensions of 
            GS-MIDI.
    @constant    kAudioUnitSubType_Sampler
            A mono-timbral music device which is a sampler synthesizer and supports full 
            interactive editing of all state.
    @constant    kAudioUnitSubType_MIDISynth
            A fully GM-compatible multi-timbral music device which is a sampler synthesizer.
            It can load instruments from sample banks in either DLS or SoundFont formats.
  */
  //CF_ENUM(UInt32) {
#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(kAudioUnitSubType_DLSSynth, UInt32); //         = 'dls ',
#endif
    JS_ASSIGN_ENUM(kAudioUnitSubType_Sampler, UInt32); //         = 'samp',
    JS_ASSIGN_ENUM(kAudioUnitSubType_MIDISynth, UInt32); //         = 'msyn'
  //};

  /*!
    @enum      Apple converter audio unit sub types 
    @discussion    These are the subtypes for the various converter units that apple ships. 
            Except for AUConverter, which is available on both desktop and iPhone, these 
            audio units are only available on the desktop.

    @constant    kAudioUnitSubType_AUConverter
            An audio unit that uses an AudioConverter to do Linear PCM conversions (sample 
            rate, bit depth, interleaving).

    @constant    kAudioUnitSubType_Varispeed
            An audio unit that can be used to control playback rate (as the rate is faster, 
            the pitch is higher). It provides a generic view, so can be used in both a UI 
            and programmatic context. It also comes in an Offline version so can be used 
            to process audio files.
            
    @constant    kAudioUnitSubType_DeferredRenderer
            An audio unit that is used to get its input from a separate thread than the 
            thread that its render method is called. It thus allows an application to 
            introduce multiple threads into a rendering graph. There is a buffer sized 
            delay introduced between the input and output
            
    @constant    kAudioUnitSubType_Splitter
                      An audio unit that provides 2 output buses and 1 input bus. The audio unit
                      splits (duplicates) the input signal to the two output buses
   
    @constant    kAudioUnitSubType_MultiSplitter
                      An audio unit that sends its input bus to any number of output buses.
                      Every output bus gets all channels of the input bus.
                      This unit's implementation is lighter weight than kAudioUnitSubType_Splitter 
                      even for two output buses, and is recommended over kAudioUnitSubType_Splitter.
   
    @constant    kAudioUnitSubType_Merger
            An audio unit that provides 2 input buses and 2 output bus. The audio unit
            merges the two inputs to the single output

    @constant    kAudioUnitSubType_NewTimePitch
            An audio unit that provides good quality time stretching and pitch shifting 
            while still being very fast.

    @constant    kAudioUnitSubType_AUiPodTimeOther
            An audio unit that provides time domain time stretching.

  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_AUConverter, UInt32); //       = 'conv',
    JS_ASSIGN_ENUM(kAudioUnitSubType_Varispeed, UInt32); //         = 'vari',
    JS_ASSIGN_ENUM(kAudioUnitSubType_DeferredRenderer, UInt32); //     = 'defr',
    JS_ASSIGN_ENUM(kAudioUnitSubType_Splitter, UInt32); //         = 'splt',
    JS_ASSIGN_ENUM(kAudioUnitSubType_MultiSplitter, UInt32); //       = 'mspl',
    JS_ASSIGN_ENUM(kAudioUnitSubType_Merger, UInt32); //         = 'merg',
    JS_ASSIGN_ENUM(kAudioUnitSubType_NewTimePitch, UInt32); //       = 'nutp',
    JS_ASSIGN_ENUM(kAudioUnitSubType_AUiPodTimeOther, UInt32); //     = 'ipto',
    JS_ASSIGN_ENUM(kAudioUnitSubType_RoundTripAAC, UInt32); //       = 'raac',
  //};

#if !TARGET_OS_IPHONE
  /*!
    @enum      Apple converter audio unit sub types (OS X only)
    @constant    kAudioUnitSubType_TimePitch
            An audio unit that can be used to have independent control of both playback
            rate and pitch. It provides a generic view, so can be used in both a UI and 
            programmatic context. It also comes in an Offline version so can be used to 
            process audio files.
            
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_TimePitch, UInt32); //         = 'tmpt'
  //};
#elif !TARGET_OS_UIKITFORMAC
  /*!
    @enum      Apple converter audio unit sub types (iOS only)
    @constant    kAudioUnitSubType_AUiPodTime
            An audio unit that provides simple (and limited) control over playback rate
            and time.
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_AUiPodTime, UInt32); //  API_DEPRECATED_WITH_REPLACEMENT("kAudioUnitSubType_NewTimePitch", ios(2.0, 13.0), watchos(2.0, 6.0), tvos(9.0, 13.0)) API_UNAVAILABLE(macos)  = 'iptm'
  //};
#endif

  /*!
    @enum      Apple effect audio unit sub types 
    @discussion    These are the subtypes for the various effect units that apple ships

    @constant    kAudioUnitSubType_Delay          
              - desktop only
            A delay audio unit
            
    @constant    kAudioUnitSubType_LowPassFilter      
            A filter that passes frequencies below a specified cut-off frequency
            
    @constant    kAudioUnitSubType_HighPassFilter    
            A filter that passes frequencies above a specified cut-off frequency
            
    @constant    kAudioUnitSubType_BandPassFilter    
            A filter that passes frequencies between a low and high cut-off frequency.
            
    @constant    kAudioUnitSubType_HighShelfFilter    
            A filter that can be used to implement a "treble" control
            
    @constant    kAudioUnitSubType_LowShelfFilter    
            A filter that can be used to implement a "bass" control

    @constant    kAudioUnitSubType_ParametricEQ      
            A parametric EQ filter
            
    @constant    kAudioUnitSubType_PeakLimiter
            A peak limiter
            
    @constant    kAudioUnitSubType_DynamicsProcessor    
            A dynamics compressor/expander
            
    @constant    kAudioUnitSubType_SampleDelay
              - desktop only
            A delay that is used to delay the input a specified number of samples until 
            the output
            
    @constant    kAudioUnitSubType_Distortion
            A distortion audio unit 
            
    @constant    kAudioUnitSubType_NBandEQ
            A generalized N-band graphic EQ with specifiable filter types per-band

      @constant       kAudioUnitSubType_Reverb2
                      A lite reverb that can be used to simulate various and different spaces

  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_PeakLimiter, UInt32); //       = 'lmtr',
    JS_ASSIGN_ENUM(kAudioUnitSubType_DynamicsProcessor, UInt32); //     = 'dcmp',
    JS_ASSIGN_ENUM(kAudioUnitSubType_LowPassFilter, UInt32); //       = 'lpas',
    JS_ASSIGN_ENUM(kAudioUnitSubType_HighPassFilter, UInt32); //     = 'hpas',
    JS_ASSIGN_ENUM(kAudioUnitSubType_BandPassFilter, UInt32); //     = 'bpas',
    JS_ASSIGN_ENUM(kAudioUnitSubType_HighShelfFilter, UInt32); //     = 'hshf',
    JS_ASSIGN_ENUM(kAudioUnitSubType_LowShelfFilter, UInt32); //     = 'lshf',
    JS_ASSIGN_ENUM(kAudioUnitSubType_ParametricEQ, UInt32); //       = 'pmeq',
    JS_ASSIGN_ENUM(kAudioUnitSubType_Distortion, UInt32); //       = 'dist',
    JS_ASSIGN_ENUM(kAudioUnitSubType_Delay, UInt32); //           = 'dely',
    JS_ASSIGN_ENUM(kAudioUnitSubType_SampleDelay, UInt32); //       = 'sdly',
    JS_ASSIGN_ENUM(kAudioUnitSubType_NBandEQ, UInt32); //         = 'nbeq',
#if !TARGET_OS_UIKITFORMAC
      JS_ASSIGN_ENUM(kAudioUnitSubType_Reverb2, UInt32); //                = 'rvb2'
#endif
  //};

#if !TARGET_OS_IPHONE
  /*!
    @enum      Apple effect audio unit sub types (OS X only)
    @constant    kAudioUnitSubType_GraphicEQ        
            A 10 or 31 band Graphic EQ
    @constant    kAudioUnitSubType_MultiBandCompressor  
            A 4 band compressor/expander
    @constant    kAudioUnitSubType_MatrixReverb
            A reverb that can be used to simulate various and different spaces
    @constant    kAudioUnitSubType_Pitch          
            An audio unit used to change the pitch
    @constant    kAudioUnitSubType_AUFilter
            A filter unit that combines 5 different filters (low, 3 mids, high)
    @constant    kAudioUnitSubType_NetSend
            An audio unit that is used in conjunction with _NetReceive to send audio
            across the network (or between different applications)
    @constant    kAudioUnitSubType_RogerBeep        
            An audio unit that can be used to emit a short tone in gaps between speech
            - similar to the tones used in a walkie-talkie
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_GraphicEQ, UInt32); //         = 'greq',
    JS_ASSIGN_ENUM(kAudioUnitSubType_MultiBandCompressor, UInt32); //   = 'mcmp',
    JS_ASSIGN_ENUM(kAudioUnitSubType_MatrixReverb, UInt32); //       = 'mrev',
    JS_ASSIGN_ENUM(kAudioUnitSubType_Pitch, UInt32); //           = 'tmpt',
    JS_ASSIGN_ENUM(kAudioUnitSubType_AUFilter, UInt32); //         = 'filt',
    JS_ASSIGN_ENUM(kAudioUnitSubType_NetSend, UInt32); //         = 'nsnd',
    JS_ASSIGN_ENUM(kAudioUnitSubType_RogerBeep, UInt32); //         = 'rogr'
  //};
#elif !TARGET_OS_UIKITFORMAC
  /*!
    @enum      Apple effect audio unit sub types (iOS only)
    @constant    kAudioUnitSubType_AUiPodEQ
            A simple graphic EQ with common presets
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_AUiPodEQ, UInt32); //  API_DEPRECATED_WITH_REPLACEMENT("kAudioUnitSubType_GraphicEQ", ios(2.0, 13.0), watchos(2.0, 6.0), tvos(9.0, 13.0)) API_UNAVAILABLE(macos)  = 'ipeq'
  //};
#endif



  /*!
    @enum      Apple mixer audio unit sub types 
    @discussion    These are the subtypes for the various mixer units that apple ships

    @constant    kAudioUnitSubType_MultiChannelMixer
            Can have any number of inputs, with any number of channels on any input to one 
            output bus with any number of channels.
   
      @constant       kAudioUnitSubType_SpatialMixer
                      Inputs that are mono will be panned around using 3D coordinates and parameters.
                      Stereo inputs are passed directly through to the output.
                      A single output is presented with 2, 4, 5, 6, 7 or 8 channels.
                      There is also a built in reverb.
    
    @constant    kAudioUnitSubType_MatrixMixer
            Any number of input and output buses with any number of channels on any bus. 
            The mix is presented as a matrix of channels that can be controlled through 
            input volume per channel, "cross-point" volume (a given input channel to a 
            given output channel), output volume per channel and a global volume across 
            the whole matrix
   

  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_MultiChannelMixer, UInt32); //     = 'mcmx',
    JS_ASSIGN_ENUM(kAudioUnitSubType_MatrixMixer, UInt32); //       = 'mxmx',
      JS_ASSIGN_ENUM(kAudioUnitSubType_SpatialMixer, UInt32); //           = '3dem',
  //};

#if !TARGET_OS_IPHONE
  /*!
    @enum      Apple mixer audio unit sub types (OS X only)
    @constant    kAudioUnitSubType_StereoMixer
            Inputs can be mono or stereo. Single stereo output
            
      @constant    kAudioUnitSubType_3DMixer
                      (deprecated, use kAudioUnitSubType_SpatialMixer instead)
                      Inputs can be mono, in which case they can be panned around using 3D
                      coordinates and parameters.
                      Stereo inputs are passed directly through to the output.
                      4 channel "ambisonic" inputs will be rendered to the output configuration
                      A single output of 2, 4, 5, 6, 7 or 8 channels.
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_StereoMixer, UInt32); //       = 'smxr',
    JS_ASSIGN_ENUM(kAudioUnitSubType_3DMixer, UInt32); //  API_DEPRECATED("no longer supported", macos(10.3, 10.10)) API_UNAVAILABLE(ios, watchos, tvos)
  //                      = '3dmx',
  //                      // use kAudioUnitSubType_SpatialMixer instead
  //};
#else
  /*!
    @enum      Apple mixer audio unit sub types (iOS only)
    @constant    kAudioUnitSubType_AU3DMixerEmbedded
              - iPhone only (renamed to kAudioUnitSubType_SpatialMixer)
            A scaled-down version of the AU3DMixer that presents a stereo output, mono or 
            stereo inputs
  */
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_AU3DMixerEmbedded, UInt32); //   __attribute__((deprecated("renamed to kAudioUnitSubType_SpatialMixer")))
  //                      = '3dem' 
  //};
#endif

  /*!
    @enum      Apple panner audio unit sub types 
    @discussion    These are the subtypes for the various panner units that apple ships

    @constant    kAudioUnitSubType_SphericalHeadPanner
              - desktop only
            A panner unit that uses the spherical head model to pan to a stereo output
            
    @constant    kAudioUnitSubType_VectorPanner
              - desktop only
            A panner unit that uses a moving pan between the two closes, adjacent channels 
            in a 3D space to a
            surround output
            
    @constant    kAudioUnitSubType_SoundFieldPanner
              - desktop only
            A panner unit that uses a sound-field notion to pan to a surround output
            
    @constant    kAudioUnitSubType_HRTFPanner
              - desktop only
            A panner unit that uses a generic "HRTF" model to pan to a stereo output
  */
#if !TARGET_OS_IPHONE
  //CF_ENUM(UInt32) {
    JS_ASSIGN_ENUM(kAudioUnitSubType_SphericalHeadPanner, UInt32); //   = 'sphr',
    JS_ASSIGN_ENUM(kAudioUnitSubType_VectorPanner, UInt32); //       = 'vbas',
    JS_ASSIGN_ENUM(kAudioUnitSubType_SoundFieldPanner, UInt32); //     = 'ambi',
    JS_ASSIGN_ENUM(kAudioUnitSubType_HRTFPanner, UInt32); //       = 'hrtf'
  //};
#endif

  /*!
    @enum      Apple generator audio unit sub types 
    @discussion    These are the subtypes for the various generator units that apple ships

    @constant    kAudioUnitSubType_ScheduledSoundPlayer
            A generator unit that can be used to schedule slices of audio to be played at 
            a specified time. The audio is scheduled using the time stamps for the render 
            operation, and can be scheduled from any thread.
            
    @constant    kAudioUnitSubType_AudioFilePlayer
            A generator unit that is used to play a file. It presents a custom UI so can 
            be used in a UI context as well
            
    @constant    kAudioUnitSubType_NetReceive
              - desktop only
            A generator unit that is paired with _NetSend to receive the audio that unit 
            sends. It presents a custom UI so can be used in a UI context as well
  */
  //CF_ENUM(UInt32) {
#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(kAudioUnitSubType_NetReceive, UInt32); //       = 'nrcv',
#endif
    JS_ASSIGN_ENUM(kAudioUnitSubType_ScheduledSoundPlayer, UInt32); //   = 'sspl',
    JS_ASSIGN_ENUM(kAudioUnitSubType_AudioFilePlayer, UInt32); //     = 'afpl'
  //};


  //================================================================================================
#pragma mark -
#pragma mark Audio Unit Constants and typedefs
  /*!
    @enum      AudioUnitRenderActionFlags
    @discussion    These flags can be set in a callback from an audio unit during an audio unit 
            render operation from either the RenderNotify Proc or the render input 
            callback.

    @constant    kAudioUnitRenderAction_PreRender
            Called on a render notification Proc - which is called either before or after 
            the render operation of the audio unit. If this flag is set, the proc is being 
            called before the render operation is performed.
            
    @constant    kAudioUnitRenderAction_PostRender
            Called on a render notification Proc - which is called either before or after 
            the render operation of the audio unit. If this flag is set, the proc is being 
            called after the render operation is completed.

    @constant    kAudioUnitRenderAction_OutputIsSilence
            The originator of a buffer, in a render input callback, or in an audio unit's
            render operation, may use this flag to indicate that the buffer contains
            only silence.

            The receiver of the buffer can then use the flag as a hint as to whether the
            buffer needs to be processed or not.

            Note that because the flag is only a hint, when setting the silence flag,
            the originator of a buffer must also ensure that it contains silence (zeroes).
            
    @constant    kAudioOfflineUnitRenderAction_Preflight
            This is used with offline audio units (of type 'auol'). It is used when an 
            offline unit is being preflighted, which is performed prior to the actual 
            offline rendering actions are performed. It is used for those cases where the 
            offline process needs it (for example, with an offline unit that normalises an 
            audio file, it needs to see all of the audio data first before it can perform 
            its normalisation)
            
    @constant    kAudioOfflineUnitRenderAction_Render
            Once an offline unit has been successfully preflighted, it is then put into 
            its render mode. So this flag is set to indicate to the audio unit that it is 
            now in that state and that it should perform its processing on the input data.
            
    @constant    kAudioOfflineUnitRenderAction_Complete
            This flag is set when an offline unit has completed either its preflight or 
            performed render operations
            
    @constant    kAudioUnitRenderAction_PostRenderError
            If this flag is set on the post-render call an error was returned by the 
            AUs render operation. In this case, the error can be retrieved through the 
            lastRenderError property and the audio data in ioData handed to the post-render 
            notification will be invalid.
    @constant    kAudioUnitRenderAction_DoNotCheckRenderArgs
            If this flag is set, then checks that are done on the arguments provided to render 
            are not performed. This can be useful to use to save computation time in
            situations where you are sure you are providing the correct arguments
            and structures to the various render calls
  */
  typedef CF_OPTIONS(UInt32, AudioUnitRenderActionFlags)
  {
    kAudioUnitRenderAction_PreRender      = (1UL << 2),
    kAudioUnitRenderAction_PostRender      = (1UL << 3),
    kAudioUnitRenderAction_OutputIsSilence    = (1UL << 4),
    kAudioOfflineUnitRenderAction_Preflight    = (1UL << 5),
    kAudioOfflineUnitRenderAction_Render    = (1UL << 6),
    kAudioOfflineUnitRenderAction_Complete    = (1UL << 7),
    kAudioUnitRenderAction_PostRenderError    = (1UL << 8),
    kAudioUnitRenderAction_DoNotCheckRenderArgs  = (1UL << 9)
  };

  /*!
    @enum      Audio unit errors
    @discussion    These are the various errors that can be returned by AudioUnit... API calls

    @constant    kAudioUnitErr_InvalidProperty
            The property is not supported
    @constant    kAudioUnitErr_InvalidParameter
            The parameter is not supported
    @constant    kAudioUnitErr_InvalidElement
            The specified element is not valid
    @constant    kAudioUnitErr_NoConnection
            There is no connection (generally an audio unit is asked to render but it has 
            not input from which to gather data)
    @constant    kAudioUnitErr_FailedInitialization
            The audio unit is unable to be initialized
    @constant    kAudioUnitErr_TooManyFramesToProcess
            When an audio unit is initialized it has a value which specifies the max 
            number of frames it will be asked to render at any given time. If an audio 
            unit is asked to render more than this, this error is returned.
    @constant    kAudioUnitErr_InvalidFile
            If an audio unit uses external files as a data source, this error is returned 
            if a file is invalid (Apple's DLS synth returns this error)
    @constant    kAudioUnitErr_UnknownFileType
            If an audio unit uses external files as a data source, this error is returned
            if a file is invalid (Apple's DLS synth returns this error)
    @constant    kAudioUnitErr_FileNotSpecified
            If an audio unit uses external files as a data source, this error is returned
            if a file hasn't been set on it 
            (Apple's DLS synth returns this error)
    @constant    kAudioUnitErr_FormatNotSupported
            Returned if an input or output format is not supported
    @constant    kAudioUnitErr_Uninitialized
            Returned if an operation requires an audio unit to be initialized and it is 
            not.
    @constant    kAudioUnitErr_InvalidScope
            The specified scope is invalid
    @constant    kAudioUnitErr_PropertyNotWritable
            The property cannot be written
    @constant    kAudioUnitErr_CannotDoInCurrentContext
            Returned when an audio unit is in a state where it can't perform the requested 
            action now - but it could later. Its usually used to guard a render operation 
            when a reconfiguration of its internal state is being performed.
    @constant    kAudioUnitErr_InvalidPropertyValue
            The property is valid, but the value of the property being provided is not
    @constant    kAudioUnitErr_PropertyNotInUse
            Returned when a property is valid, but it hasn't been set to a valid value at 
            this time.  
    @constant    kAudioUnitErr_Initialized
            Indicates the operation cannot be performed because the audio unit is 
            initialized.
    @constant    kAudioUnitErr_InvalidOfflineRender
            Used to indicate that the offline render operation is invalid. For instance,
            when the audio unit needs to be pre-flighted, 
            but it hasn't been.
    @constant    kAudioUnitErr_Unauthorized
            Returned by either Open or Initialize, this error is used to indicate that the 
            audio unit is not authorised, that it cannot be used. A host can then present 
            a UI to notify the user the audio unit is not able to be used in its current 
            state.
    @constant    kAudioUnitErr_MIDIOutputBufferFull
            Returned during the render call, if the audio unit produces more MIDI output,
            than the default allocated buffer. The audio unit can provide a size hint, in
            case it needs a larger buffer. See the documentation for AUAudioUnit's
            MIDIOutputBufferSizeHint property.
    @constant    kAudioComponentErr_InstanceInvalidated
            The component instance's implementation is not available, most likely because the process
            that published it is no longer running.
    @constant    kAudioUnitErr_RenderTimeout
            The audio unit did not satisfy the render request in time.
    @constant     kAudioUnitErr_ExtensionNotFound
            The specified identifier did not match any Audio Unit Extensions.
    @constant    kAudioUnitErr_InvalidParameterValue
            The parameter value is not supported, e.g. the value specified is NaN or
            infinite.
    @constant     kAudioUnitErr_InvalidFilePath
            The file path that was passed is not supported. It is either too long or contains
            invalid characters.
    @constant    kAudioUnitErr_MissingKey
            A required key is missing from a dictionary object.
  */
  //CF_ENUM(OSStatus) {
    JS_ASSIGN_ENUM(kAudioUnitErr_InvalidProperty, OSStatus); //       = -10879,
    JS_ASSIGN_ENUM(kAudioUnitErr_InvalidParameter, OSStatus); //       = -10878,
    JS_ASSIGN_ENUM(kAudioUnitErr_InvalidElement, OSStatus); //       = -10877,
    JS_ASSIGN_ENUM(kAudioUnitErr_NoConnection, OSStatus); //         = -10876,
    JS_ASSIGN_ENUM(kAudioUnitErr_FailedInitialization, OSStatus); //     = -10875,
    JS_ASSIGN_ENUM(kAudioUnitErr_TooManyFramesToProcess, OSStatus); //   = -10874,
    JS_ASSIGN_ENUM(kAudioUnitErr_InvalidFile, OSStatus); //         = -10871,
    JS_ASSIGN_ENUM(kAudioUnitErr_UnknownFileType, OSStatus); //       = -10870,
    JS_ASSIGN_ENUM(kAudioUnitErr_FileNotSpecified, OSStatus); //       = -10869,
    JS_ASSIGN_ENUM(kAudioUnitErr_FormatNotSupported, OSStatus); //     = -10868,
    JS_ASSIGN_ENUM(kAudioUnitErr_Uninitialized, OSStatus); //         = -10867,
    JS_ASSIGN_ENUM(kAudioUnitErr_InvalidScope, OSStatus); //         = -10866,
    JS_ASSIGN_ENUM(kAudioUnitErr_PropertyNotWritable, OSStatus); //     = -10865,
    JS_ASSIGN_ENUM(kAudioUnitErr_CannotDoInCurrentContext, OSStatus); //   = -10863,
    JS_ASSIGN_ENUM(kAudioUnitErr_InvalidPropertyValue, OSStatus); //     = -10851,
    JS_ASSIGN_ENUM(kAudioUnitErr_PropertyNotInUse, OSStatus); //       = -10850,
    JS_ASSIGN_ENUM(kAudioUnitErr_Initialized, OSStatus); //         = -10849,
    JS_ASSIGN_ENUM(kAudioUnitErr_InvalidOfflineRender, OSStatus); //     = -10848,
    JS_ASSIGN_ENUM(kAudioUnitErr_Unauthorized, OSStatus); //         = -10847,
    JS_ASSIGN_ENUM(kAudioUnitErr_MIDIOutputBufferFull, OSStatus); //     = -66753,
    JS_ASSIGN_ENUM(kAudioComponentErr_InstanceTimedOut, OSStatus); //     = -66754,
    JS_ASSIGN_ENUM(kAudioComponentErr_InstanceInvalidated, OSStatus); //   = -66749,
    JS_ASSIGN_ENUM(kAudioUnitErr_RenderTimeout, OSStatus); //         = -66745,
    JS_ASSIGN_ENUM(kAudioUnitErr_ExtensionNotFound, OSStatus); //       = -66744,
    JS_ASSIGN_ENUM(kAudioUnitErr_InvalidParameterValue, OSStatus); //     = -66743,
    JS_ASSIGN_ENUM(kAudioUnitErr_InvalidFilePath, OSStatus); //       = -66742,
    JS_ASSIGN_ENUM(kAudioUnitErr_MissingKey, OSStatus); //         = -66741
  //};


#if AU_SUPPORT_INTERAPP_AUDIO
  /*!
      @enum       AudioComponent errors for inter-app audio
      
      @constant   kAudioComponentErr_DuplicateDescription
          a non-unique component description was provided to AudioOutputUnitPublish
      @constant   kAudioComponentErr_UnsupportedType
          an unsupported component type was provided to AudioOutputUnitPublish
      @constant   kAudioComponentErr_TooManyInstances
          components published via AudioOutputUnitPublish may only have one instance
      @constant   kAudioComponentErr_NotPermitted
      app needs "inter-app-audio" entitlement or host app needs "audio" in its UIBackgroundModes.
      Or app is trying to register a component not declared in its Info.plist.
      @constant   kAudioComponentErr_InitializationTimedOut
          host did not render in a timely manner; must uninitialize and reinitialize.
    @constant  kAudioComponentErr_InvalidFormat
      inter-app AU element formats must have sample rates matching the hardware.
  */
  //CF_ENUM(OSStatus) {
      JS_ASSIGN_ENUM(kAudioComponentErr_DuplicateDescription, OSStatus); //      = -66752,
      JS_ASSIGN_ENUM(kAudioComponentErr_UnsupportedType, OSStatus); //           = -66751,
      JS_ASSIGN_ENUM(kAudioComponentErr_TooManyInstances, OSStatus); //          = -66750,
      JS_ASSIGN_ENUM(kAudioComponentErr_NotPermitted, OSStatus); //              = -66748,
    JS_ASSIGN_ENUM(kAudioComponentErr_InitializationTimedOut, OSStatus); //   = -66747,
    JS_ASSIGN_ENUM(kAudioComponentErr_InvalidFormat, OSStatus); //       = -66746
  //};

  /*!
    @enum      AUParameterEventType
    @discussion    The type of a parameter event (see AudioUnitScheduleParameter)

    @constant    kParameterEvent_Immediate
            The parameter event describes an immediate change to the parameter value to 
            the new value
    @constant    kParameterEvent_Ramped
            The parameter event describes a change to the parameter value that should
            be applied over the specified period of time
  */
  //typedef CF_ENUM(UInt32, AUParameterEventType) {
    JS_ASSIGN_ENUM(kParameterEvent_Immediate, AUParameterEventType); //   = 1,
    JS_ASSIGN_ENUM(kParameterEvent_Ramped, AUParameterEventType); //     = 2
  //};



#endif

#endif


JS_INIT_GLOBALS_END(AUComponent);
