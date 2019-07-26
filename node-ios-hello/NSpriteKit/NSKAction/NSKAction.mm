//
//  SKAction.mm
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKAction.h"

#define instancetype SKAction
#define js_value_instancetype js_value_SKAction

NSKAction::NSKAction() {}
NSKAction::~NSKAction() {}

JS_INIT_CLASS(SKAction, NSObject);
  JS_ASSIGN_STATIC_METHOD(moveByDuration);
  JS_ASSIGN_STATIC_METHOD(moveByXYDuration);
  JS_ASSIGN_STATIC_METHOD(moveToDuration);
  JS_ASSIGN_STATIC_METHOD(moveToXDuration);
  JS_ASSIGN_STATIC_METHOD(moveToYDuration);
  JS_ASSIGN_STATIC_METHOD(rotateByAngleDuration);
  JS_ASSIGN_STATIC_METHOD(rotateToAngleDuration);
  JS_ASSIGN_STATIC_METHOD(rotateToAngleDurationShortestUnitArc);
  JS_ASSIGN_STATIC_METHOD(resizeByWidthHeightDuration);
  JS_ASSIGN_STATIC_METHOD(resizeToWidthHeightDuration);
  JS_ASSIGN_STATIC_METHOD(resizeToWidthDuration);
  JS_ASSIGN_STATIC_METHOD(resizeToHeightDuration);
  JS_ASSIGN_STATIC_METHOD(scaleByDuration);
  JS_ASSIGN_STATIC_METHOD(scaleXByYDuration);
  JS_ASSIGN_STATIC_METHOD(scaleToDuration);
  JS_ASSIGN_STATIC_METHOD(scaleXToYDuration);
  JS_ASSIGN_STATIC_METHOD(scaleXToDuration);
  JS_ASSIGN_STATIC_METHOD(scaleYToDuration);
  JS_ASSIGN_STATIC_METHOD(scaleToSizeDuration);
  JS_ASSIGN_STATIC_METHOD(sequence);
  JS_ASSIGN_STATIC_METHOD(group);
  JS_ASSIGN_STATIC_METHOD(repeatActionCount);
  JS_ASSIGN_STATIC_METHOD(repeatActionForever);
  JS_ASSIGN_STATIC_METHOD(fadeInWithDuration);
  JS_ASSIGN_STATIC_METHOD(fadeOutWithDuration);
  JS_ASSIGN_STATIC_METHOD(fadeAlphaByDuration);
  JS_ASSIGN_STATIC_METHOD(fadeAlphaToDuration);
  JS_ASSIGN_STATIC_METHOD(hide);
  JS_ASSIGN_STATIC_METHOD(unhide);
  JS_ASSIGN_STATIC_METHOD(setTexture);
  JS_ASSIGN_STATIC_METHOD(setNormalTexture);
  JS_ASSIGN_STATIC_METHOD(setTextureResize);
  JS_ASSIGN_STATIC_METHOD(setNormalTextureResize);
  JS_ASSIGN_STATIC_METHOD(animateWithTexturesTimePerFrame);
  JS_ASSIGN_STATIC_METHOD(animateWithNormalTexturesTimePerFrame);
  JS_ASSIGN_STATIC_METHOD(animateWithTexturesTimePerFrameResizeRestore);
  JS_ASSIGN_STATIC_METHOD(animateWithNormalTexturesTimePerFrameResizeRestore);
  JS_ASSIGN_STATIC_METHOD(playSoundFileNamedWaitForCompletion);
  JS_ASSIGN_STATIC_METHOD(colorizeWithColorColorBlendFactorDuration);
  JS_ASSIGN_STATIC_METHOD(colorizeWithColorBlendFactorDuration);
  JS_ASSIGN_STATIC_METHOD(falloffToDuration);
  JS_ASSIGN_STATIC_METHOD(falloffByDuration);
  JS_ASSIGN_STATIC_METHOD(followPathDuration);
  JS_ASSIGN_STATIC_METHOD(followPathAsOffsetOrientToPathDuration);
  JS_ASSIGN_STATIC_METHOD(followPathSpeed);
  JS_ASSIGN_STATIC_METHOD(followPathAsOffsetOrientToPathSpeed);
  JS_ASSIGN_STATIC_METHOD(speedByDuration);
  JS_ASSIGN_STATIC_METHOD(speedToDuration);
  JS_ASSIGN_STATIC_METHOD(reachToRootNodeDuration);
  JS_ASSIGN_STATIC_METHOD(reachToRootNodeVelocity);
  JS_ASSIGN_STATIC_METHOD(reachToNodeRootNodeDuration);
  JS_ASSIGN_STATIC_METHOD(reachToNodeRootNodeVelocity);
  JS_ASSIGN_STATIC_METHOD(strengthToDuration);
  JS_ASSIGN_STATIC_METHOD(strengthByDuration);
  JS_ASSIGN_STATIC_METHOD(waitForDuration);
  JS_ASSIGN_STATIC_METHOD(waitForDurationWithRange);
  JS_ASSIGN_STATIC_METHOD(removeFromParent);
  JS_ASSIGN_STATIC_METHOD(performSelectorOnTarget);
  JS_ASSIGN_STATIC_METHOD(runBlock);
  JS_ASSIGN_STATIC_METHOD(runBlockQueue);
  JS_ASSIGN_STATIC_METHOD(runActionOnChildWithName);
  JS_ASSIGN_STATIC_METHOD(customActionWithDurationActionBlock);
  JS_ASSIGN_STATIC_METHOD(actionNamed);
  JS_ASSIGN_STATIC_METHOD(actionNamedDuration);
  JS_ASSIGN_STATIC_METHOD(actionNamedFromURL);
  JS_ASSIGN_STATIC_METHOD(actionNamedFromURLDuration);
  JS_ASSIGN_STATIC_METHOD(changeChargeToDuration);
  JS_ASSIGN_STATIC_METHOD(changeChargeByDuration);
  JS_ASSIGN_STATIC_METHOD(changeMassToDuration);
  JS_ASSIGN_STATIC_METHOD(changeMassByDuration);
  JS_ASSIGN_STATIC_METHOD(applyForceDuration);
  JS_ASSIGN_STATIC_METHOD(applyForceAtPointDuration);
  JS_ASSIGN_STATIC_METHOD(applyTorqueDuration);
  JS_ASSIGN_STATIC_METHOD(applyImpulseDuration);
  JS_ASSIGN_STATIC_METHOD(applyImpulseAtPointDuration);
  JS_ASSIGN_STATIC_METHOD(applyAngularImpulseDuration);
  JS_ASSIGN_STATIC_METHOD(play);
  JS_ASSIGN_STATIC_METHOD(pause);
  JS_ASSIGN_STATIC_METHOD(stop);
  JS_ASSIGN_STATIC_METHOD(changePlaybackRateToDuration);
  JS_ASSIGN_STATIC_METHOD(changePlaybackRateByDuration);
  JS_ASSIGN_STATIC_METHOD(changeVolumeToDuration);
  JS_ASSIGN_STATIC_METHOD(changeVolumeByDuration);
  JS_ASSIGN_PROTO_METHOD(reversedAction);
  JS_ASSIGN_PROTO_PROP(duration);
  JS_ASSIGN_PROTO_PROP(timingMode);
  #if TODO
  JS_ASSIGN_PROTO_PROP(timingFunction);
  #endif
  JS_ASSIGN_PROTO_PROP(speed);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKAction, NSObject);
  // constants (exports)

  /** Adjust the timing of an action
   
   @enum SKActionTimingLinear Specifies linear pacing. Linear pacing causes an
   animation to occur evenly over its duration.
   @enum SKActionTimingEaseIn Specifies ease-in pacing. Ease-in pacing causes the
   animation to begin slowly, and then speed up as it progresses.
   @enum SKActionTimingEaseOut Specifies ease-out pacing. Ease-out pacing causes
   the animation to begin quickly, and then slow as it completes.
   @enum SKActionTimingEaseInEaseOut Specifies ease-in ease-out pacing. An
   ease-in ease-out animation begins slowly, accelerates through the middle
   of its duration, and then slows again before completing.
   */
  //typedef NS_ENUM(NSInteger, SKActionTimingMode) {
    JS_ASSIGN_ENUM(SKActionTimingLinear, NSInteger);
    JS_ASSIGN_ENUM(SKActionTimingEaseIn, NSInteger);
    JS_ASSIGN_ENUM(SKActionTimingEaseOut, NSInteger);
    JS_ASSIGN_ENUM(SKActionTimingEaseInEaseOut, NSInteger);
  //} NS_ENUM_AVAILABLE(10_9, 7_0);

JS_INIT_CLASS_END(SKAction, NSObject);

NAN_METHOD(NSKAction::New) {
  JS_RECONSTRUCT(SKAction);

  Local<Object> obj = info.This();

  NSKAction *ui = new NSKAction();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKAction *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKAction alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NSKAction::moveByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGVector, delta);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction moveBy: delta duration: duration]));
  }
}

NAN_METHOD(NSKAction::moveByXYDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, deltaX);
    declare_value(CGFloat, deltaY);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction moveByX: deltaX y: deltaY duration: duration]));
  }
}

NAN_METHOD(NSKAction::moveToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, location);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction moveTo: location duration: duration]));
  }
}

NAN_METHOD(NSKAction::moveToXDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, x);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction moveToX: x duration: duration]));
  }
}

NAN_METHOD(NSKAction::moveToYDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, y);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction moveToY: y duration: duration]));
  }
}

NAN_METHOD(NSKAction::rotateByAngleDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, radians);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction rotateByAngle: radians duration: duration]));
  }
}

NAN_METHOD(NSKAction::rotateToAngleDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, radians);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction rotateToAngle: radians duration: duration]));
  }
}

NAN_METHOD(NSKAction::rotateToAngleDurationShortestUnitArc) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, radians);
    declare_value(NSTimeInterval, duration);
    declare_value(BOOL, shortestUnitArc);
    JS_SET_RETURN(js_value_SKAction([SKAction rotateToAngle: radians duration: duration shortestUnitArc: shortestUnitArc]));
  }
}

NAN_METHOD(NSKAction::resizeByWidthHeightDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, width);
    declare_value(CGFloat, height);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction resizeByWidth: width height: height duration: duration]));
  }
}

NAN_METHOD(NSKAction::resizeToWidthHeightDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, width);
    declare_value(CGFloat, height);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction resizeToWidth: width height: height duration: duration]));
  }
}

NAN_METHOD(NSKAction::resizeToWidthDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, width);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction resizeToWidth: width duration: duration]));
  }
}

NAN_METHOD(NSKAction::resizeToHeightDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, height);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction resizeToHeight: height duration: duration]));
  }
}

NAN_METHOD(NSKAction::scaleByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, scale);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction scaleBy: scale duration: duration]));
  }
}

NAN_METHOD(NSKAction::scaleXByYDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, xScale);
    declare_value(CGFloat, yScale);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction scaleXBy: xScale y: yScale duration: duration]));
  }
}

NAN_METHOD(NSKAction::scaleToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, scale);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction scaleTo: scale duration: duration]));
  }
}

NAN_METHOD(NSKAction::scaleXToYDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, xScale);
    declare_value(CGFloat, yScale);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction scaleXTo: xScale y: yScale duration: duration]));
  }
}

NAN_METHOD(NSKAction::scaleXToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, scale);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction scaleXTo: scale duration: duration]));
  }
}

NAN_METHOD(NSKAction::scaleYToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, scale);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction scaleYTo: scale duration: duration]));
  }
}

NAN_METHOD(NSKAction::scaleToSizeDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGSize, size);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction scaleToSize: size duration: duration]));
  }
}

NAN_METHOD(NSKAction::sequence) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SKAction*>, actions);
    JS_SET_RETURN(js_value_SKAction([SKAction sequence: actions]));
  }
}

NAN_METHOD(NSKAction::group) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SKAction*>, actions);
    JS_SET_RETURN(js_value_SKAction([SKAction group: actions]));
  }
}

NAN_METHOD(NSKAction::repeatActionCount) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKAction, action);
    declare_value(NSUInteger, count);
    JS_SET_RETURN(js_value_SKAction([SKAction repeatAction: action count: count]));
  }
}

NAN_METHOD(NSKAction::repeatActionForever) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKAction, action);
    JS_SET_RETURN(js_value_SKAction([SKAction repeatActionForever: action]));
  }
}

NAN_METHOD(NSKAction::fadeInWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction fadeInWithDuration: duration]));
  }
}

NAN_METHOD(NSKAction::fadeOutWithDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction fadeOutWithDuration: duration]));
  }
}

NAN_METHOD(NSKAction::fadeAlphaByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, factor);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction fadeAlphaBy: factor duration: duration]));
  }
}

NAN_METHOD(NSKAction::fadeAlphaToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, alpha);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction fadeAlphaTo: alpha duration: duration]));
  }
}

NAN_METHOD(NSKAction::hide) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKAction([SKAction hide]));
  }
}

NAN_METHOD(NSKAction::unhide) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKAction([SKAction unhide]));
  }
}

#include "NSKTexture.h"

NAN_METHOD(NSKAction::setTexture) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKTexture, texture);
    JS_SET_RETURN(js_value_SKAction([SKAction setTexture: texture]));
  }
}

NAN_METHOD(NSKAction::setNormalTexture) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKTexture, texture);
    JS_SET_RETURN(js_value_SKAction([SKAction setNormalTexture: texture]));
  }
}

NAN_METHOD(NSKAction::setTextureResize) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKTexture, texture);
    declare_value(BOOL, resize);
    JS_SET_RETURN(js_value_SKAction([SKAction setTexture: texture resize: resize]));
  }
}

NAN_METHOD(NSKAction::setNormalTextureResize) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKTexture, texture);
    declare_value(BOOL, resize);
    JS_SET_RETURN(js_value_SKAction([SKAction setNormalTexture: texture resize: resize]));
  }
}

NAN_METHOD(NSKAction::animateWithTexturesTimePerFrame) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SKTexture*>, textures);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKAction([SKAction animateWithTextures: textures timePerFrame: sec]));
  }
}

NAN_METHOD(NSKAction::animateWithNormalTexturesTimePerFrame) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SKTexture*>, textures);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKAction([SKAction animateWithNormalTextures: textures timePerFrame: sec]));
  }
}

NAN_METHOD(NSKAction::animateWithTexturesTimePerFrameResizeRestore) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SKTexture*>, textures);
    declare_value(NSTimeInterval, sec);
    declare_value(BOOL, resize);
    declare_value(BOOL, restore);
    JS_SET_RETURN(js_value_SKAction([SKAction animateWithTextures: textures timePerFrame: sec resize: resize restore: restore]));
  }
}

NAN_METHOD(NSKAction::animateWithNormalTexturesTimePerFrameResizeRestore) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SKTexture*>, textures);
    declare_value(NSTimeInterval, sec);
    declare_value(BOOL, resize);
    declare_value(BOOL, restore);
    JS_SET_RETURN(js_value_SKAction([SKAction animateWithNormalTextures: textures timePerFrame: sec resize: resize restore: restore]));
  }
}

NAN_METHOD(NSKAction::playSoundFileNamedWaitForCompletion) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, soundFile);
    declare_value(BOOL, wait);
    JS_SET_RETURN(js_value_SKAction([SKAction playSoundFileNamed: soundFile waitForCompletion: wait]));
  }
}

NAN_METHOD(NSKAction::colorizeWithColorColorBlendFactorDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKColor, color);
    declare_value(CGFloat, colorBlendFactor);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction colorizeWithColor: color colorBlendFactor: colorBlendFactor duration: duration]));
  }
}

NAN_METHOD(NSKAction::colorizeWithColorBlendFactorDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, colorBlendFactor);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKAction([SKAction colorizeWithColorBlendFactor: colorBlendFactor duration: sec]));
  }
}

NAN_METHOD(NSKAction::falloffToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, falloff);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction falloffTo: falloff duration: duration]));
  }
}

NAN_METHOD(NSKAction::falloffByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, falloff);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction falloffBy: falloff duration: duration]));
  }
}

NAN_METHOD(NSKAction::followPathDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPathRef, path);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction followPath: path duration: duration]));
  }
}

NAN_METHOD(NSKAction::followPathAsOffsetOrientToPathDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPathRef, path);
    declare_value(BOOL, offset);
    declare_value(BOOL, orient);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction followPath: path asOffset: offset orientToPath: orient duration: duration]));
  }
}

NAN_METHOD(NSKAction::followPathSpeed) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPathRef, path);
    declare_value(CGFloat, speed);
    JS_SET_RETURN(js_value_SKAction([SKAction followPath: path speed: speed]));
  }
}

NAN_METHOD(NSKAction::followPathAsOffsetOrientToPathSpeed) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPathRef, path);
    declare_value(BOOL, offset);
    declare_value(BOOL, orient);
    declare_value(CGFloat, speed);
    JS_SET_RETURN(js_value_SKAction([SKAction followPath: path asOffset: offset orientToPath: orient speed: speed]));
  }
}

NAN_METHOD(NSKAction::speedByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, speed);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction speedBy: speed duration: duration]));
  }
}

NAN_METHOD(NSKAction::speedToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, speed);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction speedTo: speed duration: duration]));
  }
}

#include "NSKNode.h"

NAN_METHOD(NSKAction::reachToRootNodeDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, position);
    declare_pointer(SKNode, root);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction reachTo: position rootNode: root duration: duration]));
  }
}

NAN_METHOD(NSKAction::reachToRootNodeVelocity) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, position);
    declare_pointer(SKNode, root);
    declare_value(CGFloat, velocity);
    JS_SET_RETURN(js_value_SKAction([SKAction reachTo: position rootNode: root velocity: velocity]));
  }
}

NAN_METHOD(NSKAction::reachToNodeRootNodeDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    declare_pointer(SKNode, root);
    declare_value(NSTimeInterval, sec);
    JS_SET_RETURN(js_value_SKAction([SKAction reachToNode: node rootNode: root duration: sec]));
  }
}

NAN_METHOD(NSKAction::reachToNodeRootNodeVelocity) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKNode, node);
    declare_pointer(SKNode, root);
    declare_value(CGFloat, velocity);
    JS_SET_RETURN(js_value_SKAction([SKAction reachToNode: node rootNode: root velocity: velocity]));
  }
}

NAN_METHOD(NSKAction::strengthToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, strength);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction strengthTo: strength duration: duration]));
  }
}

NAN_METHOD(NSKAction::strengthByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, strength);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction strengthBy: strength duration: duration]));
  }
}

NAN_METHOD(NSKAction::waitForDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction waitForDuration: duration]));
  }
}

NAN_METHOD(NSKAction::waitForDurationWithRange) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_value(NSTimeInterval, durationRange);
    JS_SET_RETURN(js_value_SKAction([SKAction waitForDuration: duration withRange: durationRange]));
  }
}

NAN_METHOD(NSKAction::removeFromParent) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKAction([SKAction removeFromParent]));
  }
}

NAN_METHOD(NSKAction::performSelectorOnTarget) {
  declare_autoreleasepool {
    declare_args();
    declare_value(SEL, selector);
    declare_value(id, target);
    JS_SET_RETURN(js_value_SKAction([SKAction performSelector: selector onTarget: target]));
  }
}

//#include "NDispatchBlock.h" // TODO
#include "NDispatchQueue.h"

NAN_METHOD(NSKAction::runBlock) {
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(dispatch_block_t, block);
    JS_SET_RETURN(js_value_SKAction([SKAction runBlock: block]));
    #endif
  }
}

NAN_METHOD(NSKAction::runBlockQueue) {
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(dispatch_block_t, block);
    declare_value(dispatch_queue_t, queue);
    JS_SET_RETURN(js_value_SKAction([SKAction runBlock: block queue: queue]));
    #endif
  }
}

NAN_METHOD(NSKAction::runActionOnChildWithName) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKAction, action);
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_SKAction([SKAction runAction: action onChildWithName: name]));
  }
}

NAN_METHOD(NSKAction::customActionWithDurationActionBlock) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_callback(block);
    JS_SET_RETURN(js_value_SKAction([SKAction customActionWithDuration: duration actionBlock:^(SKNode *node, CGFloat elapsedTime){
      dispatch_main(^{
        if (block && [block jsFunction]) {
          [block jsFunction]->Call("NSKAction::customActionWithDurationActionBlock",
            js_value_SKNode(node),
            js_value_CGFloat(elapsedTime));
        }
      });
    }]));
  }
}

NAN_METHOD(NSKAction::actionNamed) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_SKAction([SKAction actionNamed: name]));
  }
}

NAN_METHOD(NSKAction::actionNamedDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction actionNamed: name duration: duration]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NSKAction::actionNamedFromURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_pointer(NSURL, url);
    JS_SET_RETURN(js_value_SKAction([SKAction actionNamed: name fromURL: url]));
  }
}

NAN_METHOD(NSKAction::actionNamedFromURLDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_pointer(NSURL, url);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction actionNamed: name fromURL: url duration: duration]));
  }
}

NAN_METHOD(NSKAction::changeChargeToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, v);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction changeChargeTo: v duration: duration]));
  }
}

NAN_METHOD(NSKAction::changeChargeByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, v);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction changeChargeBy: v duration: duration]));
  }
}

NAN_METHOD(NSKAction::changeMassToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, v);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction changeMassTo: v duration: duration]));
  }
}

NAN_METHOD(NSKAction::changeMassByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, v);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction changeMassBy: v duration: duration]));
  }
}

NAN_METHOD(NSKAction::applyForceDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGVector, force);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction applyForce: force duration: duration]));
  }
}

NAN_METHOD(NSKAction::applyForceAtPointDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGVector, force);
    declare_value(CGPoint, point);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction applyForce: force atPoint: point duration: duration]));
  }
}

NAN_METHOD(NSKAction::applyTorqueDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, torque);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction applyTorque: torque duration: duration]));
  }
}

NAN_METHOD(NSKAction::applyImpulseDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGVector, impulse);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction applyImpulse: impulse duration: duration]));
  }
}

NAN_METHOD(NSKAction::applyImpulseAtPointDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGVector, impulse);
    declare_value(CGPoint, point);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction applyImpulse: impulse atPoint: point duration: duration]));
  }
}

NAN_METHOD(NSKAction::applyAngularImpulseDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, impulse);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction applyAngularImpulse: impulse duration: duration]));
  }
}

NAN_METHOD(NSKAction::play) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKAction([SKAction play]));
  }
}

NAN_METHOD(NSKAction::pause) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKAction([SKAction pause]));
  }
}

NAN_METHOD(NSKAction::stop) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKAction([SKAction stop]));
  }
}

NAN_METHOD(NSKAction::changePlaybackRateToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, v);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction changePlaybackRateTo: v duration: duration]));
  }
}

NAN_METHOD(NSKAction::changePlaybackRateByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, v);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction changePlaybackRateBy: v duration: duration]));
  }
}

NAN_METHOD(NSKAction::changeVolumeToDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, v);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction changeVolumeTo: v duration: duration]));
  }
}

NAN_METHOD(NSKAction::changeVolumeByDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, v);
    declare_value(NSTimeInterval, duration);
    JS_SET_RETURN(js_value_SKAction([SKAction changeVolumeBy: v duration: duration]));
  }
}

NAN_METHOD(NSKAction::reversedAction) {
  JS_UNWRAP(SKAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKAction([self reversedAction]));
  }
}

NAN_GETTER(NSKAction::durationGetter) {
  JS_UNWRAP(SKAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self duration]));
  }
}

NAN_SETTER(NSKAction::durationSetter) {
  JS_UNWRAP(SKAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setDuration: input];
  }
}

NAN_GETTER(NSKAction::timingModeGetter) {
  JS_UNWRAP(SKAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKActionTimingMode([self timingMode]));
  }
}

NAN_SETTER(NSKAction::timingModeSetter) {
  JS_UNWRAP(SKAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SKActionTimingMode, input);
    [self setTimingMode: input];
  }
}

#if TODO

NAN_GETTER(NSKAction::timingFunctionGetter) {
  JS_UNWRAP(SKAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKActionTimingFunction([self timingFunction]));
  }
}

NAN_SETTER(NSKAction::timingFunctionSetter) {
  JS_UNWRAP(SKAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SKActionTimingFunction, input);
    [self setTimingFunction: input];
  }
}

#endif

NAN_GETTER(NSKAction::speedGetter) {
  JS_UNWRAP(SKAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self speed]));
  }
}

NAN_SETTER(NSKAction::speedSetter) {
  JS_UNWRAP(SKAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpeed: input];
  }
}
