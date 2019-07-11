//
//  main.h
//
//  Created by Emily Kolar on 5/10/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef main_h
#define main_h

#include <Availability.h>

#if __OBJC__
#import <objc/runtime.h>
@import Foundation;
@import CoreFoundation;
@import UIKit;
@import QuartzCore;
@import SceneKit;
@import SpriteKit;
@import ModelIO;
#import <SceneKit/ModelIO.h>
@import SpriteKit;
#if TARGET_OS_IPHONE
@import ARKit;
#endif
@import MetalKit;
@import Metal;
@import Vision;
@import AVFoundation;
@import AudioToolbox;
@import CoreGraphics;
@import CoreMotion;
@import Contacts;
@import GameplayKit;
@import GLKit;
@import MapKit;
@import MediaPlayer;
@import ReplayKit;
@import WebKit;
@import IOSurface;
#endif

#ifdef __cplusplus
#include <functional>
#include <v8.h>
#include <node.h>
#include <nan.h>

using namespace v8;

extern "C" {
#endif

#include <uv.h>

extern void node_start();
extern int pod(int c);

//extern void UIKit_PumpEvents(double seconds);


#ifdef __cplusplus
} // extern "C"
#endif


typedef int (^AdderBlock)(int, int);

typedef struct foo_s {
  AdderBlock add;
} foo_t;


#if __OBJC__
@interface JSApplication : UIApplication

@property bool started;
@property CGRect frame;

@end
#endif


#endif /* main_h */
