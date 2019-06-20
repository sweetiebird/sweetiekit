//
//  NUIRefreshControl.mm
//
//  Created by Emily Kolar on 4/23/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIRefreshControl.h"

#define instancetype UIRefreshControl
#define js_value_instancetype js_value_UIRefreshControl

#ifdef __OBJC__

@interface NSInvocation (CategoryNSInvocation)

+ (NSInvocation *) invocationWithTarget:(id)aTarget block:(void (^)(id target))block;
+ (NSInvocation *) invocationWithSelector:(SEL)aSelector forTarget:(id)aTarget;
+ (NSInvocation *) invocationWithSelector:(SEL)aSelector andObject:(__autoreleasing id)anObject forTarget:(id)aTarget;

@end

typedef void (^BlockInvocationBlock)(id target);

#pragma mark - Private Interface:

@interface BlockInvocation : NSObject
@property (readwrite, nonatomic, copy) BlockInvocationBlock block;
@end

#pragma mark - Invocation Container:

@implementation BlockInvocation

@synthesize block;

- (id) initWithBlock:(BlockInvocationBlock)aBlock {
  
  if ( (self = [super init]) ) {
    
    self.block = aBlock;
    
  } return self;
}

+ (BlockInvocation *) invocationWithBlock:(BlockInvocationBlock)aBlock {
  return [[self alloc] initWithBlock:aBlock];
}

- (void) performWithTarget:(id)aTarget {
  self.block(aTarget);
}

@end

#pragma mark Implementation:

@implementation NSInvocation (CategoryNSInvocation)

#pragma mark - Class Methods:

+ (NSInvocation *) invocationWithTarget:(id)aTarget block:(void (^)(id target))block {
  
  BlockInvocation *blockInvocation = [BlockInvocation invocationWithBlock:block];
  NSInvocation *invocation = [NSInvocation invocationWithSelector:@selector(performWithTarget:) andObject:aTarget forTarget:blockInvocation];
  [invocation associateValue:blockInvocation withKey:@"BlockInvocation"];
  return invocation;
}

+ (NSInvocation *) invocationWithSelector:(SEL)aSelector forTarget:(id)aTarget {
  
  NSMethodSignature   *aSignature  = [aTarget methodSignatureForSelector:aSelector];
  NSInvocation        *aInvocation = [NSInvocation invocationWithMethodSignature:aSignature];
  [aInvocation setTarget:aTarget];
  [aInvocation setSelector:aSelector];
  return aInvocation;
}

+ (NSInvocation *) invocationWithSelector:(SEL)aSelector andObject:(__autoreleasing id)anObject forTarget:(id)aTarget {
  
  NSInvocation *aInvocation = [NSInvocation invocationWithSelector:aSelector
                                                         forTarget:aTarget];
  [aInvocation setArgument:&anObject atIndex:2];
  return aInvocation;
}

@end

#endif


NUIRefreshControl::NUIRefreshControl () {}
NUIRefreshControl::~NUIRefreshControl () {}

JS_INIT_CLASS(UIRefreshControl, UIControl);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(beginRefreshing);
  JS_ASSIGN_PROTO_METHOD(endRefreshing);
  JS_ASSIGN_PROTO_PROP_READONLY(isRefreshing);
  JS_ASSIGN_PROTO_PROP(tintColor);
  JS_ASSIGN_PROTO_PROP(attributedTitle);
  // static members (ctor)
  JS_INIT_CTOR(UIRefreshControl, UIControl);
  JS_ASSIGN_STATIC_METHOD(init);
JS_INIT_CLASS_END(UIRefreshControl, UIControl);

NAN_METHOD(NUIRefreshControl::New) {
  JS_RECONSTRUCT(UIRefreshControl);
  @autoreleasepool {
    UIRefreshControl* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIRefreshControl *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[UIRefreshControl alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIRefreshControl alloc] init];
    }
    if (self) {
      NUIRefreshControl *wrapper = new NUIRefreshControl();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIRefreshControl::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIRefreshControl::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[UIRefreshControl alloc] init]));
  }
}

NAN_METHOD(NUIRefreshControl::beginRefreshing) {
  JS_UNWRAP(UIRefreshControl, self);
  declare_autoreleasepool {
    [self beginRefreshing];
  }
}

NAN_METHOD(NUIRefreshControl::endRefreshing) {
  JS_UNWRAP(UIRefreshControl, self);
  declare_autoreleasepool {
    [self endRefreshing];
  }
}

NAN_GETTER(NUIRefreshControl::isRefreshingGetter) {
  JS_UNWRAP(UIRefreshControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRefreshing]));
  }
}

NAN_GETTER(NUIRefreshControl::tintColorGetter) {
  JS_UNWRAP(UIRefreshControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self tintColor]));
  }
}

NAN_SETTER(NUIRefreshControl::tintColorSetter) {
  JS_UNWRAP(UIRefreshControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setTintColor: input];
  }
}

#include "NNSAttributedString.h"

NAN_GETTER(NUIRefreshControl::attributedTitleGetter) {
  JS_UNWRAP(UIRefreshControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSAttributedString([self attributedTitle]));
  }
}

NAN_SETTER(NUIRefreshControl::attributedTitleSetter) {
  JS_UNWRAP(UIRefreshControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSAttributedString, input);
    [self setAttributedTitle: input];
  }
}

