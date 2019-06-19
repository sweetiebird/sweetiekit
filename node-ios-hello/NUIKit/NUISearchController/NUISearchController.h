//
//  NUISearchController.h
//
//  Created by Shawn Presser on 6/12/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUISearchController_h
#define NUISearchController_h    

#include "NUIViewController.h"

#define js_protocol_UISearchControllerDelegate(x) js_protocol_wrapper(x, UISearchControllerDelegate, NSObject)
#define to_protocol_UISearchControllerDelegate(x) to_protocol_wrapper(x, UISearchControllerDelegate, NSObject)
#define is_protocol_UISearchControllerDelegate(x) is_protocol_wrapper(x, UISearchControllerDelegate, NSObject)

// UISearchControllerDelegate
JS_WRAP_PROTOCOL(UISearchControllerDelegate, NSObject);
  JS_METHOD(willPresentSearchController);
  JS_METHOD(didPresentSearchController);
  JS_METHOD(willDismissSearchController);
  JS_METHOD(didDismissSearchController);
  JS_METHOD(presentSearchController);
JS_WRAP_PROTOCOL_END(UISearchControllerDelegate, NSObject);


#define js_protocol_UISearchResultsUpdating(x) js_protocol_wrapper(x, UISearchResultsUpdating, NSObject)
#define to_protocol_UISearchResultsUpdating(x) to_protocol_wrapper(x, UISearchResultsUpdating, NSObject)
#define is_protocol_UISearchResultsUpdating(x) is_protocol_wrapper(x, UISearchResultsUpdating, NSObject)

// UISearchResultsUpdating
JS_WRAP_PROTOCOL(UISearchResultsUpdating, NSObject);
  JS_METHOD(updateSearchResultsForSearchController);
JS_WRAP_PROTOCOL_END(UISearchResultsUpdating, NSObject);

#define js_value_UISearchController(x) js_value_wrapper(x, UISearchController)
#define to_value_UISearchController(x) to_value_wrapper(x, UISearchController)
#define is_value_UISearchController(x) is_value_wrapper(x, UISearchController)

// UISearchController
JS_WRAP_CLASS(UISearchController, UIViewController);
  JS_METHOD(initWithSearchResultsController);
  JS_PROP(searchResultsUpdater);
  JS_PROP(isActive);
  JS_PROP(delegate);
  JS_PROP(dimsBackgroundDuringPresentation);
  JS_PROP(obscuresBackgroundDuringPresentation);
  JS_PROP(hidesNavigationBarDuringPresentation);
  JS_PROP_READONLY(searchResultsController);
  JS_PROP_READONLY(searchBar);
JS_WRAP_CLASS_END(UISearchController);

#endif /* NUISearchController_h */
