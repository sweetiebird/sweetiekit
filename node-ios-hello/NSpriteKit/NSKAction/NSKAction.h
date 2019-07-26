//
//  NSKAction.h
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKAction_h
#define NSKAction_h    

#include "NNSObject.h"

#define js_value_SKAction(x) js_value_wrapper(x, SKAction)
#define to_value_SKAction(x) to_value_wrapper(x, SKAction)
#define is_value_SKAction(x) is_value_wrapper(x, SKAction)

JS_WRAP_CLASS(SKAction, NSObject);
  JS_STATIC_METHOD(moveByDuration);
  JS_STATIC_METHOD(moveByXYDuration);
  JS_STATIC_METHOD(moveToDuration);
  JS_STATIC_METHOD(moveToXDuration);
  JS_STATIC_METHOD(moveToYDuration);
  JS_STATIC_METHOD(rotateByAngleDuration);
  JS_STATIC_METHOD(rotateToAngleDuration);
  JS_STATIC_METHOD(rotateToAngleDurationShortestUnitArc);
  JS_STATIC_METHOD(resizeByWidthHeightDuration);
  JS_STATIC_METHOD(resizeToWidthHeightDuration);
  JS_STATIC_METHOD(resizeToWidthDuration);
  JS_STATIC_METHOD(resizeToHeightDuration);
  JS_STATIC_METHOD(scaleByDuration);
  JS_STATIC_METHOD(scaleXByYDuration);
  JS_STATIC_METHOD(scaleToDuration);
  JS_STATIC_METHOD(scaleXToYDuration);
  JS_STATIC_METHOD(scaleXToDuration);
  JS_STATIC_METHOD(scaleYToDuration);
  JS_STATIC_METHOD(scaleToSizeDuration);
  JS_STATIC_METHOD(sequence);
  JS_STATIC_METHOD(group);
  JS_STATIC_METHOD(repeatActionCount);
  JS_STATIC_METHOD(repeatActionForever);
  JS_STATIC_METHOD(fadeInWithDuration);
  JS_STATIC_METHOD(fadeOutWithDuration);
  JS_STATIC_METHOD(fadeAlphaByDuration);
  JS_STATIC_METHOD(fadeAlphaToDuration);
  JS_STATIC_METHOD(hide);
  JS_STATIC_METHOD(unhide);
  JS_STATIC_METHOD(setTexture);
  JS_STATIC_METHOD(setNormalTexture);
  JS_STATIC_METHOD(setTextureResize);
  JS_STATIC_METHOD(setNormalTextureResize);
  JS_STATIC_METHOD(animateWithTexturesTimePerFrame);
  JS_STATIC_METHOD(animateWithNormalTexturesTimePerFrame);
  JS_STATIC_METHOD(animateWithTexturesTimePerFrameResizeRestore);
  JS_STATIC_METHOD(animateWithNormalTexturesTimePerFrameResizeRestore);
  JS_STATIC_METHOD(playSoundFileNamedWaitForCompletion);
  JS_STATIC_METHOD(colorizeWithColorColorBlendFactorDuration);
  JS_STATIC_METHOD(colorizeWithColorBlendFactorDuration);
  JS_STATIC_METHOD(falloffToDuration);
  JS_STATIC_METHOD(falloffByDuration);
  JS_STATIC_METHOD(followPathDuration);
  JS_STATIC_METHOD(followPathAsOffsetOrientToPathDuration);
  JS_STATIC_METHOD(followPathSpeed);
  JS_STATIC_METHOD(followPathAsOffsetOrientToPathSpeed);
  JS_STATIC_METHOD(speedByDuration);
  JS_STATIC_METHOD(speedToDuration);
  JS_STATIC_METHOD(reachToRootNodeDuration);
  JS_STATIC_METHOD(reachToRootNodeVelocity);
  JS_STATIC_METHOD(reachToNodeRootNodeDuration);
  JS_STATIC_METHOD(reachToNodeRootNodeVelocity);
  JS_STATIC_METHOD(strengthToDuration);
  JS_STATIC_METHOD(strengthByDuration);
  JS_STATIC_METHOD(waitForDuration);
  JS_STATIC_METHOD(waitForDurationWithRange);
  JS_STATIC_METHOD(removeFromParent);
  JS_STATIC_METHOD(performSelectorOnTarget);
  JS_STATIC_METHOD(runBlock);
  JS_STATIC_METHOD(runBlockQueue);
  JS_STATIC_METHOD(runActionOnChildWithName);
  JS_STATIC_METHOD(customActionWithDurationActionBlock);
  JS_STATIC_METHOD(actionNamed);
  JS_STATIC_METHOD(actionNamedDuration);
  JS_STATIC_METHOD(actionNamedFromURL);
  JS_STATIC_METHOD(actionNamedFromURLDuration);
  JS_STATIC_METHOD(changeChargeToDuration);
  JS_STATIC_METHOD(changeChargeByDuration);
  JS_STATIC_METHOD(changeMassToDuration);
  JS_STATIC_METHOD(changeMassByDuration);
  JS_STATIC_METHOD(applyForceDuration);
  JS_STATIC_METHOD(applyForceAtPointDuration);
  JS_STATIC_METHOD(applyTorqueDuration);
  JS_STATIC_METHOD(applyImpulseDuration);
  JS_STATIC_METHOD(applyImpulseAtPointDuration);
  JS_STATIC_METHOD(applyAngularImpulseDuration);
  JS_STATIC_METHOD(play);
  JS_STATIC_METHOD(pause);
  JS_STATIC_METHOD(stop);
  JS_STATIC_METHOD(changePlaybackRateToDuration);
  JS_STATIC_METHOD(changePlaybackRateByDuration);
  JS_STATIC_METHOD(changeVolumeToDuration);
  JS_STATIC_METHOD(changeVolumeByDuration);
  JS_METHOD(reversedAction);
  JS_PROP(duration);
  JS_PROP(timingMode);
  JS_PROP(timingFunction);
  JS_PROP(speed);
JS_WRAP_CLASS_END(SKAction);

#endif /* NSKAction_h */
