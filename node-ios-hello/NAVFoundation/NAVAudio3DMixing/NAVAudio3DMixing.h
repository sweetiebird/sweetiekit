//
//  NAVAudio3DMixing.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudio3DMixing_h
#define NAVAudio3DMixing_h    

#include "NNSObject.h"

#define js_value_AVAudio3DMixing(x) js_protocol_wrapper(x, AVAudio3DMixing)
#define to_value_AVAudio3DMixing(x) to_protocol_wrapper(x, AVAudio3DMixing)
#define is_value_AVAudio3DMixing(x) is_protocol_wrapper(x, AVAudio3DMixing)

JS_WRAP_PROTOCOL(AVAudio3DMixing, NSObject);
  JS_PROP(renderingAlgorithm);
  JS_PROP(rate);
  JS_PROP(reverbBlend);
  JS_PROP(obstruction);
  JS_PROP(occlusion);
  JS_PROP(position);
JS_WRAP_PROTOCOL_END(AVAudio3DMixing, NSObject);

#if __OBJC__
@interface AVAudio3DMixingType : NSObject<AVAudio3DMixing>

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

#endif /* NAVAudio3DMixing_h */
