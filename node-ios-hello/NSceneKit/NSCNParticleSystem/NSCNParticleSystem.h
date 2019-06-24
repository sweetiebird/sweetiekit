//
//  NSCNParticleSystem.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNParticleSystem_h
#define NSCNParticleSystem_h    

#include "NNSObject.h"

#define js_value_SCNParticleSystem(x) js_value_wrapper(x, SCNParticleSystem)
#define to_value_SCNParticleSystem(x) to_value_wrapper(x, SCNParticleSystem)
#define is_value_SCNParticleSystem(x) is_value_wrapper(x, SCNParticleSystem)

#define js_value_SCNParticleProperty(x) JS_ENUM(SCNParticleProperty, NSString, x)
#define to_value_SCNParticleProperty(x) TO_ENUM(SCNParticleProperty, NSString, x)
#define is_value_SCNParticleProperty(x) IS_ENUM(SCNParticleProperty, NSString, x)

#define js_value_SCNParticleSortingMode(x) JS_ENUM(SCNParticleSortingMode, NSInteger, x)
#define to_value_SCNParticleSortingMode(x) TO_ENUM(SCNParticleSortingMode, NSInteger, x)
#define is_value_SCNParticleSortingMode(x) IS_ENUM(SCNParticleSortingMode, NSInteger, x)

#define js_value_SCNParticleBlendMode(x) JS_ENUM(SCNParticleBlendMode, NSInteger, x)
#define to_value_SCNParticleBlendMode(x) TO_ENUM(SCNParticleBlendMode, NSInteger, x)
#define is_value_SCNParticleBlendMode(x) IS_ENUM(SCNParticleBlendMode, NSInteger, x)

#define js_value_SCNParticleOrientationMode(x) JS_ENUM(SCNParticleOrientationMode, NSInteger, x)
#define to_value_SCNParticleOrientationMode(x) TO_ENUM(SCNParticleOrientationMode, NSInteger, x)
#define is_value_SCNParticleOrientationMode(x) IS_ENUM(SCNParticleOrientationMode, NSInteger, x)

#define js_value_SCNParticleBirthLocation(x) JS_ENUM(SCNParticleBirthLocation, NSInteger, x)
#define to_value_SCNParticleBirthLocation(x) TO_ENUM(SCNParticleBirthLocation, NSInteger, x)
#define is_value_SCNParticleBirthLocation(x) IS_ENUM(SCNParticleBirthLocation, NSInteger, x)

#define js_value_SCNParticleBirthDirection(x) JS_ENUM(SCNParticleBirthDirection, NSInteger, x)
#define to_value_SCNParticleBirthDirection(x) TO_ENUM(SCNParticleBirthDirection, NSInteger, x)
#define is_value_SCNParticleBirthDirection(x) IS_ENUM(SCNParticleBirthDirection, NSInteger, x)

#define js_value_SCNParticleImageSequenceAnimationMode(x) JS_ENUM(SCNParticleImageSequenceAnimationMode, NSInteger, x)
#define to_value_SCNParticleImageSequenceAnimationMode(x) TO_ENUM(SCNParticleImageSequenceAnimationMode, NSInteger, x)
#define is_value_SCNParticleImageSequenceAnimationMode(x) IS_ENUM(SCNParticleImageSequenceAnimationMode, NSInteger, x)

#define js_value_SCNParticleInputMode(x) JS_ENUM(SCNParticleInputMode, NSInteger, x)
#define to_value_SCNParticleInputMode(x) TO_ENUM(SCNParticleInputMode, NSInteger, x)
#define is_value_SCNParticleInputMode(x) IS_ENUM(SCNParticleInputMode, NSInteger, x)

#define js_value_SCNParticleModifierStage(x) JS_ENUM(SCNParticleModifierStage, NSInteger, x)
#define to_value_SCNParticleModifierStage(x) TO_ENUM(SCNParticleModifierStage, NSInteger, x)
#define is_value_SCNParticleModifierStage(x) IS_ENUM(SCNParticleModifierStage, NSInteger, x)

#define js_value_SCNParticleEvent(x) JS_ENUM(SCNParticleEvent, NSInteger, x)
#define to_value_SCNParticleEvent(x) TO_ENUM(SCNParticleEvent, NSInteger, x)
#define is_value_SCNParticleEvent(x) IS_ENUM(SCNParticleEvent, NSInteger, x)

JS_WRAP_CLASS(SCNParticleSystem, NSObject);
  JS_STATIC_METHOD(particleSystem);
  JS_STATIC_METHOD(particleSystemNamedInDirectory);
  JS_METHOD(reset);
  JS_METHOD(handleEventForPropertiesWithBlock);
  JS_METHOD(addModifierForPropertiesAtStageWithBlock);
  JS_METHOD(removeModifiersOfStage);
  JS_METHOD(removeAllModifiers);
  JS_PROP(emissionDuration);
  JS_PROP(emissionDurationVariation);
  JS_PROP(idleDuration);
  JS_PROP(idleDurationVariation);
  JS_PROP(loops);
  JS_PROP(birthRate);
  JS_PROP(birthRateVariation);
  JS_PROP(warmupDuration);
  JS_PROP(emitterShape);
  JS_PROP(birthLocation);
  JS_PROP(birthDirection);
  JS_PROP(spreadingAngle);
  JS_PROP(emittingDirection);
  JS_PROP(orientationDirection);
  JS_PROP(acceleration);
  JS_PROP(isLocal);
  JS_PROP(particleAngle);
  JS_PROP(particleAngleVariation);
  JS_PROP(particleVelocity);
  JS_PROP(particleVelocityVariation);
  JS_PROP(particleAngularVelocity);
  JS_PROP(particleAngularVelocityVariation);
  JS_PROP(particleLifeSpan);
  JS_PROP(particleLifeSpanVariation);
  JS_PROP(systemSpawnedOnDying);
  JS_PROP(systemSpawnedOnCollision);
  JS_PROP(systemSpawnedOnLiving);
  JS_PROP(particleImage);
  JS_PROP(imageSequenceColumnCount);
  JS_PROP(imageSequenceRowCount);
  JS_PROP(imageSequenceInitialFrame);
  JS_PROP(imageSequenceInitialFrameVariation);
  JS_PROP(imageSequenceFrameRate);
  JS_PROP(imageSequenceFrameRateVariation);
  JS_PROP(imageSequenceAnimationMode);
  JS_PROP(particleColor);
  JS_PROP(particleColorVariation);
  JS_PROP(particleSize);
  JS_PROP(particleSizeVariation);
  JS_PROP(particleIntensity);
  JS_PROP(particleIntensityVariation);
  JS_PROP(blendMode);
  JS_PROP(isBlackPassEnabled);
  JS_PROP(orientationMode);
  JS_PROP(sortingMode);
  JS_PROP(isLightingEnabled);
  JS_PROP(affectedByGravity);
  JS_PROP(affectedByPhysicsFields);
  JS_PROP(particleDiesOnCollision);
  JS_PROP(colliderNodes);
  JS_PROP(particleMass);
  JS_PROP(particleMassVariation);
  JS_PROP(particleBounce);
  JS_PROP(particleBounceVariation);
  JS_PROP(particleFriction);
  JS_PROP(particleFrictionVariation);
  JS_PROP(particleCharge);
  JS_PROP(particleChargeVariation);
  JS_PROP(dampingFactor);
  JS_PROP(speedFactor);
  JS_PROP(stretchFactor);
  JS_PROP(fresnelExponent);
  JS_PROP(propertyControllers);
JS_WRAP_CLASS_END(SCNParticleSystem);

JS_EXTEND_CLASS(SCNNode, SCNParticleSystemSupport);
  JS_METHOD(addParticleSystem);
  JS_METHOD(removeAllParticleSystems);
  JS_METHOD(removeParticleSystem);
  JS_PROP_READONLY(particleSystems);
JS_EXTEND_CLASS_END(SCNNode, SCNParticleSystemSupport);

JS_EXTEND_CLASS(SCNScene, SCNParticleSystemSupport);
  JS_METHOD(addParticleSystemWithTransform);
  JS_METHOD(removeAllParticleSystems);
  JS_METHOD(removeParticleSystem);
  JS_PROP_READONLY(particleSystems);
JS_EXTEND_CLASS_END(SCNScene, SCNParticleSystemSupport);

#endif /* NSCNParticleSystem_h */
