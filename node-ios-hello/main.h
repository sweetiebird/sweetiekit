//
//  main.h
//
//  Created by Emily Kolar on 5/10/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef main_h
#define main_h

#undef TARGET_OS_IPHONE
#undef TARGET_OS_MAC
#if __IPHONEOS__
#define TARGET_OS_IPHONE 1
#else
#define TARGET_OS_MAC 1
#endif

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>
#if __IPHONEOS__
#import <ARKit/ARKit.h>
#endif
#import <MetalKit/MetalKit.h>
#import <Metal/Metal.h>


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


@interface JSApplication : UIApplication

@property bool started;
@property CGRect frame;

@end


#endif /* main_h */
