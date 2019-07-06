//
//  NCGFont.h
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGFont_h
#define NCGFont_h    

#include "NNSObject.h"

#define js_value_CGFontRef(x) js_value_bridged(x, CGFontRef)
#define to_value_CGFontRef(x) to_value_bridged(x, CGFontRef)
#define is_value_CGFontRef(x) is_value_bridged(x, CGFontRef)

/* A type to represent indexes in a CGFontRef. */

//typedef unsigned short CGFontIndex;

#define js_value_CGFontIndex(x) js_value_uint16_t(x)
#define to_value_CGFontIndex(x) to_value_uint16_t(x)
#define is_value_CGFontIndex(x) is_value_uint16_t(x)

/* A type to represent glyph identifiers in a CGFontRef. */

//typedef CGFontIndex CGGlyph;

#define js_value_CGGlyph(x) js_value_CGFontIndex(x)
#define to_value_CGGlyph(x) to_value_CGFontIndex(x)
#define is_value_CGGlyph(x) is_value_CGFontIndex(x)

/* The format of a PostScript font subset. Type1 is documented in "Adobe
   Type 1 Font Format"; Type3 in "PostScript Language Reference, 3rd ed."
   and Type42 in "Adobe Technical Note 5012, The Type 42 Font Format
   Specification". */

#define js_value_CGFontPostScriptFormat(x) JS_ENUM(CGFontPostScriptFormat, int32_t, x)
#define to_value_CGFontPostScriptFormat(x) TO_ENUM(CGFontPostScriptFormat, int32_t, x)
#define is_value_CGFontPostScriptFormat(x) IS_ENUM(CGFontPostScriptFormat, int32_t, x)

JS_WRAP_GLOBALS(CGFont);
JS_WRAP_GLOBALS_END(CGFont);

#endif /* NCGFont_h */
