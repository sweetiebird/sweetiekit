//
//  NMTLCommandBuffer.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLCommandBuffer.h"

#define instancetype MTLCommandBuffer
#define js_value_instancetype js_value_MTLCommandBuffer

NMTLCommandBuffer::NMTLCommandBuffer() {}
NMTLCommandBuffer::~NMTLCommandBuffer() {}

JS_INIT_PROTOCOL(MTLCommandBuffer, NSObject);
  JS_ASSIGN_PROTO_METHOD(enqueue);
  JS_ASSIGN_PROTO_METHOD(commit);
  JS_ASSIGN_PROTO_METHOD(addScheduledHandler);
  JS_ASSIGN_PROTO_METHOD(presentDrawable);
  JS_ASSIGN_PROTO_METHOD(presentDrawableAtTime);
#ifdef __IPHONEOS__
  JS_ASSIGN_PROTO_METHOD(presentDrawableAfterMinimumDuration);
#endif
  JS_ASSIGN_PROTO_METHOD(waitUntilScheduled);
  JS_ASSIGN_PROTO_METHOD(addCompletedHandler);
  JS_ASSIGN_PROTO_METHOD(waitUntilCompleted);
  JS_ASSIGN_PROTO_METHOD(blitCommandEncoder);
  JS_ASSIGN_PROTO_METHOD(renderCommandEncoderWithDescriptor);
  JS_ASSIGN_PROTO_METHOD(computeCommandEncoder);
  JS_ASSIGN_PROTO_METHOD(computeCommandEncoderWithDispatchType);
  JS_ASSIGN_PROTO_METHOD(encodeWaitForEventValue);
  JS_ASSIGN_PROTO_METHOD(encodeSignalEventValue);
  JS_ASSIGN_PROTO_METHOD(parallelRenderCommandEncoderWithDescriptor);
  JS_ASSIGN_PROTO_METHOD(pushDebugGroup);
  JS_ASSIGN_PROTO_METHOD(popDebugGroup);
  JS_ASSIGN_PROTO_PROP_READONLY(device);
  JS_ASSIGN_PROTO_PROP_READONLY(commandQueue);
  JS_ASSIGN_PROTO_PROP_READONLY(retainedReferences);
  JS_ASSIGN_PROTO_PROP(label);
  JS_ASSIGN_PROTO_PROP_READONLY(kernelStartTime);
  JS_ASSIGN_PROTO_PROP_READONLY(kernelEndTime);
  JS_ASSIGN_PROTO_PROP_READONLY(GPUStartTime);
  JS_ASSIGN_PROTO_PROP_READONLY(GPUEndTime);
  JS_ASSIGN_PROTO_PROP_READONLY(status);
  JS_ASSIGN_PROTO_PROP_READONLY(error);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLCommandBuffer, NSObject);
  // constant values (exports)


  /*!
   @enum MTLCommandBufferStatus
   
   @abstract MTLCommandBufferStatus reports the current stage in the lifetime of MTLCommandBuffer, as it proceeds to enqueued, committed, scheduled, and completed.
   
   @constant MTLCommandBufferStatusNotEnqueued
   The command buffer has not been enqueued yet.
   
   @constant MTLCommandBufferStatusEnqueued
   This command buffer is enqueued, but not committed.
   
   @constant MTLCommandBufferStatusCommitted
   Commited to its command queue, but not yet scheduled for execution.
   
   @constant MTLCommandBufferStatusScheduled
   All dependencies have been resolved and the command buffer has been scheduled for execution.
   
   @constant MTLCommandBufferStatusCompleted
   The command buffer has finished executing successfully: any blocks set with -addCompletedHandler: may now be called.
   
   @constant MTLCommandBufferStatusError
   Execution of the command buffer was aborted due to an error during execution.  Check -error for more information.
   */

  //typedef NS_ENUM(NSUInteger, MTLCommandBufferStatus) {
    JS_ASSIGN_ENUM(MTLCommandBufferStatusNotEnqueued, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLCommandBufferStatusEnqueued, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLCommandBufferStatusCommitted, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLCommandBufferStatusScheduled, NSUInteger); // = 3,
    JS_ASSIGN_ENUM(MTLCommandBufferStatusCompleted, NSUInteger); // = 4,
    JS_ASSIGN_ENUM(MTLCommandBufferStatusError, NSUInteger); // = 5,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

   /*!
   @constant MTLCommandBufferErrorDomain
   @abstract An error domain for NSError objects produced by MTLCommandBuffer
   */
  //API_AVAILABLE(macos(10.11), ios(8.0))
  JS_ASSIGN_ENUM(MTLCommandBufferErrorDomain, NSString);

  /*!
   @enum MTLCommandBufferError
   @abstract Error codes that can be found in MTLCommandBuffer.error
   
   @constant MTLCommandBufferErrorInternal
   An internal error that doesn't fit into the other categories. The actual low level error code is encoded in the local description.
   
   @constant MTLCommandBufferErrorTimeout
   Execution of this command buffer took too long, execution of this command was interrupted and aborted.
   
   @constant MTLCommandBufferErrorPageFault
   Execution of this command buffer generated an unserviceable GPU page fault. This can caused by buffer read write attribute mismatch or out of boundary access.
   
   @constant MTLCommandBufferErrorBlacklisted
   Access to this device has been revoked because this client has been responsible for too many timeouts or hangs.
   
   @constant MTLCommandBufferErrorNotPermitted
   This process does not have access to use this device.
   
   @constant MTLCommandBufferErrorOutOfMemory
   Insufficient memory was available to execute this command buffer.
   
   @constant MTLCommandBufferErrorInvalidResource
   The command buffer referenced an invalid resource.  This is most commonly caused when the caller deletes a resource before executing a command buffer that refers to it.
   
   @constant MTLCommandBufferErrorMemoryless
   One or more internal resources limits reached that prevent using memoryless render pass attachments. See error string for more detail.
   
   @constant MTLCommandBufferErrorDeviceRemoved
   The device was physically removed before the command could finish execution
   */

  //typedef NS_ENUM(NSUInteger, MTLCommandBufferError)
  {
    JS_ASSIGN_ENUM(MTLCommandBufferErrorNone, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLCommandBufferErrorInternal, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLCommandBufferErrorTimeout, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLCommandBufferErrorPageFault, NSUInteger); // = 3,
    JS_ASSIGN_ENUM(MTLCommandBufferErrorBlacklisted, NSUInteger); // = 4,
    JS_ASSIGN_ENUM(MTLCommandBufferErrorNotPermitted, NSUInteger); // = 7,
    JS_ASSIGN_ENUM(MTLCommandBufferErrorOutOfMemory, NSUInteger); // = 8,
    JS_ASSIGN_ENUM(MTLCommandBufferErrorInvalidResource, NSUInteger); // = 9,
#if TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLCommandBufferErrorMemoryless, NSUInteger); // API_AVAILABLE(ios(10.0)) API_UNAVAILABLE(macos) = 10,
#elif !TARGET_OS_UIKITFORMAC
    JS_ASSIGN_ENUM(MTLCommandBufferErrorDeviceRemoved, NSUInteger); // API_AVAILABLE(macos(10.13)) API_UNAVAILABLE(ios) = 11,
#endif
  } API_AVAILABLE(macos(10.11), ios(8.0));

  /*!
   @enum MTLDispatchType
   
   @abstract MTLDispatchType Describes how a command encoder will execute dispatched work.
   
   @constant MTLDispatchTypeSerial
   Command encoder dispatches are executed in dispatched order.
   
   @constant MTLDispatchTypeConcurrent
   Command encoder dispatches are executed in parallel with each other. 
  */

  //typedef NS_ENUM(NSUInteger, MTLDispatchType){
    JS_ASSIGN_ENUM(MTLDispatchTypeSerial, NSUInteger);
    JS_ASSIGN_ENUM(MTLDispatchTypeConcurrent, NSUInteger);
  //}API_AVAILABLE(macos(10.14), ios(12.0));


JS_INIT_PROTOCOL_END(MTLCommandBuffer, NSObject);


NAN_METHOD(NMTLCommandBuffer::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLCommandBuffer);
  @autoreleasepool {
    id<MTLCommandBuffer> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLCommandBuffer>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLCommandBuffer> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLCommandBuffer, value);
      self = value;
    }
    if (self) {
      NMTLCommandBuffer *wrapper = new NMTLCommandBuffer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLCommandBuffer::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLCommandBuffer::enqueue) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    [self enqueue];
  }
}

NAN_METHOD(NMTLCommandBuffer::commit) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    [self commit];
  }
}

NAN_METHOD(NMTLCommandBuffer::addScheduledHandler) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    [self addScheduledHandler:^(id<MTLCommandBuffer> _Nonnull) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NMTLCommandBuffer::addScheduledHandler");
        }
      });
    }];
  }
}

#include "NMTLDrawable.h"

NAN_METHOD(NMTLCommandBuffer::presentDrawable) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLDrawable, drawable);
    [self presentDrawable: drawable];
  }
}

NAN_METHOD(NMTLCommandBuffer::presentDrawableAtTime) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLDrawable, drawable);
    declare_value(CFTimeInterval, presentationTime);
    [self presentDrawable: drawable atTime: presentationTime];
  }
}

#ifdef __IPHONEOS__
NAN_METHOD(NMTLCommandBuffer::presentDrawableAfterMinimumDuration) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLDrawable, drawable);
    declare_value(CFTimeInterval, duration);
    [self presentDrawable: drawable afterMinimumDuration: duration];
  }
}
#endif

NAN_METHOD(NMTLCommandBuffer::waitUntilScheduled) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    [self waitUntilScheduled];
  }
}

NAN_METHOD(NMTLCommandBuffer::addCompletedHandler) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(block);
    [self addCompletedHandler:^(id<MTLCommandBuffer> _Nonnull commandBuffer) {
      dispatch_main(^{
        if (block) {
          [block jsFunction]->Call("NMTLCommandBuffer::addCompletedHandler",
            js_value_MTLCommandBuffer(commandBuffer));
        }
      });
    }];
  }
}

NAN_METHOD(NMTLCommandBuffer::waitUntilCompleted) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    [self waitUntilCompleted];
  }
}

#include "NMTLBlitCommandEncoder.h"

NAN_METHOD(NMTLCommandBuffer::blitCommandEncoder) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLBlitCommandEncoder([self blitCommandEncoder]));
  }
}

#include "NMTLRenderCommandEncoder.h"
#include "NMTLRenderPassDescriptor.h"

NAN_METHOD(NMTLCommandBuffer::renderCommandEncoderWithDescriptor) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLRenderPassDescriptor, renderPassDescriptor);
    JS_SET_RETURN(js_value_MTLRenderCommandEncoder([self renderCommandEncoderWithDescriptor: renderPassDescriptor]));
  }
}

#include "NMTLComputeCommandEncoder.h"

NAN_METHOD(NMTLCommandBuffer::computeCommandEncoder) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLComputeCommandEncoder([self computeCommandEncoder]));
  }
}

NAN_METHOD(NMTLCommandBuffer::computeCommandEncoderWithDispatchType) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLDispatchType, dispatchType);
    JS_SET_RETURN(js_value_MTLComputeCommandEncoder([self computeCommandEncoderWithDispatchType: dispatchType]));
  }
}

#include "NMTLEvent.h"

NAN_METHOD(NMTLCommandBuffer::encodeWaitForEventValue) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLEvent, event);
    declare_value(uint64_t, value);
    [self encodeWaitForEvent: event value: value];
  }
}

NAN_METHOD(NMTLCommandBuffer::encodeSignalEventValue) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLEvent, event);
    declare_value(uint64_t, value);
    [self encodeSignalEvent: event value: value];
  }
}

#include "NMTLParallelRenderCommandEncoder.h"

NAN_METHOD(NMTLCommandBuffer::parallelRenderCommandEncoderWithDescriptor) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLRenderPassDescriptor, renderPassDescriptor);
    JS_SET_RETURN(js_value_MTLParallelRenderCommandEncoder([self parallelRenderCommandEncoderWithDescriptor: renderPassDescriptor]));
  }
}

NAN_METHOD(NMTLCommandBuffer::pushDebugGroup) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    [self pushDebugGroup: string];
  }
}

NAN_METHOD(NMTLCommandBuffer::popDebugGroup) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    [self popDebugGroup];
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NMTLCommandBuffer::deviceGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}

#include "NMTLCommandQueue.h"

NAN_GETTER(NMTLCommandBuffer::commandQueueGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCommandQueue([self commandQueue]));
  }
}

NAN_GETTER(NMTLCommandBuffer::retainedReferencesGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self retainedReferences]));
  }
}

NAN_GETTER(NMTLCommandBuffer::labelGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

NAN_SETTER(NMTLCommandBuffer::labelSetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLabel: input];
  }
}

NAN_GETTER(NMTLCommandBuffer::kernelStartTimeGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([self kernelStartTime]));
  }
}

NAN_GETTER(NMTLCommandBuffer::kernelEndTimeGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([self kernelEndTime]));
  }
}

NAN_GETTER(NMTLCommandBuffer::GPUStartTimeGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([self GPUStartTime]));
  }
}

NAN_GETTER(NMTLCommandBuffer::GPUEndTimeGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CFTimeInterval([self GPUEndTime]));
  }
}

NAN_GETTER(NMTLCommandBuffer::statusGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCommandBufferStatus([self status]));
  }
}

#include "NNSError.h"

NAN_GETTER(NMTLCommandBuffer::errorGetter) {
  JS_UNWRAP_PROTOCOL(MTLCommandBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSError([self error]));
  }
}

