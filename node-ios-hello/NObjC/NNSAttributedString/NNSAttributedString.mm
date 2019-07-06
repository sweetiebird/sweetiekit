//
//  NSAttributedString.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSAttributedString.h"

#define instancetype NSAttributedString
#define js_value_instancetype js_value_NSAttributedString

NNSAttributedString::NNSAttributedString () {}
NNSAttributedString::~NNSAttributedString () {}

JS_INIT_CLASS(NSAttributedString, NSObject);
  JS_ASSIGN_PROTO_METHOD(attributesAtIndexEffectiveRange);
  JS_ASSIGN_PROTO_METHOD(attributeAtIndexEffectiveRange);
  JS_ASSIGN_PROTO_METHOD(attributedSubstringFromRange);
  JS_ASSIGN_PROTO_METHOD(attributesAtIndexLongestEffectiveRangeInRange);
  JS_ASSIGN_PROTO_METHOD(attributeAtIndexLongestEffectiveRangeInRange);
  JS_ASSIGN_PROTO_METHOD(isEqualToAttributedString);
  JS_ASSIGN_PROTO_METHOD(initWithString);
  JS_ASSIGN_PROTO_METHOD(initWithStringAttributes);
  JS_ASSIGN_PROTO_METHOD(initWithAttributedString);
  JS_ASSIGN_PROTO_METHOD(enumerateAttributesInRangeOptionsUsingBlock);
  JS_ASSIGN_PROTO_METHOD(enumerateAttributeInRangeOptionsUsingBlock);
  JS_ASSIGN_PROTO_PROP_READONLY(string);
  JS_ASSIGN_PROTO_PROP_READONLY(length);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSAttributedString, NSObject);
  // constants (exports)

  // Predefined character attributes for text. If the key is not present in the dictionary, it indicates the default value described below.
  JS_ASSIGN_ENUM(NSFontAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);                // UIFont, default Helvetica(Neue) 12
  JS_ASSIGN_ENUM(NSParagraphStyleAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);      // NSParagraphStyle, default defaultParagraphStyle
  JS_ASSIGN_ENUM(NSForegroundColorAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);     // UIColor, default blackColor
  JS_ASSIGN_ENUM(NSBackgroundColorAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);     // UIColor, default nil: no background
  JS_ASSIGN_ENUM(NSLigatureAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);            // NSNumber containing integer, default 1: default ligatures, 0: no ligatures
  JS_ASSIGN_ENUM(NSKernAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);                // NSNumber containing floating point value, in points; amount to modify default kerning. 0 means kerning is disabled.
  JS_ASSIGN_ENUM(NSStrikethroughStyleAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);  // NSNumber containing integer, default 0: no strikethrough
  JS_ASSIGN_ENUM(NSUnderlineStyleAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);      // NSNumber containing integer, default 0: no underline
  JS_ASSIGN_ENUM(NSStrokeColorAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);         // UIColor, default nil: same as foreground color
  JS_ASSIGN_ENUM(NSStrokeWidthAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);         // NSNumber containing floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
  JS_ASSIGN_ENUM(NSShadowAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 6_0);              // NSShadow, default nil: no shadow
  JS_ASSIGN_ENUM(NSTextEffectAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_10, 7_0);          // NSString, default nil: no text effect

  JS_ASSIGN_ENUM(NSAttachmentAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 7_0);          // NSTextAttachment, default nil
  JS_ASSIGN_ENUM(NSLinkAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 7_0);                // NSURL (preferred) or NSString
  JS_ASSIGN_ENUM(NSBaselineOffsetAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 7_0);      // NSNumber containing floating point value, in points; offset from baseline, default 0
  JS_ASSIGN_ENUM(NSUnderlineColorAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 7_0);      // UIColor, default nil: same as foreground color
  JS_ASSIGN_ENUM(NSStrikethroughColorAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 7_0);  // UIColor, default nil: same as foreground color
  JS_ASSIGN_ENUM(NSObliquenessAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 7_0);         // NSNumber containing floating point value; skew to be applied to glyphs, default 0: no skew
  JS_ASSIGN_ENUM(NSExpansionAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_0, 7_0);           // NSNumber containing floating point value; log of expansion factor to be applied to glyphs, default 0: no expansion

  JS_ASSIGN_ENUM(NSWritingDirectionAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_6, 7_0);    // NSArray of NSNumbers representing the nested levels of writing direction overrides as defined by Unicode LRE, RLE, LRO, and RLO characters.  The control characters can be obtained by masking NSWritingDirection and NSWritingDirectionFormatType values.  LRE: NSWritingDirectionLeftToRight|NSWritingDirectionEmbedding, RLE: NSWritingDirectionRightToLeft|NSWritingDirectionEmbedding, LRO: NSWritingDirectionLeftToRight|NSWritingDirectionOverride, RLO: NSWritingDirectionRightToLeft|NSWritingDirectionOverride,

  JS_ASSIGN_ENUM(NSVerticalGlyphFormAttributeName, NSAttributedStringKey); // NS_AVAILABLE(10_7, 6_0);   // An NSNumber containing an integer value.  0 means horizontal text.  1 indicates vertical text.  If not specified, it could follow higher-level vertical orientation settings.  Currently on iOS, it's always horizontal.  The behavior for any other value is undefined.

  /************************ Attribute values ************************/
  // This defines currently supported values for NSUnderlineStyleAttributeName and NSStrikethroughStyleAttributeName. These values are or'ed together to produce an underline style.
  // Underlines will be drawn with a solid pattern by default, so NSUnderlineStylePatternSolid does not need to be specified.
  //typedef NS_OPTIONS(NSInteger, NSUnderlineStyle) {
    JS_ASSIGN_ENUM(NSUnderlineStyleNone, NSInteger); //                                     = 0x00,
    JS_ASSIGN_ENUM(NSUnderlineStyleSingle, NSInteger); //                                   = 0x01,
    JS_ASSIGN_ENUM(NSUnderlineStyleThick, NSInteger); //  NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x02,
    JS_ASSIGN_ENUM(NSUnderlineStyleDouble, NSInteger); //  NS_ENUM_AVAILABLE(10_0, 7_0)     = 0x09,

    JS_ASSIGN_ENUM(NSUnderlineStylePatternSolid, NSInteger); //  NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x0000,
    JS_ASSIGN_ENUM(NSUnderlineStylePatternDot, NSInteger); //  NS_ENUM_AVAILABLE(10_0, 7_0)        = 0x0100,
    JS_ASSIGN_ENUM(NSUnderlineStylePatternDash, NSInteger); //  NS_ENUM_AVAILABLE(10_0, 7_0)       = 0x0200,
    JS_ASSIGN_ENUM(NSUnderlineStylePatternDashDot, NSInteger); //  NS_ENUM_AVAILABLE(10_0, 7_0)    = 0x0300,
    JS_ASSIGN_ENUM(NSUnderlineStylePatternDashDotDot, NSInteger); //  NS_ENUM_AVAILABLE(10_0, 7_0) = 0x0400,

    JS_ASSIGN_ENUM(NSUnderlineStyleByWord, NSInteger); //  NS_ENUM_AVAILABLE(10_0, 7_0)            = 0x8000
  //} NS_ENUM_AVAILABLE(10_0, 6_0);

  // NSWritingDirectionFormatType values used by NSWritingDirectionAttributeName. It is or'ed with either NSWritingDirectionLeftToRight or NSWritingDirectionRightToLeft. Can specify the formatting controls defined by Unicode Bidirectional Algorithm.
  //typedef NS_ENUM(NSInteger, NSWritingDirectionFormatType) {
    JS_ASSIGN_ENUM(NSWritingDirectionEmbedding, NSInteger); //      = (0 << 1),
    JS_ASSIGN_ENUM(NSWritingDirectionOverride, NSInteger); //       = (1 << 1)
  //} NS_ENUM_AVAILABLE(10_11, 9_0);

  // NSTextEffectAttributeName values
  //typedef NSString * NSTextEffectStyle NS_TYPED_ENUM;
  JS_ASSIGN_ENUM(NSTextEffectLetterpressStyle, NSTextEffectStyle); //  NS_AVAILABLE(10_10, 7_0);

  /************************ Document formats ************************/

  //typedef NSString * NSAttributedStringDocumentType NS_TYPED_EXTENSIBLE_ENUM;

  // Supported document types for the NSDocumentTypeDocumentAttribute key in the document attributes dictionary.
  JS_ASSIGN_ENUM(NSPlainTextDocumentType, NSAttributedStringDocumentType); //  NS_AVAILABLE(10_0, 7_0);
  JS_ASSIGN_ENUM(NSRTFTextDocumentType, NSAttributedStringDocumentType); //   NS_AVAILABLE(10_0, 7_0);
  JS_ASSIGN_ENUM(NSRTFDTextDocumentType, NSAttributedStringDocumentType); //  NS_AVAILABLE(10_0, 7_0);
  JS_ASSIGN_ENUM(NSHTMLTextDocumentType, NSAttributedStringDocumentType); //   NS_AVAILABLE(10_0, 7_0);

  //typedef NSString * NSTextLayoutSectionKey NS_TYPED_ENUM;

  // Keys for NSLayoutOrientationSectionsAttribute.
  JS_ASSIGN_ENUM(NSTextLayoutSectionOrientation, NSTextLayoutSectionKey); //  NS_AVAILABLE(10_7, 7_0); // NSNumber containing NSTextLayoutOrientation value. default: NSTextLayoutOrientationHorizontal
  JS_ASSIGN_ENUM(NSTextLayoutSectionRange, NSTextLayoutSectionKey); //  NS_AVAILABLE(10_7, 7_0); // NSValue containing NSRange representing a character range. default: a range covering the whole document

  //typedef NSString * NSAttributedStringDocumentAttributeKey NS_TYPED_EXTENSIBLE_ENUM;

  // Keys for options and document attributes dictionaries.  They are in and out document properties used by both read/write methods.

  JS_ASSIGN_ENUM(NSDocumentTypeDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_0, 7_0);  // @"DocumentType", one of the document types declared above.  For reader methods, this key in options can specify the document type for interpreting the contents.  Upon return, the document attributes can contain this key for indicating the actual format used to read the contents.  For write methods, this key specifies the format for generating the data.


  // NSPlainTextDocumentType document attributes
  JS_ASSIGN_ENUM(NSCharacterEncodingDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_0, 7_0);  // @"CharacterEncoding", NSNumber containing integer specifying NSStringEncoding for the file; default for plain text is the default encoding.  This key in options can specify the string encoding for reading the data.  Upon return, the document attributes can contain the actual encoding used.  For writing methods, this value is used for generating the plain text data.
  JS_ASSIGN_ENUM(NSDefaultAttributesDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_11, 7_0);  // @"DefaultAttributes", NSDictionary containing attributes to be applied to plain files.  Used by reader methods.  This key in options can specify the default attributes applied to the entire document contents.  The document attributes can contain this key indicating the actual attributes used.


  // NSRTFTextDocumentType and NSRTFDTextDocumentType document attributes
  // Document dimension
  // They are document attributes used by read/write methods.
  JS_ASSIGN_ENUM(NSPaperSizeDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_0, 7_0);  // @"PaperSize", NSValue containing CGSize (in points)
  JS_ASSIGN_ENUM(NSPaperMarginDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE_IOS(7_0);  // @"PaperMargin", NSValue containing UIEdgeInsets

  JS_ASSIGN_ENUM(NSViewSizeDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_0, 7_0);  // @"ViewSize", NSValue containing CGSize (in points)
  JS_ASSIGN_ENUM(NSViewZoomDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_0, 7_0);  // @"ViewZoom", NSNumber containing floating point value (100 == 100% zoom)
  JS_ASSIGN_ENUM(NSViewModeDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_0, 7_0);  // @"ViewMode", NSNumber containing integer; 0 = normal; 1 = page layout

  // Document settings
  // They are document attributes used by read/write methods.
  JS_ASSIGN_ENUM(NSReadOnlyDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_0, 7_0);  // @"ReadOnly", NSNumber containing integer; if missing, or 0 or negative, not readonly; 1 or more, readonly. Note that this has nothing to do with the file system protection on the file, but instead, on how the file should be displayed to the user
  JS_ASSIGN_ENUM(NSBackgroundColorDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_0, 7_0);  // @"BackgroundColor", UIColor, representing the document-wide page background color
  JS_ASSIGN_ENUM(NSHyphenationFactorDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_0, 7_0);  // @"HyphenationFactor", NSNumber containing floating point value (0=off, 1=full hyphenation)
  JS_ASSIGN_ENUM(NSDefaultTabIntervalDocumentAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_0, 7_0);  // @"DefaultTabInterval", NSNumber containing floating point value, representing the document-wide default tab stop interval, in points
  JS_ASSIGN_ENUM(NSTextLayoutSectionsAttribute, NSAttributedStringDocumentAttributeKey); //  NS_AVAILABLE(10_7, 7_0);  // NSArray of dictionaries.  Each dictionary describing a layout orientation section.  The dictionary can have two attributes: NSTextLayoutSectionOrientation and NSTextLayoutSectionRange.  When there is a gap between sections, it's assumed to have NSTextLayoutOrientationHorizontal.

  //typedef NSString * NSAttributedStringDocumentReadingOptionKey NS_TYPED_EXTENSIBLE_ENUM;

  JS_ASSIGN_ENUM(NSDocumentTypeDocumentOption, NSAttributedStringDocumentReadingOptionKey); // ;  // @"DocumentType", NSString indicating a document type to be forced when loading the document, specified as one of the NSDocumentTypeDocumentAttribute constants listed above
  JS_ASSIGN_ENUM(NSDefaultAttributesDocumentOption, NSAttributedStringDocumentReadingOptionKey); // ;  // @"DefaultAttributes", for plain text only; NSDictionary containing attributes to be applied to plain files
  JS_ASSIGN_ENUM(NSCharacterEncodingDocumentOption, NSAttributedStringDocumentReadingOptionKey); // ;  // @"CharacterEncoding", for plain text and HTML; NSNumber containing integer specifying NSStringEncoding to be used to interpret the file

  /************************ Deprecated ************************/
  // NSUnderlineByWord and the NSUnderlinePattern* values are soft deprecated starting with macOS 10.14/iOS 12 and will be officially deprecated in a future release.  Please use the NSUnderlineStyle* equivalents instead.
  // Underlines will be drawn with a solid pattern by default, so NSUnderlinePatternSolid does not need to be specified.
  JS_ASSIGN_ENUM(NSUnderlinePatternSolid, NSUnderlineStyle); //  = NSUnderlineStylePatternSolid;
  JS_ASSIGN_ENUM(NSUnderlinePatternDot, NSUnderlineStyle); //  = NSUnderlineStylePatternDot;
  JS_ASSIGN_ENUM(NSUnderlinePatternDash, NSUnderlineStyle); //  = NSUnderlineStylePatternDash;
  JS_ASSIGN_ENUM(NSUnderlinePatternDashDot, NSUnderlineStyle); //  = NSUnderlineStylePatternDashDot;
  JS_ASSIGN_ENUM(NSUnderlinePatternDashDotDot, NSUnderlineStyle); //  = NSUnderlineStylePatternDashDotDot;
  JS_ASSIGN_ENUM(NSUnderlineByWord, NSUnderlineStyle); //  = NSUnderlineStyleByWord;

  //typedef NS_ENUM(NSInteger, NSTextWritingDirection) {
    JS_ASSIGN_ENUM(NSTextWritingDirectionEmbedding, NSInteger); //      = (0 << 1),
    JS_ASSIGN_ENUM(NSTextWritingDirectionOverride, NSInteger); //       = (1 << 1)
  //} NS_ENUM_DEPRECATED_IOS(7_0, 9_0, "Use NSWritingDirectionFormatType instead") __TVOS_PROHIBITED;

JS_INIT_CLASS_END(NSAttributedString, NSObject);

NAN_METHOD(NNSAttributedString::New) {
  JS_RECONSTRUCT(NSAttributedString);
  @autoreleasepool {
    NSAttributedString* self = nullptr;
    
    declare_args();
    if (info[0]->IsExternal()) {
      self = (__bridge NSAttributedString *)(info[0].As<External>()->Value());
    } else if (is_value_NSString(info[0])) {
      declare_pointer(NSString, string);
      declare_nullable_pointer(NSDictionary, attributes);
      self = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    } else if (is_value_NSAttributedString(info[0])) {
      declare_pointer(NSAttributedString, string);
      self = [[NSAttributedString alloc] initWithAttributedString:string];
    } else if (info.Length() <= 0) {
      self = [[NSAttributedString alloc] init];
    }
    if (self) {
      NNSAttributedString *wrapper = new NNSAttributedString();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSAttributedString::New: invalid arguments");
    }
  }
}

void copy_value_NSRange(Local<Value> dst, const NSRange* _Nullable value)
{
  if (value) {
    if (dst->IsObject()) {
      auto dstObj(JS_OBJ(dst));
      dstObj->Set(JS_STR("location"), js_value_NSUInteger(value->location));
      dstObj->Set(JS_STR("length"), js_value_NSUInteger(value->length));
    }
  }
}

NAN_METHOD(NNSAttributedString::attributesAtIndexEffectiveRange) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSUInteger, location);
    declare_value_pointer(NSRange, range);
    
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey,id>*/(
      [self attributesAtIndex: location effectiveRange: range]));
    copy_value_NSRange(rangeObj, range);
  }
}

NAN_METHOD(NNSAttributedString::attributeAtIndexEffectiveRange) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, attrName);
    declare_value(NSUInteger, location);
    declare_value_pointer(NSRange, range);
    
    JS_SET_RETURN(js_value_id(
      [self attribute: attrName atIndex: location effectiveRange: range]));
    copy_value_NSRange(rangeObj, range);
  }
}

NAN_METHOD(NNSAttributedString::attributedSubstringFromRange) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_NSAttributedString([self attributedSubstringFromRange: range]));
  }
}

NAN_METHOD(NNSAttributedString::attributesAtIndexLongestEffectiveRangeInRange) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool {
    declare_args();
    declare_value(NSUInteger, location);
    declare_value_pointer(NSRange, range);
    declare_value(NSRange, rangeLimit);
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey,id>*/(
      [self attributesAtIndex: location longestEffectiveRange: range inRange: rangeLimit]));
    copy_value_NSRange(rangeObj, range);
  }
}

NAN_METHOD(NNSAttributedString::attributeAtIndexLongestEffectiveRangeInRange) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, attrName);
    declare_value(NSUInteger, location);
    declare_value_pointer(NSRange, range);
    declare_value(NSRange, rangeLimit);
    
    JS_SET_RETURN(js_value_id(
      [self attribute: attrName atIndex: location longestEffectiveRange: range inRange: rangeLimit]));
    copy_value_NSRange(rangeObj, range);
  }
}

NAN_METHOD(NNSAttributedString::isEqualToAttributedString) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSAttributedString, other);
    
    JS_SET_RETURN(JS_BOOL(
      [self isEqualToAttributedString: other]));
  }
}

NAN_METHOD(NNSAttributedString::initWithString) {
  JS_UNWRAP_OR_ALLOC(NSAttributedString, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, str);
    JS_SET_RETURN(js_value_instancetype([self initWithString: str]));
  }
}

NAN_METHOD(NNSAttributedString::initWithStringAttributes) {
  JS_UNWRAP_OR_ALLOC(NSAttributedString, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, str);
    declare_nullable_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, attrs);
    JS_SET_RETURN(js_value_instancetype([self initWithString: str attributes: attrs]));
  }
}

NAN_METHOD(NNSAttributedString::initWithAttributedString) {
  JS_UNWRAP_OR_ALLOC(NSAttributedString, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSAttributedString, attrStr);
    JS_SET_RETURN(js_value_instancetype([self initWithAttributedString: attrStr]));
  }
}

NAN_METHOD(NNSAttributedString::enumerateAttributesInRangeOptionsUsingBlock) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSRange, enumerationRange);
    declare_value(NSAttributedStringEnumerationOptions, opts);
    declare_value(NJSFunction, fn);
    sweetiekit::JSEnumerateShouldStop shouldStop(JS_PRETTY_METHOD_NAME);
    
    auto block = ^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
      dispatch_main(^{
        fn(JS_PRETTY_METHOD_NAME, js_value_id(value), js_value_NSRange(range), shouldStop);
        if (shouldStop) {
          *stop = true;
        }
      });
    };
    
    JS_SET_RETURN(js_value_void(
      [self enumerateAttributesInRange: enumerationRange options: opts usingBlock: block]));
  }
}
  

NAN_METHOD(NNSAttributedString::enumerateAttributeInRangeOptionsUsingBlock) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, attrName);
    declare_value(NSRange, enumerationRange);
    declare_value(NSAttributedStringEnumerationOptions, opts);
    declare_value(NJSFunction, fn);
    sweetiekit::JSEnumerateShouldStop shouldStop(JS_PRETTY_METHOD_NAME);
    
    auto block = ^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
      dispatch_main(^{
        fn(JS_PRETTY_METHOD_NAME, js_value_id(value), js_value_NSRange(range), shouldStop);
        if (shouldStop) {
          *stop = true;
        }
      });
    };
    
    JS_SET_RETURN(js_value_void(
      [self enumerateAttribute: attrName inRange: enumerationRange options: opts usingBlock: block]));
  }
}

NAN_GETTER(NNSAttributedString::stringGetter) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    JS_SET_RETURN(js_value_NSString([self string]));
  }
}

NAN_GETTER(NNSAttributedString::lengthGetter) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self length]));
  }
}
