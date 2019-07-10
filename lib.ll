#!/usr/bin/env ../lumen-ios/bin/lumen-node

(define-macro var (type name rest: value)
  `(%local type: ,(quoted type) ,name ,@value))

(define-macro declare-type (type rest: value)
  `(%local type: ,type ephemeral: true %declared-type (do ,@value)))

(define-macro aif (expr rest: body)
  `(let (it ,expr)
     (if it
         ,@(if (> (# body) 2)
               `(,(hd body) (aif ,@(tl body)))
               body))))

(define-macro awhen (expr rest: body)
  `(aif (do ,expr) (do ,@body) (do)))

(define-global tuples (xs (o n 2))
  (if (none? xs)
      (list)
      (join (list (cut xs 0 n))
            (tuples (cut xs n) n))))

(define-macro foreach (v l type: (o type 'auto) rest: body)
  `(do (%block prefix: (%stmt "for (" ',type " " ,v " : " ,l ")")
         (%local ,v ephemeral: true)
         ,@body)
     (do)))

(define-special cast (type x)
  (cat "(" (dequoted type) ")" "(" (compile x) ")"))

(define-global pointer-chars (any-of "*"))

(define-global compiled-type (x)
  (rtrim (compile x) pointer-chars))

(define-special :: (s ...)
  (let f compiled-type
    (reduce (fn (a b) (cat a "::" b)) (map f (list ...)) (f (or s "")))))

(define-special -- (s ...)
  (let f compiled-type
    (reduce (fn (a b) (cat a "-" b)) (map f (list ...)) (f (or s "")))))

(define-macro %scope (head rest: body)
  `(%do (%newline) (%block prefix: ,head ,@body)))

(define-macro %autoreleasepool ()
  `(%stmt declare-autoreleasepool))

(define-macro with-autoreleasepool body
  `(%block prefix: (%autoreleasepool) ,@body))

(define-macro nan-method (method rest: body)
  `(%scope (NAN_METHOD ,method)
      ,@body))

(define-macro nan-getter (getter rest: body)
  `(%scope (NAN_GETTER ,getter)
      ,@body))

(define-macro nan-setter (setter rest: body)
  `(%scope (NAN_SETTER ,setter)
      ,@body))

(define-macro %%decltype ((o name '%%type) (o default 'auto))
  `(either (getenv ',(macroexpand name) 'type) ',(macroexpand default)))

(define-macro %decltype ((o name '%%type) (o default 'auto))
  `(when-compiling (%%decltype ,name ',default)))

(define-macro js-wrapper (type ...)
  `(:: (%literal "N" ,type)
       ,...))

(define-macro %self-type ((o wrapped-type (%decltype)))
  wrapped-type)

(define-macro js-type ((o wrapped-type (%self-type)))
  `(js-wrapper ,wrapped-type type))

(define-macro js-getter (self-type self name rest: body)
  `(nan-getter (js-wrapper ,self-type (%literal ,name "Getter"))
     (declare-type ,self-type %self)
     ,(unless (= self-type self)
       `(JS_UNWRAP ,self-type ,self))
     (with-autoreleasepool
       ;(NSLog @"%@\n" [[(%self-type) alloc] init])
       ,@body)))

(define-macro js-setter (self-type self name rest: body)
  `(nan-setter (js-wrapper ,self-type (%literal ,name "Setter"))
     (declare-type ,self-type %self)
     ,(unless (= self-type self)
       `(JS_UNWRAP ,self-type ,self))
     (with-autoreleasepool
       ;(NSLog @"%@\n" [[(%self-type) alloc] init])
       ,@body)))

(define-global objc-named-arg? (x)
  (and (string? x) (str-ends? x ":")))

(define-global objc-method-name (name args)
  (camel-case (str-replace (rtrim (apply cat name (keep objc-named-arg? args)) ":") ":" "-")))

(define-global objc-arg-name (name args)
  (camel-case (str-replace (rtrim (apply cat name (keep objc-named-arg? args)) ":") ":" "-")))

(define-global objc-gen-type (type)
 (if (obj? type)
     (objc-gen-type (apply concat "-" type))
     (trim (str-replace type
                        "const " ""
                        "*" "-pointer"
                        "-<" "<" ">-" ">"
                        "<-" "<" "->" ">"
                        " <" "<" "> " ">"
                        "< " "<" " >" ">"
                        "-pointer>" "*>"
                        ">pointer" ">-pointer")
           " ")))

(define-global objc-parse-type (type)
  (let (type (objc-gen-type type)
        nullable? false
        pointer? false)
    (when (str-starts? type "nullable-")
      (set type (clip type (# "nullable-")))
      (set nullable? true))
    (when (str-ends? type "-pointer")
      (set type (clip type 0 (- (# type) (# "-pointer"))))
      (set pointer? true))
    (list type nullable: nullable? pointer: pointer?)))

(define-global js-declare-arg (arg-type arg-name)
  (print (str `(js-declare-arg ,arg-type ,arg-name)))
  (let ((type nullable: nullable? pointer: pointer?) (objc-parse-type arg-type))
    ;(print (str `(type: ,type pointer: ,pointer? nullable: ,nullable?)))
    (if (and nullable? pointer?)
        `(declare-nullable-pointer (%literal ,(escape type)) ,arg-name)
        pointer?
        `(declare-pointer (%literal ,(escape type)) ,arg-name)
        nullable?
        `(declare-nullable-value (%literal ,(escape type)) ,arg-name)
      `(declare-value (%literal ,(escape type)) ,arg-name))))

(define-global js-gen-method-args (name args)
  (prn `(js-gen-method-args ,name ,@args))
  (with forms ()
    (when (some? args)
      (let spec `(,name ,@args)
        (add forms `(declare-args))
        (step (dispatch-name arg-type arg-name) (tuples spec 3)
           ;(print (str (list dispatch-name arg-type arg-name)))
           (unless (= dispatch-name "...")
             (add forms (js-declare-arg arg-type arg-name))))))))

(define-macro js-define-method (self-type self name args static: static? rest: body)
  `(nan-method (js-wrapper ,self-type ,(objc-method-name name args))
     (declare-type ,self-type %self)
     ,(if (= static? 'init) `(JS_UNWRAP_OR_ALLOC ,self-type ,self)
          (not static?) `(JS_UNWRAP ,self-type ,self))
     (with-autoreleasepool
       ;(NSLog @"%@\n" [[(%self-type) alloc] init])
       ,@body)))

(define-macro js-new-object ()
  `((:: Nan New<Object>)))

(define-macro js-new-array ()
  `((:: Nan New<Array>)))

(define-macro js-nil ()
  `((:: Nan Undefined)))

(define-macro js-null ()
  `((:: Nan Null)))

(define-macro js-wrap (x (o base-type '(%self-type)))
  `((:: sweetiekit GetWrapperFor) ,x (js-type ,base-type)))

(define-macro js-set (l k v)
  (let (k (if (string-literal? k)
              `(JS_STR ,k)
             k)
        v (if (string-literal? v)
              `(JS_STR ,v)
              (number? v)
              `(JS_NUM ,v)
              (or (nil? v) (= v 'nil))
              `(js-nil)
              v))
    `((:: Nan Set) ,l ,k ,v)))

(define-macro js-set-number (l k v)
  `(js-set ,l ,k (JS_NUM ,v)))

(define-macro js-map-NSArray (nsArray type: (o type 'auto) x expr (o result '%result))
  `(aif ,nsArray
      (let (%seq it
            %result (js-new-array)
            %i 0)
        (foreach ,x %seq type: ,type
          (js-set %result %i ,expr)
          (inc %i))
        %result)
      (js-nil)))

(define-macro js-value (x)
  `(declare-type Local<Value> ,x))

(define-macro to-value (type x)
  `(declare-type ,type ,x))

(define-macro js-value-value (x)
  `(js-value ,x))

(define-macro to-value-value (x)
  `(to-value auto ,x))

(define-macro js-return (x)
  `(JS_SET_RETURN (js-value ,x)))

;(define-macro js-value-NSString* (x)
;  `(js-value (aif ,x (JS_STR [it UTF8String]) (js-nil))))

(define-macro js-value-number (x)
  `(js-value (JS_NUM ,x)))

;(define-macro js-value-CGFloat (x) `(js-value (JS_FLOAT ,x)))
;(define-macro to-value-CGFloat (x) `(to-value CGFloat (TO_FLOAT ,x)))
;(define-macro js-value-double (x) `(js-value (JS_NUM ,x)))
;(define-macro to-value-double (x) `(to-value double (TO_DOUBLE ,x)))
;(define-macro js-value-uint32_t (x) `(js-value (JS_UINT ,x)))
;(define-macro to-value-uint32_t (x) `(to-value uint32_t (TO_UINT32 ,x)))
;(define-macro js-value-int32_t (x) `(js-value (JS_INT ,x)))
;(define-macro to-value-int32_t (x) `(to-value int32_t (TO_INT32 ,x)))

;(define-macro js-value-BOOL (x) `(js-value (JS_BOOL ,x)))
;(define-macro to-value-BOOL (x) `(to-value BOOL (TO_BOOL ,x)))
;(define-macro js-value-bool (x) `(js-value (JS_BOOL ,x)))
;(define-macro to-value-bool (x) `(to-value BOOL (TO_BOOL ,x)))

; (define-macro js-value-CGRect (x)
;   `(let (rect ,x
;          obj (js-new-object))
;      (js-set-number obj "x" (rect .origin .x))
;      (js-set-number obj "y" (rect .origin .y))
;      (js-set-number obj "width" (rect .size .width))
;      (js-set-number obj "height" (rect .size .height))
;      (js-value obj)))
; 
; (define-macro js-value-CGSize (x)
;   `(let (size ,x
;          obj (js-new-object))
;      (js-set-number obj "width" (size .width))
;      (js-set-number obj "height" (size .height))
;      (js-value obj)))
; 
; (define-macro js-value-CGPoint (x)
;   `(let (point ,x
;          obj (js-new-object))
;      (js-set-number obj "x" (point .x))
;      (js-set-number obj "y" (point .y))
;      (js-value obj)))

(define-macro js-obj (var rest: body)
  `(js-value
     (with ,var (js-new-object)
       ,@body)))

;(define-macro js-value-CLFloor* (x)
; `(js-value (aif ,x (js-wrap ,x CLFloor))))

; (define-macro js-value-UIView* (x)
;  `(js-value (js-wrap ,x UIView)))

;(define-macro js-value-Array<UIView*> (seq)
; `(js-map-NSArray ,seq type: UIView* x (js-wrap x UIView)))

;(define-macro js-value-id (x)
; `(js-value (js-wrap ,x NSObject)))

;(define-macro js-value-Array<id> (seq)
;  `(js-map-NSArray ,seq x (js-wrap x NSObject)))

(define-global js-return-type (return-type)
  (while (in (hd? return-type) "nullable" "const")
    (set return-type (tl return-type)))
  (let ((type nullable: nullable? pointer: pointer?) (objc-parse-type return-type))
    (if (and pointer? (= type "void"))
        "js-value-void-pointer"
      (cat "js-value-" type))))

(define js-return-body (return-type body)
  (let (type (js-return-type return-type)
        body `(declare-type ,return-type ,@body))
    (if (= type "js-value-void")
        body
        `(js-return (,type ,body)))))

(define-global objc-prefix? (name x)
  (and (str-starts? name x)
       (uppercase-code? (or (code x (+ (# name) 1)) 0))))

(define-global objc-boolean-prefix (name)
  (if (objc-prefix? name "has") "has"
      (objc-prefix? name "is") "is"
      (objc-prefix? name "can") "can"))

(define-global objc-boolean-name (arg-type name)
  (if (and (in arg-type "BOOL" "bool")
           (objc-boolean-prefix name))
      name
    (camel-case (cat "is-" name))))

(define-macro js-type-getter (self-type return-type name (o setter name) (o static?))
  ;(prn `(js-type-getter ,self-type ,return-type ,name ,@body))
  (let (return-type (expand return-type)
        self (if static? self-type `self)
        body `([,self ,name]))
    `(js-getter ,self-type ,self ,name
       ,(js-return-body return-type body))))

(define-macro js-type-setter (self-type input-type name (o setter name) (o static?))
  (let (input-type (expand input-type)
        self (if static? self-type `self))
    `(js-setter ,self-type ,self ,name
       (declare-setter)
       ,(js-declare-arg input-type "input")
       [,self ,(cat ":set-" setter) input])))

(define-global js-gen-method-part (name)
  (if (and (string? name)
           (= (char name (edge name)) ":"))
      (cat ":" (rtrim name ":"))
      (obj? name) nil
     name))
(define-global js-gen-method-call (self name args)
  `([,self ,(js-gen-method-part name) ,@(map js-gen-method-part args)]))

(define-global js-self-class ()
  (let r (getenv 'Class 'type)
    (if (obj? r) (hd r) r)))

(define-macro %instancetype ()
  (js-self-class))

(define-global objc-init? (name)
  (or (= name "init")
      (and (str-starts? name "init") 
           (uppercase-code? (or (code name 4) 0)))))

(define-global objc-delegate? (name (o kind))
  (or (= kind "protocol")
      (and (str-ends? name "Delegate") 
           (not (= name "Delegate")))))

(define-macro js-type-method (self-type return-type name args static: static? rest: body)
  (let (return-type (expand return-type)
        self (if (objc-init? name) `self static? `(%instancetype) `self)
        body (if (none? body) (js-gen-method-call self name args) body))
    `(js-define-method ,self-type self ,name ,args static: ,static?
       ,@(js-gen-method-args name args)
       ,(js-return-body return-type body))))

'(print (compile (expand '(%do
  (js-type-getter UIView CGRect frame)
  (js-type-getter UIView CGRect bounds)
  (js-type-getter UIView CGPoint origin)
  (js-type-getter UIView CGPoint center)
  (js-type-getter UIView CGSize size)
  (js-type-getter UIView CGFloat x ([self frame] .origin .x))
  (js-type-getter UIView CGFloat y ([self frame] .origin .y))
  (js-type-getter UIView CGFloat width ([self frame] .size .width))
  (js-type-getter UIView CGFloat height ([self frame] .size .height))
  (js-type-getter UIView UIView* subview0 [[self subviews] :object-at-index 0])
  (js-type-getter UIView Array<UIView*> subviews)
  (js-type-getter UIView NSString* UIImage name)
))))

;(define-macro js-value-CLLocationDistance (x) `(js-value-number ,x))
;(define-macro js-value-CLLocationAccuracy (x) `(js-value-number ,x))
;(define-macro js-value-CLLocationDirection (x) `(js-value-number ,x))
;(define-macro js-value-CLLocationSpeed (x) `(js-value-number ,x))

;(define-macro js-value-CLLocationCoordinate2D (x)
;  `(let (coord ,x
;         obj (js-new-object))
;     (js-set-number obj "latitude" (coord .latitude))
;     (js-set-number obj "longitude" (coord .longitude))
;     (js-value obj)))

(define-macro property spec
  (let (name (drop spec)
        type (drop spec)
        attrs (obj))
    (when (some? spec)
      (each x (hd spec)
        (if (is? (search x "="))
          (let ((k v) (split x "="))
            (set (get attrs k) v))
          (set (get attrs x) true)))
    ;(prn `(property ,spec))
    `(js-property ,@attrs type: ,type name: ,name attrs: ,attrs))))

(define-macro method (spec return-type name rest: args)
  `(js-method type: ,return-type name: ,name args: ,args static: ,(if (= spec "+") true false)))

(define-global js-print-type (type form)
  (if (= type (getenv 'js-print-type_%prev 'type))
      form
      (do (setenv 'js-print-type_%prev type: type)
          `(%do (%stmt "// " ,(escape type))
                ,form))))

(define-macro js-property (name: name type: type attrs: attrs class-type: (o class-type (getenv 'Class 'type)) class: static? readonly: readonly? getter: getter setter: setter)
  (prn `(js-property name: ,name type: ,type attrs: ,attrs class-type: ,class-type class: ,static? readonly: ,readonly? getter: ,getter setter: ,setter))
  (unless getter
    (set getter name))
  (unless setter
    (set setter name))
  (let class (if (obj? class-type) (hd class-type) class-type)
    (case (getenv '%%flags 'stage)
      header
      (js-print-type class 
        (if static?
          `(%indent ,(if readonly?
            `(JS_STATIC_PROP_READONLY ,getter)
            `(JS_STATIC_PROP ,getter)))
          `(%indent ,(if readonly?
            `(JS_PROP_READONLY ,getter)
            `(JS_PROP ,getter)))))
      ctor
      (js-print-type class
        (if static?
          `(%indent ,(if readonly?
              `(JS_ASSIGN_STATIC_PROP_READONLY ,getter)
              `(JS_ASSIGN_STATIC_PROP          ,getter)))
          `(%indent ,(if readonly?
              `(JS_ASSIGN_PROTO_PROP_READONLY ,getter)
              `(JS_ASSIGN_PROTO_PROP          ,getter)))))
      source
      (js-print-type class
        `(do (js-type-getter ,class ,type ,getter ,setter ,static?)
           ,(unless readonly?
              `(js-type-setter ,class ,type ,getter ,setter ,static?)))))))

(define-macro js-method (name: name args: args type: type kind: (o kind (getenv 'Class 'kind)) class: (o class (getenv 'Class 'type)) static: static?)
  (when (objc-init? name)
    (set static? 'init))
  (let class (if (obj? class) (hd class) class)
    (case (getenv '%%flags 'stage)
      header
      (js-print-type class 
        (let name (objc-method-name name args static: static?)
          `(%indent ,(if (and static? (not (= static? 'init)))
            `(JS_STATIC_METHOD ,name)
            (objc-delegate? class kind)
            `(JS_PROP ,name)
            `(JS_METHOD ,name)))))
      ctor
      (js-print-type class
        (let name (objc-method-name name args static: static?)
          `(%indent ,(if (objc-delegate? class kind)
              `(JS_ASSIGN_PROTO_PROP ,name)
              (and static? (not (= static? 'init)))
              `(JS_ASSIGN_STATIC_METHOD ,name)
              `(JS_ASSIGN_PROTO_METHOD ,name)))))
      delegate
      (js-print-type class
        (let name (objc-method-name name args static: static?)
          (if (objc-delegate? class kind)
            `(DELEGATE_PROTOCOL_PROP ,class ,name))))
      source
      (js-print-type class
        `(js-type-method ,class ,type ,name ,args static: ,static?)))))

(set reader (require 'reader))

(define-global prn (x)
  (print (str x))
  x)

(define-global strip-c-comments (s)
  (with r ""
    (while true
      (let (i1 (search s "//")
            i2 (search s "/*")
            n (# s)
            i (min (either i1 n) (either i2 n)))
        (unless (or (is? i1) (is? i2))
          (cat! r s)
          (break))
        (cat! r (clip s 0 i))
        (set s (clip s i))
        (if (str-starts? s "//")
            (let j (or (search s "\n")
                       (edge s))
              (set s (clip s j)))
            (let j (or (search s "*/")
                       (- (edge s) 1))
              (set s (clip s (+ j 2)))))))))

(define-global parse-properties (s)
  (set s (strip-c-comments s))
  (print s)
  (let hdr (str-replace s
                        ;";" ";\n"
                        "," " "
                        "__kindof" ""
                        "> *" ">* "
                        " = " "="
                        " *" "* "
                        " *" "* " 
                        " *" "* " 
                        " *" "* " 
                        " *" "* "
                        "NS_NONATOMIC_IOSONLY" "nonatomic"
                        "CF_RETURNS_NOT_RETAINED" ""
                        )
    (with r (list)
      (let (lines (map (fn (line)
                        (when (search line " @")
                          (set line (cat "@" (apply concat " @" (tl (split line " @"))))))
                        (step pre (list " NS_" " UI_" " CI_" " CIKL_" " MP_" " API_" " __IOS_" " __TVOS" " __OSX_AVAILABLE_STARTING")
                          (when (search line pre)
                            (set line (cat (hd (split line pre)) ";"))))
                        (set line (rtrim line (fn (c) (or (whitec c) (= c "{"))))))
                   (split hdr "\n"))
            n (# lines))
        (for i n
          (let line (trim (at lines i))
            ;(when (in (char line 0) "+" "-")
            ;  (while (and (nil? (search line ";"))
            ;              (< i n))
            ;    (inc i)
            ;    (if (in (char (at lines i) 0) "+" "-")
            ;        (break)
            ;      (cat! line " " (trim (at lines i))))))
            (if (in (char line 0) "+" "-")
                (let (stream (reader (.stream (clip line 1)))
                      (ok x) (guard (reader (.read-all stream))))
                   (when ok
                     (let form `(method ,(char line 0) ,@x)
                       (while (and (< i (- n 1))
                                   (not (= (last line) ";"))
                                   (let c (char (trim (at lines (+ i 1))) 0)
                                    (not (in c "-" "+" "@"))))
                         (inc i)
                         (set line (trim (at lines i)))
                         (let ((ok x) (guard (reader (.read-all (reader (.stream line))))))
                           (if ok
                               (join! form x))))
                       (add r (prn form)))))
                (= (char line 0) "@")
                (let (stream (reader (.stream (clip line 1)))
                      kind (reader (.read stream)))
                  ;(print (str kind))
                  (case kind
                    private (do)
                    class
                    (unless (= (last line) ";")
                      (add r (join (list kind (reader (.read-all stream))))))
                    protocol
                    (add r (join (list kind (reader (.read-all stream)))))
                    interface
                    (add r (join (list kind (reader (.read-all stream)))))
                    property 
                    (let (rest (reader (.read-all stream))
                          attrs (list))
                      (when (obj? (hd rest))
                        (set attrs (hd rest))
                        (set rest (tl rest)))
                      (when (one? rest)
                        ; try to split e.g.
                        ; `id<RPPreviewViewControllerDelegate>previewControllerDelegate`
                        ; into two tokens:
                        ; `id<RPPreviewViewControllerDelegate>` and `previewControllerDelegate`
                        (let-when i (search (hd rest) ">")
                          (while true
                            (let j (search (hd rest) ">" (+ i 1))
                              (if (is? j) (set i j) (break))))
                          (inc i)
                          (set rest (list (clip (hd rest) 0 i) (clip (hd rest) i)))))
                      (let (name (drop rest)
                            type (trim (apply concat " " (map trim rest))))
                        (when (some? type)
                          (add r
                            (prn (list kind 
                                     attrs
                                     type
                                     name))))))
                    (add r (list kind)))))))))))

(define-global ios-header-path (framework type subframework)
  (with r "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/"
    (cat! r framework)
    (when subframework
      (cat! r ".framework/Frameworks/" subframework))
    (cat! r ".framework/Headers/")
    (let-when i (search type "_")
      (set type (clip type (+ i 1)))
      (when (str-ends? type "_t")
        (set type (clip type 0 (- (edge type) 1)))))
    (cat! r type ".h")))

 
(define-global apple-framework-prefixes*
  (obj AR: "ARKit"
       AU: "AudioToolbox"
       AV: "AVFoundation"
       CA: "QuartzCore"
       CG: "CoreGraphics"
       CI: "CoreImage"
       CL: "CoreLocation"
       CM: "CoreMotion"
       CN: "Contacts"
       EA: "OpenGLES"
       GK: "GameplayKit"
      GLK: "GLKit"
      MDL: "ModelIO"
       MK: "MapKit"
       MP: "MediaPlayer"
      MTK: "MetalKit"
      MTL: "Metal"
       NS: "Foundation"
      nw_: "Network"
       RP: "ReplayKit"
      SCN: "SceneKit"
      Sec: "Security"
       SK: "SpriteKit"
       UI: "UIKit"
       VN: "Vision"
       WK: "WebKit"))

(define-global ios-framework-from-type (type)
  (for i (# type)
    (let pre (clip type 0 i)
      (let-when framework (get apple-framework-prefixes* pre)
        (return framework))))
  (error (cat "Unknown type " type)))

(define-global objc-resolve (type framework subframework)
  (let framework (or framework (ios-framework-from-type type))
    (obj framework: framework
         path: (ios-header-path framework type subframework)
         subframework: subframework)))

(define-global test-parse-properties (type framework subframework)
  (let ((framework: framework subframework: subframework path: path)
        (objc-resolve type framework subframework)
        contents (read-file (prn path))
        props (parse-properties contents)
        form `(do))
    (step x props
      (when (in (hd? x) 'interface 'protocol)
        (add form `(when-compiling (setenv 'Class kind: ',(at x 0) type: ',(at x 1)) '(do))))
      (when (and (hd? x 'method) (= (at x 1) "+"))
        (add form x)))
    (step x props
      (when (in (hd? x) 'interface 'protocol)
        (add form `(when-compiling (setenv 'Class kind: ',(at x 0) type: ',(at x 1)) '(do))))
      (when (and (hd? x 'method) (= (at x 1) "-"))
        (add form x)))
    (step x props
      ;(print (str x))
      (when (in (hd? x) 'interface 'protocol)
        (add form `(when-compiling (setenv 'Class kind: ',(at x 0) type: ',(at x 1)) '(do))))
      (when (hd? x 'property)
        (add form x)))
    (step stage '(header ctor delegate source)
      (print (cat "// --------- begin " stage " --------------"))
      (when (= stage "source")
        (print (cat "#define instancetype " type))
        (print (cat "#define js_value_instancetype js_value_" type)))
      (setenv '%%flags stage: stage)
      (print (compile (expand form)))
      (print (cat "// --------- end " stage " ----------------"))
      )
    form))

(define-global test-framework ((o framework 'StoreKit))
  (step x '(
            SKAdNetwork
            SKCloudServiceController
            SKCloudServiceSetupViewController
            SKDownload
            SKError
            SKPayment
            SKPaymentDiscount
            SKPaymentQueue
            SKPaymentTransaction
            SKProduct
            SKProductDiscount
            SKProductsRequest
            SKProductStorePromotionController
            SKReceiptRefreshRequest
            SKRequest
            SKStoreProductViewController
            SKStoreReviewController
            )
    (test-parse-properties x 'StoreKit)))

(define-global test-av-framework ()
  (with r (list)

    (step x (split (trim "
#import <AVFoundation/AVCaptureAudioDataOutput.h>
#import <AVFoundation/AVCaptureAudioPreviewOutput.h>
#import <AVFoundation/AVCaptureDepthDataOutput.h>
#import <AVFoundation/AVCaptureFileOutput.h>
#import <AVFoundation/AVCaptureMetadataOutput.h>
#import <AVFoundation/AVCapturePhotoOutput.h>
#import <AVFoundation/AVCaptureStillImageOutput.h>
#import <AVFoundation/AVCaptureVideoDataOutput.h>
  ") "\n")
      (let ((framework header) (split (inner (trim (last (split x "#import ")))) "/"))
        (add r (list framework (hd (split header "."))))))))

(define-global test-parse-imports paths
  (with r (list)
    (step path paths
      (let s (read-file path)
        (print s)
        (step x (split (trim s) "\n")
          (when (= (clip x 0 (# "#import")) "#import")
            (let ((framework header) (split (inner (trim (last (split x "#import ")))) "/"))
              (add r (list framework (hd (split header ".")))))))))))
  

(define-global parse-objc-header (s)
  (step x (parse-properties s)
    (print (str x))))

(define-symbol test-objc-header (parse-objc-header "
/*
 *  coordinate
 *  
 *  Discussion:
 *    Returns the coordinate of the current location.
 */
@property(readonly, nonatomic) CLLocationCoordinate2D coordinate;

/*
 *  altitude
 *  
 *  Discussion:
 *    Returns the altitude of the location. Can be positive (above sea level) or negative (below sea level).
 */
@property(readonly, nonatomic) CLLocationDistance altitude;

/*
 *  horizontalAccuracy
 *  
 *  Discussion:
 *    Returns the horizontal accuracy of the location. Negative if the lateral location is invalid.
 */
@property(readonly, nonatomic) CLLocationAccuracy horizontalAccuracy;

/*
 *  verticalAccuracy
 *  
 *  Discussion:
 *    Returns the vertical accuracy of the location. Negative if the altitude is invalid.
 */
@property(readonly, nonatomic) CLLocationAccuracy verticalAccuracy;

/*
 *  course
 *  
 *  Discussion:
 *    Returns the course of the location in degrees true North. Negative if course is invalid.
 *
 *  Range:
 *    0.0 - 359.9 degrees, 0 being true North
 */
@property(readonly, nonatomic) CLLocationDirection course API_AVAILABLE(ios(2.2), macos(10.7)) API_UNAVAILABLE(tvos);

/*
 *  speed
 *  
 *  Discussion:
 *    Returns the speed of the location in m/s. Negative if speed is invalid.
 */
@property(readonly, nonatomic) CLLocationSpeed speed API_AVAILABLE(ios(2.2), macos(10.7)) API_UNAVAILABLE(tvos);

/*
 *  timestamp
 *  
 *  Discussion:
 *    Returns the timestamp when this location was determined.
 */
@property(readonly, nonatomic, copy) NSDate *timestamp;

/*
 *  floor
 *
 *  Discussion:
 *    Contains information about the logical floor that you are on
 *    in the current building if you are inside a supported venue.
 *    This will be nil if the floor is unavailable.
 */
@property(readonly, nonatomic, copy, nullable) CLFloor *floor API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos);
"))

;(define-macro js-wrap-type (type supertype rest: body)
  ;`(%do (let-macro ((js-type-getter 

'(print (compile (expand '(%do
  (js-type-getter CLLocation CLLocationCoordinate2D coordinate)
  (js-type-getter CLLocation CLLocationDistance altitude)
  (js-type-getter CLLocation CLLocationAccuracy horizontalAccuracy)
  (js-type-getter CLLocation CLLocationAccuracy verticalAccuracy)
  (js-type-getter CLLocation CLLocationDirection course)
  (js-type-getter CLLocation CLLocationSpeed speed)

;   (js-type-getter value CLLocation me
;      (js-obj x
;        (js-set x "foo" (js-value-CGRect [self frame]))
;        (js-set x "bar" (js-value-NSString* [self description]))
;        (js-set x "views" (js-value-Array<UIView*> [self subviews]))
;        
;        ))
))))

;(print (with-indent (with-indent (compile (expand '(%block prefix: (%stmt (NAN_GETTER (:: NUIImage nameGetter))) (JS_UNWRAP UIImage ui) (with-autoreleasepool (aif [ui name] (JS_SET_RETURN (JS_STR [it UTF8String]))))))))))

;(define-macro nan-method (self-type self method rest: body)
;  `(%do (%stmt (NAN_METHOD (.. ,(cat "N" self-type) "::" ,method)))
;        (%block (var Nan::HandleScope scope) (autoreleasepool (var Local<Object> ,(cat self "Obj") (info (.This))) (var ,(cat "N" el-type "*") ,self (new (,(cat "N" el-type)))) ,@body))))

(define-global main (argv)
  (let ((type (o framework) (o subframework) resolve: (o resolve))
        (keep (fn (x) (not (obj? x)))
              (parse-arguments (obj r: "resolve") argv)))
    (set target* 'c)
    (if resolve
        (let ((path: path) (objc-resolve type framework subframework)
              contents (read-file path))
          (print path))
      (test-parse-properties type framework subframework))))

(export main)
