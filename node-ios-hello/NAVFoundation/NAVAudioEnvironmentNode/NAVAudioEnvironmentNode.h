//
//  NAVAudioEnvironmentNode.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioEnvironmentNode_h
#define NAVAudioEnvironmentNode_h    

#include "NAVAudioMixing.h"

#define js_value_AVAudioEnvironmentNode(x) js_value_wrapper(x, AVAudioEnvironmentNode)
#define to_value_AVAudioEnvironmentNode(x) to_value_wrapper(x, AVAudioEnvironmentNode)
#define is_value_AVAudioEnvironmentNode(x) is_value_wrapper(x, AVAudioEnvironmentNode)

#define js_value_AVAudioEnvironmentDistanceAttenuationModel(x) JS_ENUM(AVAudioEnvironmentDistanceAttenuationModel, NSInteger, x)
#define to_value_AVAudioEnvironmentDistanceAttenuationModel(x) TO_ENUM(AVAudioEnvironmentDistanceAttenuationModel, NSInteger, x)
#define is_value_AVAudioEnvironmentDistanceAttenuationModel(x) IS_ENUM(AVAudioEnvironmentDistanceAttenuationModel, NSInteger, x)

JS_WRAP_CLASS(AVAudioEnvironmentNode, AVAudioMixing);
  // TODO: declare AVAudioEnvironmentNode methods and properties
JS_WRAP_CLASS_END(AVAudioEnvironmentNode);

#endif /* NAVAudioEnvironmentNode_h */
