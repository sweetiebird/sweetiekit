//
//  NCLLocationManagerDelegate.h
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLLocationManagerDelegate_h
#define NCLLocationManagerDelegate_h

#import "NNSObject.h"

#define js_value_CLLocationManagerDelegate(x) js_value_wrapper(x, CLLocationManagerDelegate)
#define to_value_CLLocationManagerDelegate(x) to_value_wrapper(x, CLLocationManagerDelegate)
#define is_value_CLLocationManagerDelegate(x) is_value_wrapper(x, CLLocationManagerDelegate)

JS_WRAP_CLASS(CLLocationManagerDelegate, NSObject);
  sweetiekit::JSFunction _onAuthorization;
  sweetiekit::JSFunction _didUpdateLocations;
  sweetiekit::JSFunction _didUpdateHeading;
JS_WRAP_CLASS_END(CLLocationManagerDelegate);

#endif /* NCLLocationManagerDelegate_h */
