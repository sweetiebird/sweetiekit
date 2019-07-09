//
//  Nobjc.h
//
//  Created by Emily Kolar on 5/29/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef Nobjc_h
#define Nobjc_h
#if __OBJC__

#import <Foundation/Foundation.h>

#ifdef __cplusplus
#define NOBJC_EXPORT extern "C"
#else
#define NOBJC_EXPORT extern
#endif

NOBJC_EXPORT id _Nullable
nobjc_msgSend0(id _Nullable self, SEL _Nonnull op);

NOBJC_EXPORT id _Nullable
nobjc_msgSend1(id _Nullable self, SEL _Nonnull op, id _Nullable arg0);

#endif

#endif /* Nobjc_h */
