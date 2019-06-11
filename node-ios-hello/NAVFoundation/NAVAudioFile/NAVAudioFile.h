//
//  NAVAudioFile.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioFile_h
#define NAVAudioFile_h    

#include "NNSObject.h"

#define js_value_AVAudioFile(x) js_value_wrapper(x, AVAudioFile)
#define to_value_AVAudioFile(x) to_value_wrapper(x, AVAudioFile)
#define is_value_AVAudioFile(x) is_value_wrapper(x, AVAudioFile)

JS_WRAP_CLASS(AVAudioFile, NSObject);
  JS_STATIC_METHOD(initForReadingError);
  JS_STATIC_METHOD(initForReadingCommonFormatInterleavedError);
  JS_STATIC_METHOD(initForWritingSettingsError);
  JS_STATIC_METHOD(initForWritingSettingsCommonFormatInterleavedError);
  JS_METHOD(readIntoBufferError);
  JS_METHOD(readIntoBufferFrameCountError);
  JS_METHOD(writeFromBufferError);
  JS_PROP_READONLY(url);
  JS_PROP_READONLY(fileFormat);
  JS_PROP_READONLY(processingFormat);
  JS_PROP_READONLY(length);
  JS_PROP(framePosition);
JS_WRAP_CLASS_END(AVAudioFile);

#endif /* NAVAudioFile_h */
