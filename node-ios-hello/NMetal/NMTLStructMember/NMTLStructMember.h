//
//  NMTLStructMember.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLStructMember_h
#define NMTLStructMember_h    

#include "NNSObject.h"

#define js_value_MTLStructMember(x) js_value_wrapper(x, MTLStructMember)
#define to_value_MTLStructMember(x) to_value_wrapper(x, MTLStructMember)
#define is_value_MTLStructMember(x) is_value_wrapper(x, MTLStructMember)

JS_WRAP_CLASS(MTLStructMember, NSObject);
  // TODO: declare MTLStructMember methods and properties
JS_WRAP_CLASS_END(MTLStructMember);

#endif /* NMTLStructMember_h */