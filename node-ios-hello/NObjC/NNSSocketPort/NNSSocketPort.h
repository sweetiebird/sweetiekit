//
//  NNSSocketPort.h
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSSocketPort_h
#define NNSSocketPort_h    

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || 0 || TARGET_IPHONE_SIMULATOR

#include "NNSPort.h"

#define js_value_NSSocketPort(x) js_value_wrapper(x, NSSocketPort)
#define to_value_NSSocketPort(x) to_value_wrapper(x, NSSocketPort)
#define is_value_NSSocketPort(x) is_value_wrapper(x, NSSocketPort)

JS_WRAP_CLASS(NSSocketPort, NSPort);
  JS_METHOD(initWithTCPPort);
  JS_METHOD(initWithProtocolFamilySocketTypeProtocolAddress);
  JS_METHOD(initWithProtocolFamilySocketTypeProtocolSocket);
  JS_METHOD(initRemoteWithTCPPortHost);
  JS_METHOD(initRemoteWithProtocolFamilySocketTypeProtocolAddress);
  JS_PROP_READONLY(protocolFamily);
  JS_PROP_READONLY(socketType);
  JS_PROP_READONLY(protocol);
  JS_PROP_READONLY(address);
  JS_PROP_READONLY(socket);
JS_WRAP_CLASS_END(NSSocketPort);

#endif

#endif /* NNSSocketPort_h */
