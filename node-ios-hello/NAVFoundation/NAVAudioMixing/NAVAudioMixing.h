//
//  NAVAudioMixing.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioMixing_h
#define NAVAudioMixing_h    

#include "NAVAudioStereoMixing.h"
#include "NAVAudio3DMixing.h"

#define js_value_AVAudioMixing(x) js_protocol_wrapper(x, AVAudioMixing)
#define to_value_AVAudioMixing(x) to_protocol_wrapper(x, AVAudioMixing)
#define is_value_AVAudioMixing(x) is_protocol_wrapper(x, AVAudioMixing)

#define js_value_AVAudio3DMixingRenderingAlgorithm(x) JS_ENUM(AVAudio3DMixingRenderingAlgorithm, NSInteger, x)
#define to_value_AVAudio3DMixingRenderingAlgorithm(x) TO_ENUM(AVAudio3DMixingRenderingAlgorithm, NSInteger, x)
#define is_value_AVAudio3DMixingRenderingAlgorithm(x) IS_ENUM(AVAudio3DMixingRenderingAlgorithm, NSInteger, x)

JS_WRAP_PROTOCOL(AVAudioMixing, AVAudioStereoMixing/*, AVAudio3DMixing*/);
  JS_PROP(destinationForMixerBus);
  JS_PROP(volume);
JS_WRAP_PROTOCOL_END(AVAudioMixing, AVAudioStereoMixing/*, AVAudio3DMixing*/);

#if __OBJC__
@interface AVAudioMixingType : NSObject<AVAudioMixing>

// <AVAudioMixing>

/*! @method destinationForMixer:bus:
  @abstract Returns the AVAudioMixingDestination object corresponding to specified mixer node and
    its input bus
  @discussion
    When a source node is connected to multiple mixers downstream, setting AVAudioMixing 
    properties directly on the source node will apply the change to all the mixers downstream. 
    If you want to set/get properties on a specific mixer, use this method to get the 
    corresponding AVAudioMixingDestination and set/get properties on it. 
 
    Note:
    - Properties set on individual AVAudioMixingDestination instances will not reflect at the
      source node level.

    - AVAudioMixingDestination reference returned by this method could become invalid when
      there is any disconnection between the source and the mixer node. Hence this reference
      should not be retained and should be fetched every time you want to set/get properties 
      on a specific mixer.
 
    If the source node is not connected to the specified mixer/input bus, this method
    returns nil.
    Calling this on an AVAudioMixingDestination instance returns self if the specified
    mixer/input bus match its connection point, otherwise returns nil.
*/
- (nullable AVAudioMixingDestination *)destinationForMixer:(AVAudioNode *)mixer bus:(AVAudioNodeBus)bus API_AVAILABLE(macos(10.11), ios(9.0), watchos(2.0), tvos(9.0));

/*! @property volume
    @abstract Set a bus's input volume
    @discussion
        Range:      0.0 -> 1.0
        Default:    1.0
        Mixers:     AVAudioMixerNode, AVAudioEnvironmentNode
*/
@property (nonatomic) float volume;

// <AVAudioStereoMixing>

/*! @property pan
    @abstract Set a bus's stereo pan
    @discussion
        Range:      -1.0 -> 1.0
        Default:    0.0
        Mixer:      AVAudioMixerNode
*/
@property (nonatomic) float pan;

// <AVAudio3DMixing>

/*! @property renderingAlgorithm
    @abstract Type of rendering algorithm used
    @discussion
        Depending on the current output format of the AVAudioEnvironmentNode, only a subset of the 
        rendering algorithms may be supported. An array of valid rendering algorithms can be 
        retrieved by calling applicableRenderingAlgorithms on AVAudioEnvironmentNode.
 
        Default:    AVAudio3DMixingRenderingAlgorithmEqualPowerPanning
        Mixer:      AVAudioEnvironmentNode
*/
@property (nonatomic) AVAudio3DMixingRenderingAlgorithm renderingAlgorithm API_UNAVAILABLE(watchos);

/*! @property rate
    @abstract Changes the playback rate of the input signal
    @discussion
        A value of 2.0 results in the output audio playing one octave higher.
        A value of 0.5, results in the output audio playing one octave lower.
     
        Range:      0.5 -> 2.0
        Default:    1.0
        Mixer:      AVAudioEnvironmentNode
*/
@property (nonatomic) float rate API_UNAVAILABLE(watchos);

/*! @property reverbBlend
    @abstract Controls the blend of dry and reverb processed audio
    @discussion
        This property controls the amount of the source's audio that will be processed by the reverb 
        in AVAudioEnvironmentNode. A value of 0.5 will result in an equal blend of dry and processed 
        (wet) audio.
 
        Range:      0.0 (completely dry) -> 1.0 (completely wet)
        Default:    0.0
        Mixer:      AVAudioEnvironmentNode
*/
@property (nonatomic) float reverbBlend API_UNAVAILABLE(watchos);

/*! @property obstruction
    @abstract Simulates filtering of the direct path of sound due to an obstacle
    @discussion
        Only the direct path of sound between the source and listener is blocked.
 
        Range:      -100.0 -> 0.0 dB
        Default:    0.0
        Mixer:      AVAudioEnvironmentNode
*/
@property (nonatomic) float obstruction API_UNAVAILABLE(watchos);

/*! @property occlusion
    @abstract Simulates filtering of the direct and reverb paths of sound due to an obstacle
    @discussion
        Both the direct and reverb paths of sound between the source and listener are blocked.
 
        Range:      -100.0 -> 0.0 dB
        Default:    0.0
        Mixer:      AVAudioEnvironmentNode
*/
@property (nonatomic) float occlusion API_UNAVAILABLE(watchos);

/*! @property position
    @abstract The location of the source in the 3D environment
    @discussion
        The coordinates are specified in meters.
 
        Mixer:      AVAudioEnvironmentNode
*/
@property (nonatomic) AVAudio3DPoint position API_UNAVAILABLE(watchos);

@end
#endif

#endif /* NAVAudioMixing_h */
