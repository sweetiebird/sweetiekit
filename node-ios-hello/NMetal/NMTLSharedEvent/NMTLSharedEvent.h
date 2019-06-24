//
//  NMTLSharedEvent.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLSharedEvent_h
#define NMTLSharedEvent_h    

#include "NMTLEvent.h"

#define js_value_MTLSharedEvent(x) js_protocol_wrapper(x, MTLSharedEvent)
#define to_value_MTLSharedEvent(x) to_protocol_wrapper(x, MTLSharedEvent)
#define is_value_MTLSharedEvent(x) is_protocol_wrapper(x, MTLSharedEvent)

JS_WRAP_PROTOCOL(MTLSharedEvent, MTLEvent);
  // TODO: declare MTLSharedEvent methods and properties
JS_WRAP_PROTOCOL_END(MTLSharedEvent, MTLEvent);

#endif /* NMTLSharedEvent_h */