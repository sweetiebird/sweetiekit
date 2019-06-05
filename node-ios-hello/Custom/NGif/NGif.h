//
//  NGif.h
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGif_h
#define NGif_h

#include "NUIImage.h"

#define js_value_Gif(x) js_value_wrapper(x, Gif)
#define to_value_Gif(x) to_value_wrapper(x, Gif)
#define is_value_Gif(x) is_value_wrapper(x, Gif)

JS_WRAP_CLASS(Gif, UIImage);
JS_WRAP_CLASS_END(Gif);

#endif /* NGif_h */
