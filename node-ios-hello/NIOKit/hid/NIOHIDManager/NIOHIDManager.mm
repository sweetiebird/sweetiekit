//
//  NIOHIDManager.mm
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NIOHIDManager.h"

#include "NCFBase.h"

#if TARGET_OS_UIKITFORMAC
@import IOKit;
#import <IOKit/hid/IOHIDManager.h>

/*!
  @function   IOHIDManagerCreate
  @abstract   Creates an IOHIDManager object.
    @discussion The IOHIDManager object is meant as a global management system
                for communicating with HID devices.
    @param      allocator Allocator to be used during creation.
    @param      options Supply @link kIOHIDManagerOptionUsePersistentProperties @/link to load
                properties from the default persistent property store. Otherwise supply
                @link kIOHIDManagerOptionNone @/link (or 0).                
    @result     Returns a new IOHIDManagerRef.
*/
/*
CF_EXPORT 
IOHIDManagerRef IOHIDManagerCreate(     
                                CFAllocatorRef _Nullable        allocator,
                                IOOptionBits                    options)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;
 */
NAN_METHOD(IOHIDManagerCreate) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CFAllocatorRef, allocator);
    declare_value(IOOptionBits, options);
    JS_SET_RETURN(js_value_IOHIDManagerRef(::IOHIDManagerCreate(allocator, options)));
  }
}

namespace sweetiekit {
  IOHIDManagerRef s_hidManager;
}

using sweetiekit::s_hidManager;

//static IOHIDManagerRef s_hidManager = NULL;

static void
HIDCallback(void *context, IOReturn result, void *sender, IOHIDValueRef value)
{
    if (context != s_hidManager) {
        /* An old callback, ignore it (related to bug 2157 below) */
        return;
    }

    IOHIDElementRef elem = IOHIDValueGetElement(value);
    /*
    if (IOHIDElementGetUsagePage(elem) != kHIDPage_KeyboardOrKeypad
        || IOHIDElementGetUsage(elem) != kHIDUsage_KeyboardCapsLock) {
        return;
    }
     */
    CFIndex pressed = IOHIDValueGetIntegerValue(value);
    if (pressed) {
      int debug = 42;
      debug++;
    } else {
      int debug = 43;
      debug--;
    }
//    SDL_SendKeyboardKey(pressed ? SDL_PRESSED : SDL_RELEASED, SDL_SCANCODE_CAPSLOCK);
}

static CFDictionaryRef
CreateHIDDeviceMatchingDictionary(UInt32 usagePage, UInt32 usage)
{
    CFMutableDictionaryRef dict = CFDictionaryCreateMutable(kCFAllocatorDefault,
        0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (dict) {
        CFNumberRef number = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &usagePage);
        if (number) {
            CFDictionarySetValue(dict, CFSTR(kIOHIDDeviceUsagePageKey), number);
            CFRelease(number);
            number = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &usage);
            if (number) {
                CFDictionarySetValue(dict, CFSTR(kIOHIDDeviceUsageKey), number);
                CFRelease(number);
                return dict;
            }
        }
        CFRelease(dict);
    }
    return NULL;
}

static void
QuitHIDCallback()
{
    if (!s_hidManager) {
        return;
    }

#if 0 /* Releasing here causes a crash on Mac OS X 10.10 and earlier,
       * so just leak it for now. See bug 2157 for details.
       */
    IOHIDManagerUnscheduleFromRunLoop(s_hidManager, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
    IOHIDManagerRegisterInputValueCallback(s_hidManager, NULL, NULL);
    IOHIDManagerClose(s_hidManager, 0);

    CFRelease(s_hidManager);
#endif
    s_hidManager = NULL;
}

static void
InitHIDCallback()
{
    s_hidManager = IOHIDManagerCreate(kCFAllocatorDefault, kIOHIDOptionsTypeNone);
    if (!s_hidManager) {
        return;
    }
    CFDictionaryRef keyboard = NULL, keypad = NULL;
    CFArrayRef matches = NULL;
    keyboard = CreateHIDDeviceMatchingDictionary(kHIDPage_GenericDesktop, kHIDUsage_GD_Keyboard);
    if (!keyboard) {
        goto fail;
    }
    keypad = CreateHIDDeviceMatchingDictionary(kHIDPage_GenericDesktop, kHIDUsage_GD_Keypad);
    if (!keypad) {
        goto fail;
    } else {
      CFDictionaryRef matchesList[] = { keyboard, keypad };
      matches = CFArrayCreate(kCFAllocatorDefault, (const void **)matchesList, 2, NULL);
      if (!matches) {
          goto fail;
      }
      IOHIDManagerSetDeviceMatchingMultiple(s_hidManager, matches);
      IOHIDManagerRegisterInputValueCallback(s_hidManager, HIDCallback, s_hidManager);
      IOHIDManagerScheduleWithRunLoop(s_hidManager, CFRunLoopGetMain(), kCFRunLoopDefaultMode);
      auto result = IOHIDManagerOpen(s_hidManager, kIOHIDOptionsTypeNone);
      iOSLog0([[NSString stringWithFormat:@"IOHIDManagerOpen result: %d", (int)result] UTF8String]);
      if (result != kIOReturnSuccess) {
        int debug = 42;
        ++debug;
      }
      if (result == kIOReturnSuccess) {
          goto cleanup;
      }
    }

fail:
    QuitHIDCallback();

cleanup:
    if (matches) {
        CFRelease(matches);
    }
    if (keypad) {
        CFRelease(keypad);
    }
    if (keyboard) {
        CFRelease(keyboard);
    }
}
#endif

JS_INIT_GLOBALS(IOHIDManager);
#if TARGET_OS_UIKITFORMAC
  InitHIDCallback();
  JS_ASSIGN_GLOBAL_METHOD(IOHIDManagerCreate);

  /*!
    @typedef IOHIDOptionsType
    @abstract Options for opening a device via IOHIDLib.
    @constant kIOHIDOptionsTypeNone Default option.
    @constant kIOHIDOptionsTypeSeizeDevice Used to open exclusive
      communication with the device.  This will prevent the system
      and other clients from receiving events from the device.
  */
  //enum {
    JS_ASSIGN_ENUM(kIOHIDOptionsTypeNone, uint32_t); //      = 0x00,
    JS_ASSIGN_ENUM(kIOHIDOptionsTypeSeizeDevice, uint32_t); //  = 0x01
  //};
#endif
JS_INIT_GLOBALS_END(IOHIDManager);
