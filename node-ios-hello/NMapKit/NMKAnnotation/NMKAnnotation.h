//
//  NMKAnnotation.h
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKAnnotation_h
#define NMKAnnotation_h    

#include "NNSObject.h"

#define js_value_MKAnnotation(x) js_value_wrapper(x, MKAnnotation)
#define to_value_MKAnnotation(x) to_value_wrapper(x, MKAnnotation)
#define is_value_MKAnnotation(x) is_value_wrapper(x, MKAnnotation)

JS_WRAP_CLASS(MKAnnotation, NSObject);
  JS_METHOD(setCoordinate);
  JS_PROP_READONLY(coordinate);
  JS_PROP_READONLY(title);
  JS_PROP_READONLY(subtitle);
JS_WRAP_CLASS_END(MKAnnotation);

#if __OBJC__
#import <MapKit/MKAnnotation.h>
@interface MKAnnotation : NSObject<MKAnnotation>
// Center latitude and longitude of the annotation view.
// The implementation of this property must be KVO compliant.
@property (nonatomic) CLLocationCoordinate2D coordinate;

// Title and subtitle for use by selection UI.
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;
@end
#endif

#endif /* NMKAnnotation_h */
