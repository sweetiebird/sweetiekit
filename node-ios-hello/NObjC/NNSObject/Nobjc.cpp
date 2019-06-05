//
//  Nobjc.m
//
//  Created by Emily Kolar on 5/29/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#undef _OBJC_MESSAGE_H
#undef OBJC_OLD_DISPATCH_PROTOTYPES
#define OBJC_OLD_DISPATCH_PROTOTYPES 1
#include <objc/message.h>
#include "Nobjc.h"

NOBJC_EXPORT id _Nullable
nobjc_msgSend0(id _Nullable self, SEL _Nonnull op) {
  return objc_msgSend(self, op);
}

NOBJC_EXPORT id _Nullable
nobjc_msgSend1(id _Nullable self, SEL _Nonnull op, id _Nullable arg0) {
  return objc_msgSend(self, op, arg0);
}
