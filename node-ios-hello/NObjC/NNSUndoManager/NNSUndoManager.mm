//
//  NNSUndoManager.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSUndoManager.h"

#define instancetype NSUndoManager
#define js_value_instancetype js_value_NSUndoManager

NNSUndoManager::NNSUndoManager() {}
NNSUndoManager::~NNSUndoManager() {}

JS_INIT_CLASS(NSUndoManager, NSObject);
  JS_ASSIGN_PROTO_METHOD(beginUndoGrouping);
  JS_ASSIGN_PROTO_METHOD(endUndoGrouping);
  JS_ASSIGN_PROTO_METHOD(disableUndoRegistration);
  JS_ASSIGN_PROTO_METHOD(enableUndoRegistration);
  JS_ASSIGN_PROTO_METHOD(undo);
  JS_ASSIGN_PROTO_METHOD(redo);
  JS_ASSIGN_PROTO_METHOD(undoNestedGroup);
  JS_ASSIGN_PROTO_METHOD(removeAllActions);
  JS_ASSIGN_PROTO_METHOD(removeAllActionsWithTarget);
  JS_ASSIGN_PROTO_METHOD(registerUndoWithTargetSelectorObject);
  JS_ASSIGN_PROTO_METHOD(prepareWithInvocationTarget);
  JS_ASSIGN_PROTO_METHOD(registerUndoWithTargetHandler);
  JS_ASSIGN_PROTO_METHOD(setActionIsDiscardable);
  JS_ASSIGN_PROTO_METHOD(setActionName);
  JS_ASSIGN_PROTO_METHOD(undoMenuTitleForUndoActionName);
  JS_ASSIGN_PROTO_METHOD(redoMenuTitleForUndoActionName);
  JS_ASSIGN_PROTO_PROP_READONLY(groupingLevel);
  JS_ASSIGN_PROTO_PROP_READONLY(isUndoRegistrationEnabled);
  JS_ASSIGN_PROTO_PROP(groupsByEvent);
  JS_ASSIGN_PROTO_PROP(levelsOfUndo);
  JS_ASSIGN_PROTO_PROP(runLoopModes);
  JS_ASSIGN_PROTO_PROP_READONLY(canUndo);
  JS_ASSIGN_PROTO_PROP_READONLY(canRedo);
  JS_ASSIGN_PROTO_PROP_READONLY(isUndoing);
  JS_ASSIGN_PROTO_PROP_READONLY(isRedoing);
  JS_ASSIGN_PROTO_PROP_READONLY(undoActionIsDiscardable);
  JS_ASSIGN_PROTO_PROP_READONLY(redoActionIsDiscardable);
  JS_ASSIGN_PROTO_PROP_READONLY(undoActionName);
  JS_ASSIGN_PROTO_PROP_READONLY(redoActionName);
  JS_ASSIGN_PROTO_PROP_READONLY(undoMenuItemTitle);
  JS_ASSIGN_PROTO_PROP_READONLY(redoMenuItemTitle);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSUndoManager, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSUndoManager, NSObject);

NAN_METHOD(NNSUndoManager::New) {
  JS_RECONSTRUCT(NSUndoManager);
  @autoreleasepool {
    NSUndoManager* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSUndoManager *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSUndoManager alloc] init];
    }
    if (self) {
      NNSUndoManager *wrapper = new NNSUndoManager();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSUndoManager::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSUndoManager::beginUndoGrouping) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    [self beginUndoGrouping];
  }
}

NAN_METHOD(NNSUndoManager::endUndoGrouping) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    [self endUndoGrouping];
  }
}

NAN_METHOD(NNSUndoManager::disableUndoRegistration) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    [self disableUndoRegistration];
  }
}

NAN_METHOD(NNSUndoManager::enableUndoRegistration) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    [self enableUndoRegistration];
  }
}

NAN_METHOD(NNSUndoManager::undo) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    [self undo];
  }
}

NAN_METHOD(NNSUndoManager::redo) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    [self redo];
  }
}

NAN_METHOD(NNSUndoManager::undoNestedGroup) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    [self undoNestedGroup];
  }
}

NAN_METHOD(NNSUndoManager::removeAllActions) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    [self removeAllActions];
  }
}

NAN_METHOD(NNSUndoManager::removeAllActionsWithTarget) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, target);
    [self removeAllActionsWithTarget: target];
  }
}

NAN_METHOD(NNSUndoManager::registerUndoWithTargetSelectorObject) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, target);
    declare_value(SEL, selector);
    declare_nullable_value(id, anObject);
    [self registerUndoWithTarget: target selector: selector object: anObject];
  }
}

NAN_METHOD(NNSUndoManager::prepareWithInvocationTarget) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, target);
    JS_SET_RETURN(js_value_id([self prepareWithInvocationTarget: target]));
  }
}

NAN_METHOD(NNSUndoManager::registerUndoWithTargetHandler) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, target);
    declare_callback(undoHandler);
    [self registerUndoWithTarget: target handler:^(id  _Nonnull target) {
      dispatch_main(^{
        if (undoHandler) {
          [undoHandler jsFunction]->Call("NNSUndoManager::registerUndoWithTargetHandler",
            js_value_id(target));
        }
      });
    }];
  }
}

NAN_METHOD(NNSUndoManager::setActionIsDiscardable) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, discardable);
    [self setActionIsDiscardable: discardable];
  }
}

NAN_METHOD(NNSUndoManager::setActionName) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, actionName);
    [self setActionName: actionName];
  }
}

NAN_METHOD(NNSUndoManager::undoMenuTitleForUndoActionName) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, actionName);
    JS_SET_RETURN(js_value_NSString([self undoMenuTitleForUndoActionName: actionName]));
  }
}

NAN_METHOD(NNSUndoManager::redoMenuTitleForUndoActionName) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, actionName);
    JS_SET_RETURN(js_value_NSString([self redoMenuTitleForUndoActionName: actionName]));
  }
}

NAN_GETTER(NNSUndoManager::groupingLevelGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self groupingLevel]));
  }
}

NAN_GETTER(NNSUndoManager::isUndoRegistrationEnabledGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isUndoRegistrationEnabled]));
  }
}

NAN_GETTER(NNSUndoManager::groupsByEventGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self groupsByEvent]));
  }
}

NAN_SETTER(NNSUndoManager::groupsByEventSetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setGroupsByEvent: input];
  }
}

NAN_GETTER(NNSUndoManager::levelsOfUndoGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self levelsOfUndo]));
  }
}

NAN_SETTER(NNSUndoManager::levelsOfUndoSetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setLevelsOfUndo: input];
  }
}

NAN_GETTER(NNSUndoManager::runLoopModesGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSRunLoopMode>([self runLoopModes]));
  }
}

NAN_SETTER(NNSUndoManager::runLoopModesSetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSRunLoopMode>, input);
    [self setRunLoopModes: input];
  }
}

NAN_GETTER(NNSUndoManager::canUndoGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canUndo]));
  }
}

NAN_GETTER(NNSUndoManager::canRedoGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canRedo]));
  }
}

NAN_GETTER(NNSUndoManager::isUndoingGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isUndoing]));
  }
}

NAN_GETTER(NNSUndoManager::isRedoingGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRedoing]));
  }
}

NAN_GETTER(NNSUndoManager::undoActionIsDiscardableGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self undoActionIsDiscardable]));
  }
}

NAN_GETTER(NNSUndoManager::redoActionIsDiscardableGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self redoActionIsDiscardable]));
  }
}

NAN_GETTER(NNSUndoManager::undoActionNameGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self undoActionName]));
  }
}

NAN_GETTER(NNSUndoManager::redoActionNameGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self redoActionName]));
  }
}

NAN_GETTER(NNSUndoManager::undoMenuItemTitleGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self undoMenuItemTitle]));
  }
}

NAN_GETTER(NNSUndoManager::redoMenuItemTitleGetter) {
  JS_UNWRAP(NSUndoManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self redoMenuItemTitle]));
  }
}

