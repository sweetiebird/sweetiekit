//
//  NCFBase.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCFBase.h"

JS_INIT_GLOBALS(CFBase);
  // global values (exports)

  /* This is a synonym for NULL, if you'd rather use a named constant. */
  JS_ASSIGN_ENUM(kCFAllocatorDefault, CFAllocatorRef);

  /* Default system allocator; you rarely need to use this. */
  JS_ASSIGN_ENUM(kCFAllocatorSystemDefault, CFAllocatorRef);

  /* This allocator uses malloc(), realloc(), and free(). This should not be
     generally used; stick to kCFAllocatorDefault whenever possible. This
     allocator is useful as the "bytesDeallocator" in CFData or
     "contentsDeallocator" in CFString where the memory was obtained as a
     result of malloc() type functions.
  */
  JS_ASSIGN_ENUM(kCFAllocatorMalloc, CFAllocatorRef);

  /* This allocator explicitly uses the default malloc zone, returned by
     malloc_default_zone(). It should only be used when an object is
     safe to be allocated in non-scanned memory.
   */
  JS_ASSIGN_ENUM(kCFAllocatorMallocZone, CFAllocatorRef);

  /* Null allocator which does nothing and allocates no memory. This allocator
     is useful as the "bytesDeallocator" in CFData or "contentsDeallocator"
     in CFString where the memory should not be freed. 
  */
  JS_ASSIGN_ENUM(kCFAllocatorNull, CFAllocatorRef);

  /* Special allocator argument to CFAllocatorCreate() which means
     "use the functions given in the context to allocate the allocator
     itself as well". 
  */
  #if TODO
  JS_ASSIGN_ENUM(kCFAllocatorUseContext, CFAllocatorRef);
  #endif

JS_INIT_GLOBALS_END(CFBase);
