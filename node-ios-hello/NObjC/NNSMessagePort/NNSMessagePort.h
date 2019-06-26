//
//  NNSMessagePort.h
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSMessagePort_h
#define NNSMessagePort_h    

#include "NNSPort.h"

#define js_value_NSMessagePort(x) js_value_wrapper(x, NSMessagePort)
#define to_value_NSMessagePort(x) to_value_wrapper(x, NSMessagePort)
#define is_value_NSMessagePort(x) is_value_wrapper(x, NSMessagePort)

JS_WRAP_CLASS(NSMessagePort, NSPort);
  // TODO: declare NSMessagePort methods and properties
JS_WRAP_CLASS_END(NSMessagePort);

#endif /* NNSMessagePort_h */