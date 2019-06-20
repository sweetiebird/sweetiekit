//
//  NNSUndoManager.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSUndoManager_h
#define NNSUndoManager_h    

#include "NNSObject.h"

#define js_value_NSUndoManager(x) js_value_wrapper(x, NSUndoManager)
#define to_value_NSUndoManager(x) to_value_wrapper(x, NSUndoManager)
#define is_value_NSUndoManager(x) is_value_wrapper(x, NSUndoManager)

JS_WRAP_CLASS(NSUndoManager, NSObject);
  JS_METHOD(beginUndoGrouping);
  JS_METHOD(endUndoGrouping);
  JS_METHOD(disableUndoRegistration);
  JS_METHOD(enableUndoRegistration);
  JS_METHOD(undo);
  JS_METHOD(redo);
  JS_METHOD(undoNestedGroup);
  JS_METHOD(removeAllActions);
  JS_METHOD(removeAllActionsWithTarget);
  JS_METHOD(registerUndoWithTargetSelectorObject);
  JS_METHOD(prepareWithInvocationTarget);
  JS_METHOD(registerUndoWithTargetHandler);
  JS_METHOD(setActionIsDiscardable);
  JS_METHOD(setActionName);
  JS_METHOD(undoMenuTitleForUndoActionName);
  JS_METHOD(redoMenuTitleForUndoActionName);
  JS_PROP_READONLY(groupingLevel);
  JS_PROP_READONLY(isUndoRegistrationEnabled);
  JS_PROP(groupsByEvent);
  JS_PROP(levelsOfUndo);
  JS_PROP(runLoopModes);
  JS_PROP_READONLY(canUndo);
  JS_PROP_READONLY(canRedo);
  JS_PROP_READONLY(isUndoing);
  JS_PROP_READONLY(isRedoing);
  JS_PROP_READONLY(undoActionIsDiscardable);
  JS_PROP_READONLY(redoActionIsDiscardable);
  JS_PROP_READONLY(undoActionName);
  JS_PROP_READONLY(redoActionName);
  JS_PROP_READONLY(undoMenuItemTitle);
  JS_PROP_READONLY(redoMenuItemTitle);
JS_WRAP_CLASS_END(NSUndoManager);

#endif /* NNSUndoManager_h */
