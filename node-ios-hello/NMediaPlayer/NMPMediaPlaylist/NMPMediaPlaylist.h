//
//  NMPMediaPlaylist.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMPMediaPlaylist_h
#define NMPMediaPlaylist_h    

#include "NMPMediaItemCollection.h"

#define js_value_MPMediaPlaylist(x) js_value_wrapper(x, MPMediaPlaylist)
#define to_value_MPMediaPlaylist(x) to_value_wrapper(x, MPMediaPlaylist)
#define is_value_MPMediaPlaylist(x) is_value_wrapper(x, MPMediaPlaylist)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(MPMediaPlaylist, MPMediaItemCollection);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(MPMediaPlaylist);

#endif /* NMPMediaPlaylist_h */