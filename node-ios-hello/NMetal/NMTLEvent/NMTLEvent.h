//
//  NMTLEvent.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLEvent_h
#define NMTLEvent_h    

#include "NNSObject.h"

#define js_value_MTLEvent(x) js_protocol_wrapper(x, MTLEvent)
#define to_value_MTLEvent(x) to_protocol_wrapper(x, MTLEvent)
#define is_value_MTLEvent(x) is_protocol_wrapper(x, MTLEvent)

JS_WRAP_PROTOCOL(MTLEvent, NSObject);
  // TODO: declare MTLEvent methods and properties
JS_WRAP_PROTOCOL_END(MTLEvent, NSObject);

#endif /* NMTLEvent_h */