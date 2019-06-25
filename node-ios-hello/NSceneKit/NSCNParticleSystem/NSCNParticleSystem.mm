//
//  NSCNParticleSystem.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNParticleSystem.h"

#define instancetype SCNParticleSystem
#define js_value_instancetype js_value_SCNParticleSystem

NSCNParticleSystem::NSCNParticleSystem() {}
NSCNParticleSystem::~NSCNParticleSystem() {}

#include "NSCNNode.h"
#include "NSCNScene.h"

JS_INIT_CLASS(SCNParticleSystem, NSObject);
  JS_ASSIGN_STATIC_METHOD(particleSystem);
  JS_ASSIGN_STATIC_METHOD(particleSystemNamedInDirectory);
  JS_ASSIGN_PROTO_METHOD(reset);
  JS_ASSIGN_PROTO_METHOD(handleEventForPropertiesWithBlock);
  JS_ASSIGN_PROTO_METHOD(addModifierForPropertiesAtStageWithBlock);
  JS_ASSIGN_PROTO_METHOD(removeModifiersOfStage);
  JS_ASSIGN_PROTO_METHOD(removeAllModifiers);
  JS_ASSIGN_PROTO_PROP(emissionDuration);
  JS_ASSIGN_PROTO_PROP(emissionDurationVariation);
  JS_ASSIGN_PROTO_PROP(idleDuration);
  JS_ASSIGN_PROTO_PROP(idleDurationVariation);
  JS_ASSIGN_PROTO_PROP(loops);
  JS_ASSIGN_PROTO_PROP(birthRate);
  JS_ASSIGN_PROTO_PROP(birthRateVariation);
  JS_ASSIGN_PROTO_PROP(warmupDuration);
  JS_ASSIGN_PROTO_PROP(emitterShape);
  JS_ASSIGN_PROTO_PROP(birthLocation);
  JS_ASSIGN_PROTO_PROP(birthDirection);
  JS_ASSIGN_PROTO_PROP(spreadingAngle);
  JS_ASSIGN_PROTO_PROP(emittingDirection);
  JS_ASSIGN_PROTO_PROP(orientationDirection);
  JS_ASSIGN_PROTO_PROP(acceleration);
  JS_ASSIGN_PROTO_PROP(isLocal);
  JS_ASSIGN_PROTO_PROP(particleAngle);
  JS_ASSIGN_PROTO_PROP(particleAngleVariation);
  JS_ASSIGN_PROTO_PROP(particleVelocity);
  JS_ASSIGN_PROTO_PROP(particleVelocityVariation);
  JS_ASSIGN_PROTO_PROP(particleAngularVelocity);
  JS_ASSIGN_PROTO_PROP(particleAngularVelocityVariation);
  JS_ASSIGN_PROTO_PROP(particleLifeSpan);
  JS_ASSIGN_PROTO_PROP(particleLifeSpanVariation);
  JS_ASSIGN_PROTO_PROP(systemSpawnedOnDying);
  JS_ASSIGN_PROTO_PROP(systemSpawnedOnCollision);
  JS_ASSIGN_PROTO_PROP(systemSpawnedOnLiving);
  JS_ASSIGN_PROTO_PROP(particleImage);
  JS_ASSIGN_PROTO_PROP(imageSequenceColumnCount);
  JS_ASSIGN_PROTO_PROP(imageSequenceRowCount);
  JS_ASSIGN_PROTO_PROP(imageSequenceInitialFrame);
  JS_ASSIGN_PROTO_PROP(imageSequenceInitialFrameVariation);
  JS_ASSIGN_PROTO_PROP(imageSequenceFrameRate);
  JS_ASSIGN_PROTO_PROP(imageSequenceFrameRateVariation);
  JS_ASSIGN_PROTO_PROP(imageSequenceAnimationMode);
  JS_ASSIGN_PROTO_PROP(particleColor);
  JS_ASSIGN_PROTO_PROP(particleColorVariation);
  JS_ASSIGN_PROTO_PROP(particleSize);
  JS_ASSIGN_PROTO_PROP(particleSizeVariation);
  JS_ASSIGN_PROTO_PROP(particleIntensity);
  JS_ASSIGN_PROTO_PROP(particleIntensityVariation);
  JS_ASSIGN_PROTO_PROP(blendMode);
  JS_ASSIGN_PROTO_PROP(isBlackPassEnabled);
  JS_ASSIGN_PROTO_PROP(orientationMode);
  JS_ASSIGN_PROTO_PROP(sortingMode);
  JS_ASSIGN_PROTO_PROP(isLightingEnabled);
  JS_ASSIGN_PROTO_PROP(affectedByGravity);
  JS_ASSIGN_PROTO_PROP(affectedByPhysicsFields);
  JS_ASSIGN_PROTO_PROP(particleDiesOnCollision);
  JS_ASSIGN_PROTO_PROP(colliderNodes);
  JS_ASSIGN_PROTO_PROP(particleMass);
  JS_ASSIGN_PROTO_PROP(particleMassVariation);
  JS_ASSIGN_PROTO_PROP(particleBounce);
  JS_ASSIGN_PROTO_PROP(particleBounceVariation);
  JS_ASSIGN_PROTO_PROP(particleFriction);
  JS_ASSIGN_PROTO_PROP(particleFrictionVariation);
  JS_ASSIGN_PROTO_PROP(particleCharge);
  JS_ASSIGN_PROTO_PROP(particleChargeVariation);
  JS_ASSIGN_PROTO_PROP(dampingFactor);
  JS_ASSIGN_PROTO_PROP(speedFactor);
  JS_ASSIGN_PROTO_PROP(stretchFactor);
  JS_ASSIGN_PROTO_PROP(fresnelExponent);
  JS_ASSIGN_PROTO_PROP(propertyControllers);
  
  {
    JS_WITH_TYPE(SCNNode);
    JS_ASSIGN_PROTO_METHOD_AS(NSCNNode_SCNParticleSystemSupport::addParticleSystem, "addParticleSystem");
    JS_ASSIGN_PROTO_METHOD_AS(NSCNNode_SCNParticleSystemSupport::removeAllParticleSystems, "removeAllParticleSystems");
    JS_ASSIGN_PROTO_METHOD_AS(NSCNNode_SCNParticleSystemSupport::removeParticleSystem, "removeParticleSystem");
    JS_ASSIGN_PROTO_PROP_READONLY_AS(NSCNNode_SCNParticleSystemSupport::particleSystems, "particleSystems");
  }
  
  {
    JS_WITH_TYPE(SCNScene);
    JS_ASSIGN_PROTO_METHOD_AS(NSCNScene_SCNParticleSystemSupport::addParticleSystemWithTransform, "addParticleSystemWithTransform");
    JS_ASSIGN_PROTO_METHOD_AS(NSCNScene_SCNParticleSystemSupport::removeAllParticleSystems, "removeAllParticleSystems");
    JS_ASSIGN_PROTO_METHOD_AS(NSCNScene_SCNParticleSystemSupport::removeParticleSystem, "removeParticleSystem");
    JS_ASSIGN_PROTO_PROP_READONLY_AS(NSCNScene_SCNParticleSystemSupport::particleSystems, "particleSystems");
  }

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNParticleSystem, NSObject);
  // constant values (exports)

  //typedef NSString * SCNParticleProperty NS_STRING_ENUM;
  JS_ASSIGN_ENUM(SCNParticlePropertyPosition, SCNParticleProperty); // API_AVAILABLE(macos(10.10));        // float3 : {x,y,z}     controller animation type : {NSValue(SCNVector3)}
  JS_ASSIGN_ENUM(SCNParticlePropertyAngle, SCNParticleProperty); // API_AVAILABLE(macos(10.10));           // float                controller animation type : {NSNumber}
  JS_ASSIGN_ENUM(SCNParticlePropertyRotationAxis, SCNParticleProperty); // API_AVAILABLE(macos(10.10));    // float3 : {x,y,z}     controller animation type : {NSValue(SCNVector3)}
  JS_ASSIGN_ENUM(SCNParticlePropertyVelocity, SCNParticleProperty); // API_AVAILABLE(macos(10.10));        // float3 : {x,y,z}     controller animation type : {NSValue(SCNVector3)}
  JS_ASSIGN_ENUM(SCNParticlePropertyAngularVelocity, SCNParticleProperty); // API_AVAILABLE(macos(10.10)); // float                controller animation type : {NSNumber}
  JS_ASSIGN_ENUM(SCNParticlePropertyLife, SCNParticleProperty); // API_AVAILABLE(macos(10.10));            // float                not controllable
  JS_ASSIGN_ENUM(SCNParticlePropertyColor, SCNParticleProperty); // API_AVAILABLE(macos(10.10));           // float4 : {r,g,b,a}   controller animation type : {UIColor}
  JS_ASSIGN_ENUM(SCNParticlePropertyOpacity, SCNParticleProperty); // API_AVAILABLE(macos(10.10));         // float                controller animation type : {NSNumber}
  JS_ASSIGN_ENUM(SCNParticlePropertySize, SCNParticleProperty); // API_AVAILABLE(macos(10.10));            // float                controller animation type : {NSNumber}
  JS_ASSIGN_ENUM(SCNParticlePropertyFrame, SCNParticleProperty); // API_AVAILABLE(macos(10.10));           // float                controller animation type : {NSNumber}
  JS_ASSIGN_ENUM(SCNParticlePropertyFrameRate, SCNParticleProperty); // API_AVAILABLE(macos(10.10));       // float                controller animation type : {NSNumber}
  JS_ASSIGN_ENUM(SCNParticlePropertyBounce, SCNParticleProperty); // API_AVAILABLE(macos(10.10));          // float                controller animation type : {NSNumber}
  JS_ASSIGN_ENUM(SCNParticlePropertyCharge, SCNParticleProperty); // API_AVAILABLE(macos(10.10));          // float                controller animation type : {NSNumber}
  JS_ASSIGN_ENUM(SCNParticlePropertyFriction, SCNParticleProperty); // API_AVAILABLE(macos(10.10));        // float                controller animation type : {NSNumber}

  // These two properties are only available when handling the events of type SCNParticleEventCollision.
  // They are read-only values.
  JS_ASSIGN_ENUM(SCNParticlePropertyContactPoint, SCNParticleProperty); // API_AVAILABLE(macos(10.10));    // float3               not controllable
  JS_ASSIGN_ENUM(SCNParticlePropertyContactNormal, SCNParticleProperty); // API_AVAILABLE(macos(10.10));   // float3               not controllable

  // Particle Sorting Mode
  //typedef NS_ENUM(NSInteger, SCNParticleSortingMode) {
    JS_ASSIGN_ENUM(SCNParticleSortingModeNone, NSInteger); //,                        //particles are not sorted
    JS_ASSIGN_ENUM(SCNParticleSortingModeProjectedDepth, NSInteger); //,              //particles are sorted by depth (far rendered first)
    JS_ASSIGN_ENUM(SCNParticleSortingModeDistance, NSInteger); //,                    //particles are sorted by distance from the point of view
    JS_ASSIGN_ENUM(SCNParticleSortingModeOldestFirst, NSInteger); //,                 //particles are sorted by birth date - oldest first
    JS_ASSIGN_ENUM(SCNParticleSortingModeYoungestFirst, NSInteger); //                //particles are sorted by birth date - yougest first
  //} API_AVAILABLE(macos(10.10));

  // Particle Blend Mode
  //typedef NS_ENUM(NSInteger, SCNParticleBlendMode) {
    JS_ASSIGN_ENUM(SCNParticleBlendModeAdditive, NSInteger); //,
    JS_ASSIGN_ENUM(SCNParticleBlendModeSubtract, NSInteger); //,
    JS_ASSIGN_ENUM(SCNParticleBlendModeMultiply, NSInteger); //,
    JS_ASSIGN_ENUM(SCNParticleBlendModeScreen, NSInteger); //,
    JS_ASSIGN_ENUM(SCNParticleBlendModeAlpha, NSInteger); //,
    JS_ASSIGN_ENUM(SCNParticleBlendModeReplace, NSInteger); //
  //} API_AVAILABLE(macos(10.10));

  // Particle Orientation Mode
  //typedef NS_ENUM(NSInteger, SCNParticleOrientationMode) {
    JS_ASSIGN_ENUM(SCNParticleOrientationModeBillboardScreenAligned, NSInteger); //,  // particles are aligned on screen
    JS_ASSIGN_ENUM(SCNParticleOrientationModeBillboardViewAligned, NSInteger); //,    // particles are perpendicular with the vector from the point of view to the particle.
    JS_ASSIGN_ENUM(SCNParticleOrientationModeFree, NSInteger); //,                  // free on all axis.
    JS_ASSIGN_ENUM(SCNParticleOrientationModeBillboardYAligned, NSInteger); //        // fixed on Y axis.
  //} API_AVAILABLE(macos(10.10));

  // Particle Birth Location
  //typedef NS_ENUM(NSInteger, SCNParticleBirthLocation) {
    JS_ASSIGN_ENUM(SCNParticleBirthLocationSurface, NSInteger); //,                   //particles are emitted on the surface of the emitter shape.
    JS_ASSIGN_ENUM(SCNParticleBirthLocationVolume, NSInteger); //,                    //particles are emitted inside the volume of the emitter shape.
    JS_ASSIGN_ENUM(SCNParticleBirthLocationVertex, NSInteger); //                     //particles are emitted on the vertices of the emitter shape.
  //} API_AVAILABLE(macos(10.10));

  // Particle Birth Direction
  //typedef NS_ENUM(NSInteger, SCNParticleBirthDirection) {
    JS_ASSIGN_ENUM(SCNParticleBirthDirectionConstant, NSInteger); //,                 // Z Direction of the Emitter.
    JS_ASSIGN_ENUM(SCNParticleBirthDirectionSurfaceNormal, NSInteger); //,             // Use the direction induced by the shape
    JS_ASSIGN_ENUM(SCNParticleBirthDirectionRandom, NSInteger); //                    // Random direction.
  //} API_AVAILABLE(macos(10.10));

  // Texture Animation Mode
  //typedef NS_ENUM(NSInteger, SCNParticleImageSequenceAnimationMode) {
    JS_ASSIGN_ENUM(SCNParticleImageSequenceAnimationModeRepeat, NSInteger); //,             // The animation will loop.
    JS_ASSIGN_ENUM(SCNParticleImageSequenceAnimationModeClamp, NSInteger); //,              // The animation will stop at both ends.
    JS_ASSIGN_ENUM(SCNParticleImageSequenceAnimationModeAutoReverse, NSInteger); //         // The animation will reverse when reaching an end.
  //} API_AVAILABLE(macos(10.10));

  // Particle Variation Mode
  //typedef NS_ENUM(NSInteger, SCNParticleInputMode) {
    JS_ASSIGN_ENUM(SCNParticleInputModeOverLife, NSInteger); //,                  // The input time for the controller animation is the current life duration of the particle
    JS_ASSIGN_ENUM(SCNParticleInputModeOverDistance, NSInteger); //,              // The input time for the controller animation is the distance from the variation origin node.
    JS_ASSIGN_ENUM(SCNParticleInputModeOverOtherProperty, NSInteger); //,         // The input time for the controller animation is the current value of another specified property.
  //} API_AVAILABLE(macos(10.10));

  // Particle Modifier Stage
  //typedef NS_ENUM(NSInteger, SCNParticleModifierStage) {
    JS_ASSIGN_ENUM(SCNParticleModifierStagePreDynamics, NSInteger); //,
    JS_ASSIGN_ENUM(SCNParticleModifierStagePostDynamics, NSInteger); //,
    JS_ASSIGN_ENUM(SCNParticleModifierStagePreCollision, NSInteger); //,
    JS_ASSIGN_ENUM(SCNParticleModifierStagePostCollision, NSInteger); //
  //} API_AVAILABLE(macos(10.10));

  // Particle Event
  //typedef NS_ENUM(NSInteger, SCNParticleEvent) {
    JS_ASSIGN_ENUM(SCNParticleEventBirth, NSInteger); //,                             // Event triggered when a new particle spawns.
    JS_ASSIGN_ENUM(SCNParticleEventDeath, NSInteger); //,                             // Event triggered when a particle dies.
    JS_ASSIGN_ENUM(SCNParticleEventCollision, NSInteger); //                          // Event triggered when a particle collides with a collider node.
  //} API_AVAILABLE(macos(10.10));

JS_INIT_CLASS_END(SCNParticleSystem, NSObject);

NAN_METHOD(NSCNParticleSystem::New) {
  JS_RECONSTRUCT(SCNParticleSystem);
  @autoreleasepool {
    SCNParticleSystem* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNParticleSystem *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNParticleSystem alloc] init];
    }
    if (self) {
      NSCNParticleSystem *wrapper = new NSCNParticleSystem();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNParticleSystem::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSCNParticleSystem::particleSystem) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([SCNParticleSystem particleSystem]));
  }
}

NAN_METHOD(NSCNParticleSystem::particleSystemNamedInDirectory) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_pointer(NSString, directory);
    JS_SET_RETURN(js_value_instancetype([SCNParticleSystem particleSystemNamed: name inDirectory: directory]));
  }
}

NAN_METHOD(NSCNParticleSystem::reset) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    [self reset];
  }
}

NAN_METHOD(NSCNParticleSystem::handleEventForPropertiesWithBlock) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNParticleEvent, event);
    declare_pointer(NSArray<SCNParticleProperty>, properties);
    declare_callback(block);
    JS_TODO();
    #if TODO
    [self handleEvent: event forProperties: properties withBlock:^(void * _Nonnull * _Nonnull data, size_t * _Nonnull dataStride, uint32_t * _Nullable indices, NSInteger count) {
      dispatch_main(^{
      });
    }];
    #endif
  }
}

NAN_METHOD(NSCNParticleSystem::addModifierForPropertiesAtStageWithBlock) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<SCNParticleProperty>, properties);
    declare_value(SCNParticleModifierStage, stage);
    declare_callback(block);
    JS_TODO();
    #if TODO
    [self addModifierForProperties: properties atStage: stage withBlock:^(void * _Nonnull * _Nonnull data, size_t * _Nonnull dataStride, NSInteger start, NSInteger end, float deltaTime) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NSCNParticleSystem::addModifierForPropertiesAtStageWithBlock"))
        }
      });
    }];
    #endif
  }
}

NAN_METHOD(NSCNParticleSystem::removeModifiersOfStage) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SCNParticleModifierStage, stage);
    [self removeModifiersOfStage: stage];
  }
}

NAN_METHOD(NSCNParticleSystem::removeAllModifiers) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    [self removeAllModifiers];
  }
}

NAN_METHOD(NSCNNode_SCNParticleSystemSupport::addParticleSystem) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNParticleSystem, system);
    [self addParticleSystem: system];
  }
}

NAN_METHOD(NSCNNode_SCNParticleSystemSupport::removeAllParticleSystems) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    [self removeAllParticleSystems];
  }
}

NAN_METHOD(NSCNNode_SCNParticleSystemSupport::removeParticleSystem) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNParticleSystem, system);
    [self removeParticleSystem: system];
  }
}

NAN_METHOD(NSCNScene_SCNParticleSystemSupport::addParticleSystemWithTransform) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNParticleSystem, system);
    declare_value(SCNMatrix4, transform);
    [self addParticleSystem: system withTransform: transform];
  }
}

NAN_METHOD(NSCNScene_SCNParticleSystemSupport::removeAllParticleSystems) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    [self removeAllParticleSystems];
  }
}

NAN_METHOD(NSCNScene_SCNParticleSystemSupport::removeParticleSystem) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNParticleSystem, system);
    [self removeParticleSystem: system];
  }
}

NAN_GETTER(NSCNParticleSystem::emissionDurationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self emissionDuration]));
  }
}

NAN_SETTER(NSCNParticleSystem::emissionDurationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEmissionDuration: input];
  }
}

NAN_GETTER(NSCNParticleSystem::emissionDurationVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self emissionDurationVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::emissionDurationVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setEmissionDurationVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::idleDurationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self idleDuration]));
  }
}

NAN_SETTER(NSCNParticleSystem::idleDurationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setIdleDuration: input];
  }
}

NAN_GETTER(NSCNParticleSystem::idleDurationVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self idleDurationVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::idleDurationVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setIdleDurationVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::loopsGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self loops]));
  }
}

NAN_SETTER(NSCNParticleSystem::loopsSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLoops: input];
  }
}

NAN_GETTER(NSCNParticleSystem::birthRateGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self birthRate]));
  }
}

NAN_SETTER(NSCNParticleSystem::birthRateSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setBirthRate: input];
  }
}

NAN_GETTER(NSCNParticleSystem::birthRateVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self birthRateVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::birthRateVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setBirthRateVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::warmupDurationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self warmupDuration]));
  }
}

NAN_SETTER(NSCNParticleSystem::warmupDurationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setWarmupDuration: input];
  }
}

#include "NSCNGeometry.h"

NAN_GETTER(NSCNParticleSystem::emitterShapeGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNGeometry([self emitterShape]));
  }
}

NAN_SETTER(NSCNParticleSystem::emitterShapeSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNGeometry, input);
    [self setEmitterShape: input];
  }
}

NAN_GETTER(NSCNParticleSystem::birthLocationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleBirthLocation([self birthLocation]));
  }
}

NAN_SETTER(NSCNParticleSystem::birthLocationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNParticleBirthLocation, input);
    [self setBirthLocation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::birthDirectionGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleBirthDirection([self birthDirection]));
  }
}

NAN_SETTER(NSCNParticleSystem::birthDirectionSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNParticleBirthDirection, input);
    [self setBirthDirection: input];
  }
}

NAN_GETTER(NSCNParticleSystem::spreadingAngleGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self spreadingAngle]));
  }
}

NAN_SETTER(NSCNParticleSystem::spreadingAngleSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpreadingAngle: input];
  }
}

NAN_GETTER(NSCNParticleSystem::emittingDirectionGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self emittingDirection]));
  }
}

NAN_SETTER(NSCNParticleSystem::emittingDirectionSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setEmittingDirection: input];
  }
}

NAN_GETTER(NSCNParticleSystem::orientationDirectionGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self orientationDirection]));
  }
}

NAN_SETTER(NSCNParticleSystem::orientationDirectionSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setOrientationDirection: input];
  }
}

NAN_GETTER(NSCNParticleSystem::accelerationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self acceleration]));
  }
}

NAN_SETTER(NSCNParticleSystem::accelerationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAcceleration: input];
  }
}

NAN_GETTER(NSCNParticleSystem::isLocalGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLocal]));
  }
}

NAN_SETTER(NSCNParticleSystem::isLocalSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLocal: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleAngleGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleAngle]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleAngleSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleAngle: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleAngleVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleAngleVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleAngleVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleAngleVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleVelocityGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleVelocity]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleVelocitySetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleVelocity: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleVelocityVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleVelocityVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleVelocityVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleVelocityVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleAngularVelocityGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleAngularVelocity]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleAngularVelocitySetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleAngularVelocity: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleAngularVelocityVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleAngularVelocityVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleAngularVelocityVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleAngularVelocityVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleLifeSpanGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleLifeSpan]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleLifeSpanSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleLifeSpan: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleLifeSpanVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleLifeSpanVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleLifeSpanVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleLifeSpanVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::systemSpawnedOnDyingGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleSystem([self systemSpawnedOnDying]));
  }
}

NAN_SETTER(NSCNParticleSystem::systemSpawnedOnDyingSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNParticleSystem, input);
    [self setSystemSpawnedOnDying: input];
  }
}

NAN_GETTER(NSCNParticleSystem::systemSpawnedOnCollisionGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleSystem([self systemSpawnedOnCollision]));
  }
}

NAN_SETTER(NSCNParticleSystem::systemSpawnedOnCollisionSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNParticleSystem, input);
    [self setSystemSpawnedOnCollision: input];
  }
}

NAN_GETTER(NSCNParticleSystem::systemSpawnedOnLivingGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleSystem([self systemSpawnedOnLiving]));
  }
}

NAN_SETTER(NSCNParticleSystem::systemSpawnedOnLivingSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SCNParticleSystem, input);
    [self setSystemSpawnedOnLiving: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleImageGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self particleImage]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleImageSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setParticleImage: input];
  }
}

NAN_GETTER(NSCNParticleSystem::imageSequenceColumnCountGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self imageSequenceColumnCount]));
  }
}

NAN_SETTER(NSCNParticleSystem::imageSequenceColumnCountSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setImageSequenceColumnCount: input];
  }
}

NAN_GETTER(NSCNParticleSystem::imageSequenceRowCountGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self imageSequenceRowCount]));
  }
}

NAN_SETTER(NSCNParticleSystem::imageSequenceRowCountSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setImageSequenceRowCount: input];
  }
}

NAN_GETTER(NSCNParticleSystem::imageSequenceInitialFrameGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self imageSequenceInitialFrame]));
  }
}

NAN_SETTER(NSCNParticleSystem::imageSequenceInitialFrameSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setImageSequenceInitialFrame: input];
  }
}

NAN_GETTER(NSCNParticleSystem::imageSequenceInitialFrameVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self imageSequenceInitialFrameVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::imageSequenceInitialFrameVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setImageSequenceInitialFrameVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::imageSequenceFrameRateGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self imageSequenceFrameRate]));
  }
}

NAN_SETTER(NSCNParticleSystem::imageSequenceFrameRateSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setImageSequenceFrameRate: input];
  }
}

NAN_GETTER(NSCNParticleSystem::imageSequenceFrameRateVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self imageSequenceFrameRateVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::imageSequenceFrameRateVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setImageSequenceFrameRateVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::imageSequenceAnimationModeGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleImageSequenceAnimationMode([self imageSequenceAnimationMode]));
  }
}

NAN_SETTER(NSCNParticleSystem::imageSequenceAnimationModeSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNParticleImageSequenceAnimationMode, input);
    [self setImageSequenceAnimationMode: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleColorGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self particleColor]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleColorSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setParticleColor: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleColorVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector4([self particleColorVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleColorVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector4, input);
    [self setParticleColorVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleSizeGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleSize]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleSizeSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleSize: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleSizeVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleSizeVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleSizeVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleSizeVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleIntensityGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleIntensity]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleIntensitySetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleIntensity: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleIntensityVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleIntensityVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleIntensityVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleIntensityVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::blendModeGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleBlendMode([self blendMode]));
  }
}

NAN_SETTER(NSCNParticleSystem::blendModeSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNParticleBlendMode, input);
    [self setBlendMode: input];
  }
}

NAN_GETTER(NSCNParticleSystem::isBlackPassEnabledGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isBlackPassEnabled]));
  }
}

NAN_SETTER(NSCNParticleSystem::isBlackPassEnabledSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setBlackPassEnabled: input];
  }
}

NAN_GETTER(NSCNParticleSystem::orientationModeGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleOrientationMode([self orientationMode]));
  }
}

NAN_SETTER(NSCNParticleSystem::orientationModeSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNParticleOrientationMode, input);
    [self setOrientationMode: input];
  }
}

NAN_GETTER(NSCNParticleSystem::sortingModeGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNParticleSortingMode([self sortingMode]));
  }
}

NAN_SETTER(NSCNParticleSystem::sortingModeSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNParticleSortingMode, input);
    [self setSortingMode: input];
  }
}

NAN_GETTER(NSCNParticleSystem::isLightingEnabledGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLightingEnabled]));
  }
}

NAN_SETTER(NSCNParticleSystem::isLightingEnabledSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLightingEnabled: input];
  }
}

NAN_GETTER(NSCNParticleSystem::affectedByGravityGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self affectedByGravity]));
  }
}

NAN_SETTER(NSCNParticleSystem::affectedByGravitySetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAffectedByGravity: input];
  }
}

NAN_GETTER(NSCNParticleSystem::affectedByPhysicsFieldsGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self affectedByPhysicsFields]));
  }
}

NAN_SETTER(NSCNParticleSystem::affectedByPhysicsFieldsSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAffectedByPhysicsFields: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleDiesOnCollisionGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self particleDiesOnCollision]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleDiesOnCollisionSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setParticleDiesOnCollision: input];
  }
}

NAN_GETTER(NSCNParticleSystem::colliderNodesGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNNode*>([self colliderNodes]));
  }
}

NAN_SETTER(NSCNParticleSystem::colliderNodesSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<SCNNode*>, input);
    [self setColliderNodes: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleMassGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleMass]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleMassSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleMass: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleMassVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleMassVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleMassVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleMassVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleBounceGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleBounce]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleBounceSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleBounce: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleBounceVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleBounceVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleBounceVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleBounceVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleFrictionGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleFriction]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleFrictionSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleFriction: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleFrictionVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleFrictionVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleFrictionVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleFrictionVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleChargeGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleCharge]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleChargeSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleCharge: input];
  }
}

NAN_GETTER(NSCNParticleSystem::particleChargeVariationGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self particleChargeVariation]));
  }
}

NAN_SETTER(NSCNParticleSystem::particleChargeVariationSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setParticleChargeVariation: input];
  }
}

NAN_GETTER(NSCNParticleSystem::dampingFactorGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self dampingFactor]));
  }
}

NAN_SETTER(NSCNParticleSystem::dampingFactorSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setDampingFactor: input];
  }
}

NAN_GETTER(NSCNParticleSystem::speedFactorGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self speedFactor]));
  }
}

NAN_SETTER(NSCNParticleSystem::speedFactorSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpeedFactor: input];
  }
}

NAN_GETTER(NSCNParticleSystem::stretchFactorGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self stretchFactor]));
  }
}

NAN_SETTER(NSCNParticleSystem::stretchFactorSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setStretchFactor: input];
  }
}

NAN_GETTER(NSCNParticleSystem::fresnelExponentGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self fresnelExponent]));
  }
}

NAN_SETTER(NSCNParticleSystem::fresnelExponentSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setFresnelExponent: input];
  }
}

NAN_GETTER(NSCNParticleSystem::propertyControllersGetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <SCNParticleProperty, SCNParticlePropertyController*>*/([self propertyControllers]));
  }
}

NAN_SETTER(NSCNParticleSystem::propertyControllersSetter) {
  JS_UNWRAP(SCNParticleSystem, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <SCNParticleProperty, SCNParticlePropertyController*>*/, input);
    [self setPropertyControllers: input];
  }
}

NAN_GETTER(NSCNNode_SCNParticleSystemSupport::particleSystemsGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNParticleSystem*>([self particleSystems]));
  }
}

NAN_GETTER(NSCNScene_SCNParticleSystemSupport::particleSystemsGetter) {
  JS_UNWRAP(SCNScene, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNParticleSystem*>([self particleSystems]));
  }
}
