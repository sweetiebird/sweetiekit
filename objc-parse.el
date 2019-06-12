;;; -*- lexical-binding: t -*-

(setq-local lexical-binding t)

;(require 'y)
(require 'cl)
(require 'rx)

(y-do
  (define-global testify (x)
    (if (functionp x) x (fn (y) (equalp x y))))

  (define-global first (f l &optional pos)
    (catch 'y-break
      (let (i (or pos 0)
            n (\# l))
        (while (< i n)
          (let (x (at l i)
                y (funcall f x))
            (if (is? y) (throw 'y-break i)))
          (inc i)))))

  (define-global cleave (f l)
    (set f (testify f))
    (let r (list)
      (let pos 0
        (while t
          (let i (first f l pos)
            (if (is? i)
                (progn (add r (cut l pos i))
                       (set pos (+ i 1)))
                (progn (add r (cut l pos))
                       (return r))))))))

  (define-global rx-start (pattern)
    (if (= (at pattern 0) ?^)
        pattern
      (concat "^" pattern)))

  (define-global str-starts? (str pattern &optional literal)
    (if literal
        (= pattern (clip str 0 (\# pattern)))
        (= 0 (string-match-p (rx-start pattern) str))))

  (define-global rx-symbol (x)
    (if (str-starts? x "\\_<" t)
        x
        (concat "\\_<" x "\\_>")))
)

(y-do
  (defvar objc-framework-search-paths
    (list
      "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/"
      "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/AVFoundation.framework/Frameworks/"
      "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/Accelerate.framework/Frameworks/"
      "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/MetalPerformanceShaders.framework/Frameworks/"))

  (defvar objc-framework-aliases
    (list (list "UIKitCore" "UIKit")))

  (define-global objc-resolve-framework (name)
    (let-when (old new) (assoc name objc-framework-aliases)
      (set name new))
    (step path objc-framework-search-paths
      (if (functionp path)
          (let-when result (call path name)
            (return result))
        (let framework (expand-file-name (concat name ".framework/") path)
          (when (file-directory-p framework)
            (return framework))))))

  (define-global str (x)
    (prin1-to-string x))

  (define-global objc-resolve-header (name)
    (let (name (if (string-match-p "[.]" name) name (concat name ".h"))
          (framework name)
          (let x (split-string name "/")
            (if (one? x)
                (list (hd objc-framework-search-paths) name)
                (list (objc-resolve-framework (hd x)) (last x)))))
      (directory-files-recursively framework (concat "^" (regexp-quote name) "$"))))

  (defconst objc-whitespace-regexp "[ \t\r\n]+")
  (defconst objc-line-comment-regexp "//.*?$")
  (defconst objc-block-comment-regexp "[/][*]\\(.\\|[\n]\\)*?[*][/]")

  (defvar objc-skip-regexps '(objc-whitespace-regexp
                              objc-line-comment-regexp
                              objc-block-comment-regexp))

  (define-global regexp-paren (&optional paren)
    (cond
      ((consp paren)         paren)
      ((stringp paren)       (cons paren "\\)"))
      ((eq paren 'words)    '("\\<\\(" . "\\)\\>"))
      ((eq paren 'symbols) '("\\_<\\(" . "\\)\\_>"))
      ((null paren)          '("\\(?:" . "\\)"))
      (t                       '("\\(" . "\\)"))))

  (define-global hd? (l x)
    (and (consp l) (equalp (hd l) x)))

  (define-global tl? (l x)
    (and (consp l) (equalp (last l) x)))

  (define-global regexp-symbol (x)
    (let name (symbol-name x)
      (let suffix nil
        (let (v1 (clip name (edge name))
              v2 (clip name (- (edge name) 1)))
          (if (or (= v2 "+?")
                  (= v2 "*?")
                  (= v2 "??"))
              (progn (set suffix v2)
                     (set name (clip name 0 (- (edge name) 1))))
              (or (= v1 "+")
                  (= v1 "*")
                  (= v1 "?"))
              (progn (set suffix v1)
                     (set name (clip name 0 (edge name))))))
        (list (intern name) suffix))))

  (define-global regexp-symbol-value (x)
    (let ((name suffix) (regexp-symbol x))
      (list (symbol-value name) suffix)))

  (define-global id-literal? (x)
    (and (> (\# x) 2)
         (= (at x 0) ?|)
         (= (at x (edge x)) ?|)))

  (define-global regexp-parse (x)
    (if (consp x)
        (progn (print "here")
        (let (x (map #'regexp-parse x)
              forms (cleave '| x)
              forms (map (fn (x) (if (> (\# x) 1) `(&and ,@x) (hd x)))
                         forms))
          (print (str (list 'x x 'forms forms)))
          (if (> (\# forms) 1)
              `(&or ,@forms)
             (hd forms))))
        (stringp x)
        (if (id-literal? x)
            (rx-symbol (clip x 1 (edge x)))
           x)
       x))

  (define-global regexp-any (x &optional parens)
    (let parens (regexp-paren parens)
      (if (symbolp x)
          (let ((value suffix) (regexp-symbol-value x))
            (concat (regexp-any value parens) (or suffix "")))
          (hd? x '&and)
          (concat "\\(?:"
            (mapconcat
              (fn (x)
                (regexp-any x parens))
              (tl x)
              "")
            "\\)")
          (consp x)
          (let suffix ""
            (let v (last x)
              (when (or (= v '+)
                        (= v '+\?)
                        (= v '*)
                        (= v '*\?)
                        (= v '\?)
                        (= v '\?\?))
                (set suffix (symbol-name v))
                (set x (almost x))
                (when (one? x)
                  (return (concat (regexp-any (hd x) parens) suffix)))))
            (concat (car parens)
                    (mapconcat
                      (fn (x)
                        (regexp-any x parens))
                      (if (hd? x '&or) (tl x) x)
                      "\\|")
                    (cdr parens)
                    suffix))
          (null x) x
         x)))

  (define-global objc-skip-non-code ()
    (let pat (concat (regexp-any objc-skip-regexps t) "+")
      (when (looking-at pat)
        (set (point) (match-end 0)))
      (point)))

  (define-global objc-symbols (x)
    (if (stringp x)
        (if (id-literal? x) x (concat "|" x "|"))
        (consp x)
        (map #'objc-symbols x)
       x))
)

(y-do
  (define-macro define-lexer-mode (name :rest body)
    `(progn ,@body))

  (define-macro define-lexer (name :rest body)
    (set body (hd (cleave '-> body)))
    `(defconst ,name ',(regexp-parse body)))

  (define-macro define-token (name :rest body)
    `(define-lexer ,name ,(objc-symbols body)))

  ; Words you can't use

  (define-token AUTO                     "auto")
  (define-token BREAK                    "break")
  (define-token CASE                     "case")
  (define-token CHAR                     "char")
  (define-token CONST                    "const")
  (define-token CONTINUE                 "continue")
  (define-token DEFAULT                  "default")
  (define-token DO                       "do")
  (define-token DOUBLE                   "double")
  (define-token ELSE                     "else")
  (define-token ENUM                     "enum")
  (define-token EXTERN                   "extern")
  (define-token FLOAT                    "float")
  (define-token FOR                      "for")
  (define-token GOTO                     "goto")
  (define-token IF                       "if")
  (define-token INLINE                   "inline")
  (define-token INT                      "int")
  (define-token LONG                     "long")
  (define-token REGISTER                 "register")
  (define-token RESTRICT                 "restrict")
  (define-token RETURN                   "return")
  (define-token SHORT                    "short")
  (define-token SIGNED                   "signed")
  (define-token SIZEOF                   "sizeof")
  (define-token STATIC                   "static")
  (define-token STRUCT                   "struct")
  (define-token SWITCH                   "switch")
  (define-token TYPEDEF                  "typedef")
  (define-token UNION                    "union")
  (define-token UNSIGNED                 "unsigned")
  (define-token VOID                     "void")
  (define-token VOLATILE                 "volatile")
  (define-token WHILE                    "while")
  (define-token BOOL_                    "_Bool")
  (define-token COMPLEX                  "_Complex")
  (define-token IMAGINERY                "_Imaginery")
  (define-token TRUE                     "true")
  (define-token FALSE                    "false")

  ; Words you shouldn"t use

  (define-token BOOL                     "BOOL")
  (define-token Class                    "Class")
  (define-token BYCOPY                   "bycopy")
  (define-token BYREF                    "byref")
  (define-token ID                       "id")
  (define-token IMP                      "IMP")
  (define-token IN                       "in")
  (define-token INOUT                    "inout")
  (define-token NIL                      "nil")
  (define-token NO                       "NO")
  (define-token NULL                     "NULL")
  (define-token ONEWAY                   "oneway")
  (define-token OUT                      "out")
  (define-token PROTOCOL_                "Protocol")
  (define-token SEL                      "SEL")
  (define-token SELF                     "self")
  (define-token SUPER                    "super")
  (define-token YES                      "YES")
  (define-token AUTORELEASEPOOL          "@autoreleasepool")
  (define-token CATCH                    "@catch")
  (define-token CLASS                    "@class")
  (define-token DYNAMIC                  "@dynamic")
  (define-token ENCODE                   "@encode")
  (define-token END                      "@end")
  (define-token FINALLY                  "@finally")
  (define-token IMPLEMENTATION           "@implementation")
  (define-token INTERFACE                "@interface")
  (define-token IMPORT                   "@import")
  (define-token PACKAGE                  "@package")
  (define-token PROTOCOL                 "@protocol")
  (define-token OPTIONAL                 "@optional")
  (define-token PRIVATE                  "@private")
  (define-token PROPERTY                 "@property")
  (define-token PROTECTED                "@protected")
  (define-token PUBLIC                   "@public")
  (define-token REQUIRED                 "@required")
  (define-token SELECTOR                 "@selector")
  (define-token SYNCHRONIZED             "@synchronized")
  (define-token SYNTHESIZE               "@synthesize")
  (define-token THROW                    "@throw")
  (define-token TRY                      "@try")
  (define-token ATOMIC                   "atomic")
  (define-token NONATOMIC                "nonatomic")
  (define-token RETAIN                   "retain")

  ; Attributes with `__` prefix

  (define-token ATTRIBUTE                "__attribute__")
  (define-token AUTORELEASING_QUALIFIER  "__autoreleasing")
  (define-token BLOCK                    "__block")
  (define-token BRIDGE                   "__bridge")
  (define-token BRIDGE_RETAINED          "__bridge_retained")
  (define-token BRIDGE_TRANSFER          "__bridge_transfer")
  (define-token COVARIANT                "__covariant")
  (define-token CONTRAVARIANT            "__contravariant")
  (define-token DEPRECATED               "__deprecated")
  (define-token KINDOF                   "__kindof")
  (define-token STRONG_QUALIFIER         "__strong")
  (define-token TYPEOF                   "typeof" | "__typeof" | "__typeof__")
  (define-token UNSAFE_UNRETAINED_QUALIFIER "__unsafe_unretained")
  (define-token UNUSED                   "__unused")
  (define-token WEAK_QUALIFIER           "__weak")

  ; Nullability specifiers

  (define-token NULL_UNSPECIFIED         "null_unspecified" | "__null_unspecified" | "_Null_unspecified")
  (define-token NULLABLE                 "nullable" | "__nullable" | "_Nullable")
  (define-token NONNULL                  "nonnull" | "__nonnull" | "_Nonnull")
  (define-token NULL_RESETTABLE          "null_resettable")

  ; NS prefix

  (define-token NS_INLINE                "NS_INLINE")
  (define-token NS_ENUM                  "NS_ENUM")
  (define-token NS_OPTIONS               "NS_OPTIONS")

  ; Property attributes

  (define-token ASSIGN                   "assign")
  (define-token COPY                     "copy")
  (define-token GETTER                   "getter")
  (define-token SETTER                   "setter")
  (define-token STRONG                   "strong")
  (define-token READONLY                 "readonly")
  (define-token READWRITE                "readwrite")
  (define-token WEAK                     "weak")
  (define-token UNSAFE_UNRETAINED        "unsafe_unretained")

  ; Interface Builder attributes

  (define-token IB_OUTLET                "IBOutlet")
  (define-token IB_OUTLET_COLLECTION     "IBOutletCollection")
  (define-token IB_INSPECTABLE           "IBInspectable")
  (define-token IB_DESIGNABLE            "IB_DESIGNABLE")

  ; Ignored macros

  (define-lexer NS_ASSUME_NONNULL_BEGIN  "|NS_ASSUME_NONNULL_BEGIN|" "[^\r\n]*"  -> (channel IGNORED_MACROS))
  (define-lexer NS_ASSUME_NONNULL_END    "|NS_ASSUME_NONNULL_END|" "[^\r\n]*"    -> (channel IGNORED_MACROS))
  (define-lexer EXTERN_SUFFIX            "[_A-Z]+" "_EXTERN"                   -> (channel IGNORED_MACROS))
  (define-lexer IOS_SUFFIX               "[_A-Z]+" "_IOS" "[(]" "[^)]+" "[)]"  -> (channel IGNORED_MACROS))
  (define-lexer MAC_SUFFIX               "[_A-Z]+" "_MAC" "[(]" "[^)]+" "[)]"  -> (channel IGNORED_MACROS))
  (define-lexer TVOS_PROHIBITED          "|__TVOS_PROHIBITED|"                   -> (channel IGNORED_MACROS))

  ; Identifier

  (define-lexer IDENTIFIER               Letter LetterOrDec*)

  ; Separators

  (define-token LP                       "[(]")
  (define-token RP                       "[)]")
  (define-token LBRACE                   "[{]")
  (define-token RBRACE                   "[}]")
  (define-token LBRACK                   "[[]")
  (define-token RBRACK                   "[]]")
  (define-token SEMI                     "[;]")
  (define-token COMMA                    "[,]")
  (define-token DOT                      "[.]")
  (define-token STRUCTACCESS             "[-][>]")
  (define-token AT                       "[@]")

  ; Operators

  (define-token ASSIGNMENT               "[=]")
  (define-token GT                       "[>]")
  (define-token LT                       "[<]")
  (define-token BANG                     "[!]")
  (define-token TILDE                    "[~]")
  (define-token QUESTION                 "[?]")
  (define-token COLON                    "[:]")
  (define-token EQUAL                    "[=][=]")
  (define-token LE                       "[<][=]")
  (define-token GE                       "[>][=]")
  (define-token NOTEQUAL                 "[!][=]")
  (define-token AND                      "[&][&]")
  (define-token OR                       "[|][|]")
  (define-token INC                      "[+][+]")
  (define-token DEC                      "[-][-]")
  (define-token ADD                      "[+]")
  (define-token SUB                      "[-]")
  (define-token MUL                      "[*]")
  (define-token DIV                      "[/]")
  (define-token BITAND                   "[&]")
  (define-token BITOR                    "[|]")
  (define-token BITXOR                   "[^]")
  (define-token MOD                      "[%]")

  ; Assignments

  (define-token ADD_ASSIGN               "[+][=]")
  (define-token SUB_ASSIGN               "[-][=]")
  (define-token MUL_ASSIGN               "[*][=]")
  (define-token DIV_ASSIGN               "[/][=]")
  (define-token AND_ASSIGN               "[&][=]")
  (define-token OR_ASSIGN                "[|][=]")
  (define-token XOR_ASSIGN               "[^][=]")
  (define-token MOD_ASSIGN               "[%][=]")
  (define-token LSHIFT_ASSIGN            "[<][<][=]")
  (define-token RSHIFT_ASSIGN            "[>][>][=]")
  (define-token ELIPSIS                  "[.][.][.]")

  ; Literals

  (define-lexer CHARACTER_LITERAL        "'" (EscapeSequence | "[^'\\]") "'")
  (define-lexer STRING_START             StringStart -> (mode STRING_MODE))

  (define-lexer HEX_LITERAL              "0" [xX] HexDigit+ IntegerTypeSuffix\?)
  (define-lexer OCTAL_LITERAL            "0" [0-7]+ IntegerTypeSuffix\?)
  (define-lexer BINARY_LITERAL           "0" [bB] [01]+ IntegerTypeSuffix\?)
  (define-lexer DECIMAL_LITERAL          [0-9]+ IntegerTypeSuffix\?)


  (define-lexer FLOATING_POINT_LITERAL
            (Dec+ "[.]" Dec* | "[.]" Dec+) Exponent\? FloatTypeSuffix\?
            | Dec+ (Exponent FloatTypeSuffix\? | FloatTypeSuffix))
                          

  ; Comments and whitespaces

  (define-lexer WS                       Ws+             -> channel(HIDDEN))
  (define-lexer MULTI_COMMENT            "[/][*]" ANY "[*][/]" -> channel(COMMENTS_CHANNEL))
  (define-lexer SINGLE_COMMENT           "//" "[^\r\n]*" -> channel(COMMENTS_CHANNEL))
  (define-lexer BACKSLASH                "\\"            -> channel(HIDDEN))

  (define-lexer SHARP                    "#"             -> channel(DIRECTIVE_CHANNEL)  mode(DIRECTIVE_MODE))

  (define-lexer-mode STRING_MODE
    (define-lexer STRING_NEWLINE   "\\" "\r?" "\n"         -> channel(DEFAULT_TOKEN_CHANNEL))
    (define-lexer STRING_ESCAPE    EscapeSequence          -> channel(DEFAULT_TOKEN_CHANNEL) type(STRING_VALUE))
    (define-lexer STRING_END       "\""                     -> channel(DEFAULT_TOKEN_CHANNEL) mode(DEFAULT_MODE))
    (define-lexer STRING_VALUE     "[^\"\\]+"                 -> channel(DEFAULT_TOKEN_CHANNEL)))
  

  (defconst Dec "[0-9]")

  (defconst Ascii "[A-Za-z_]")

  (defconst EOL "$")

  (defconst Letter
    '(&or
       Ascii
       EOL
      "[^\u0000-\u00FF\uD800-\uDBFF]"
      "[\uD800-\uDBFF][\uDC00-\uDFFF]"
      "[\u00E9]"))

  (defconst LetterOrDec
    '(&or Letter Dec))

  
  (defconst IntegerTypeSuffix '(&and "[uUlL]" ("[uUlL]" \?) ("[uUlL]" \?)))
  (defconst Exponent          '(&and "[eE]" "[+-]?" Dec+))
  (defconst Dec               "[0-9]")
  (defconst FloatTypeSuffix   "[fFdD]")
  (defconst StringStart       '(&or (&and (&or "L" "@") (Ws *) "\"") "\""))

    
  (defconst EscapeSequence
      '(&or
         (&and "\\" (&or "b" "t" "n" "f" "r" "\"" "'" "\\"))
         OctalEscape
         UnicodeEscape))
      
  (defconst OctalEscape
      '(&or
          (&and "\\" "[0-3]" "[0-7]" "[0-7]")
          (&and "\\" "[0-7]" "[1-7]")
          (&and "\\" "[0-7]")))

  (defconst UnicodeEscape
    '(&and "\\" "u" HexDigit HexDigit HexDigit HexDigit))

  (defconst HexDigit
    "[0-9a-fA-F]")

  (defconst ANY "\\(?:.\\|[\r\n]\\)")
  (defconst Ws "[ \r\n\t\u000C]")
  (defconst A "[aA]")
  (defconst B "[bB]")
  (defconst C "[cC]")
  (defconst D "[dD]")
  (defconst E "[eE]")
  (defconst F "[fF]")
  (defconst G "[gG]")
  (defconst H "[hH]")
  (defconst I "[iI]")
  (defconst J "[jJ]")
  (defconst K "[kK]")
  (defconst L "[lL]")
  (defconst M "[mM]")
  (defconst N "[nN]")
  (defconst O "[oO]")
  (defconst P "[pP]")
  (defconst Q "[qQ]")
  (defconst R "[rR]")
  (defconst S "[sS]")
  (defconst T "[tT]")
  (defconst U "[uU]")
  (defconst V "[vV]")
  (defconst W "[wW]")
  (defconst X "[xX]")
  (defconst Y "[yY]")
  (defconst Z "[zZ]")



  (define-global objc-parse-header (path)
    (with-current-buffer (get-buffer-create "*Objc*")
      (save-excursion
        (insert (read-file path)))
      (current-buffer)))

  (defvar objc-test-frameworks
    '(AVFoundation Accounts ApplicationServices CFNetwork CarPlay ClassKit
      Contacts ContactsUI CoreBluetooth CoreGraphics CoreLocation CoreML
      CoreMedia CoreSpotlight CoreTelephony CoreText CoreVideo DeviceCheck
      FileProvider FileProviderUI Foundation GLKit GameController HomeKit
      IOSurface IdentityLookup ImageIO Intents MPSNeuralNetwork
      MultipeerConnectivity NaturalLanguage NotificationCenter OpenGLES
      PDFKit PhotosUI QuartzCore QuickLookSupport Security Social
      SystemConfiguration VideoSubscriberAccount WatchKit WebKit))

  (define-global objc-test ()
    (step name objc-test-frameworks
      (let path (objc-resolve-framework (str name))
        (print (str (list name path))))))
 
)
