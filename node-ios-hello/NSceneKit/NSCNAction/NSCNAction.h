//
//  NSCNAction.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNAction_h
#define NSCNAction_h    

#include "NNSObject.h"

#define js_value_SCNAction(x) js_value_wrapper(x, SCNAction)
#define to_value_SCNAction(x) to_value_wrapper(x, SCNAction)
#define is_value_SCNAction(x) is_value_wrapper(x, SCNAction)

JS_WRAP_CLASS(SCNAction, NSObject);
// SCNAction
  JS_STATIC_METHOD(moveByXYZDuration);
  JS_STATIC_METHOD(moveByDuration);
  JS_STATIC_METHOD(moveToDuration);
  JS_STATIC_METHOD(rotateByXYZDuration);
  JS_STATIC_METHOD(rotateToXYZDuration);
  JS_STATIC_METHOD(rotateToXYZDurationShortestUnitArc);
  JS_STATIC_METHOD(rotateByAngleAroundAxisDuration);
  JS_STATIC_METHOD(rotateToAxisAngleDuration);
  JS_STATIC_METHOD(scaleByDuration);
  JS_STATIC_METHOD(scaleToDuration);
  JS_STATIC_METHOD(sequence);
  JS_STATIC_METHOD(group);
  JS_STATIC_METHOD(repeatActionCount);
  JS_STATIC_METHOD(repeatActionForever);
  JS_STATIC_METHOD(fadeInWithDuration);
  JS_STATIC_METHOD(fadeOutWithDuration);
  JS_STATIC_METHOD(fadeOpacityByDuration);
  JS_STATIC_METHOD(fadeOpacityToDuration);
  JS_STATIC_METHOD(hide);
  JS_STATIC_METHOD(unhide);
  JS_STATIC_METHOD(waitForDuration);
  JS_STATIC_METHOD(waitForDurationWithRange);
  JS_STATIC_METHOD(removeFromParentNode);
  JS_STATIC_METHOD(runBlock);
  JS_STATIC_METHOD(runBlockQueue);
  JS_STATIC_METHOD(javaScriptActionWithScriptDuration);
  JS_STATIC_METHOD(customActionWithDurationActionBlock);
  JS_STATIC_METHOD(playAudioSourceWaitForCompletion);
#if TODO
// SCNActionable
  JS_METHOD(runAction);
  JS_METHOD(runActionCompletionHandler);
  JS_METHOD(runActionForKey);
  JS_METHOD(runActionForKeyCompletionHandler);
  JS_METHOD(actionForKey);
  JS_METHOD(removeActionForKey);
  JS_METHOD(removeAllActions);
#endif
// SCNAction
  JS_METHOD(reversedAction);
#if TODO
// SCNActionable
  JS_PROP_READONLY(hasActions);
  JS_PROP_READONLY(actionKeys);
#endif
// SCNAction
  JS_PROP(duration);
  JS_PROP(timingMode);
  JS_PROP(timingFunction);
  JS_PROP(speed);
JS_WRAP_CLASS_END(SCNAction);

#endif /* NSCNAction_h */
