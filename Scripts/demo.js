SweetieKit_verbose = false;
SweetieKit_uncaughtException = (err) => {
  if (SweetieKit_verbose) {
    console.log(`Uncaught exception`, err);
  }
  SweetieKit_uncaughtError = err;
  console.log(err.stack);
}
process.on('uncaughtException', (...args) => {
  SweetieKit_uncaughtException(...args);
});

console.log([].concat(...Object.values(require('os').networkInterfaces()).map(x => { return x.filter(y => y.family === 'IPv4').map(y => y.address); }).filter(x => x.length > 0)));

if (typeof gc === 'undefined') {
  gc = (() => { console.log('gc stub'); });
}
SweetieKit = require('std:sweetiekit.node');


GetterNameToSetterName = function GetterNameToSetterName(name) {
  if (name.startsWith("is")) {
    name = name.substr(2);
  }
  name = 'set' + name[0].toUpperCase() + name.substr(1);
  if (!name.endsWith(":")) {
    name = name + ":";
  }
  return name;
}

GetMethods = function GetMethods(cls) {
  return cls.methods.sort((x, y) => { return (x.name < y.name) ? -1 : 1; })
}

GetBoolAccessors = function GetBoolAccessors(cls) {
  return GetMethods(cls)
          .filter(x => !x.name.startsWith("_"))
          .filter(x => (x.arguments.length === 2) && (x.returnType === "B"));
}

GetBoolSetters = function GetBoolSetters(cls) {
  return GetMethods(cls)
          .filter(x => x.name.startsWith("set") && x.name.endsWith(":"))
          .filter(x => (x.arguments.length === 3) && (x.arguments[2] === "B"));
}

GetVoidMethods = function GetVoidMethods(cls) {
  return GetMethods(cls)
           .filter(x => !x.name.startsWith("_") && !x.name.startsWith("."))
           .filter(x => x.returnType === 'v' && x.arguments.length <= 2);
}

BindClass = function BindClass(nativeType, className = nativeType.name) {
  if (!(nativeType instanceof SweetieKit.id)) {
    return;
  }
  let UIViewClass = SweetieKit.id.classFromString(className);
  if (!UIViewClass) {
    return;
  }
  let UIViewMethods = GetMethods(UIViewClass);
  let UIViewAccessors = GetBoolAccessors(UIViewClass);
  let UIViewSetters = GetBoolSetters(UIViewClass);
  let UIViewVoids = GetVoidMethods(UIViewClass);

  for (let method of UIViewVoids) {
    if (!nativeType.prototype.hasOwnProperty(method.name)) {
      console.log(nativeType, method.name);
      nativeType.prototype[method.name] = function () {
        return this.invoke(["v", method.name]);
      }
    }
  }

  for (let accessor of UIViewAccessors) {
    let getterName = accessor.name;
    let setterName = GetterNameToSetterName(accessor.name);
    let setter = UIViewSetters.find(x => (x.name === setterName));
    //if (!nativeType.prototype.hasOwnProperty(name))
    {
      let name = "get" + accessor.name[0].toUpperCase() + accessor.name.substr(1);
      nativeType.prototype[name] = function () {
        return this.invokeBooleanGetter(accessor.name);
      }
    }
    if (!nativeType.prototype.hasOwnProperty(getterName)) {
      if (setter) {
        Object.defineProperty(nativeType.prototype, getterName, {
          get() {
            return this.invokeBooleanGetter(accessor.name);
          },
          set(value) {
            return this.invokeBooleanSetter(setter.name, !!value);
          },
          enumerable: true,
          configurable: true,
        });
        nativeType.prototype[setterName.substr(0, setterName.length - 1)] = function (value) {
          return this.invokeBooleanSetter(setterName, !!value);
        }
      } else {
        Object.defineProperty(nativeType.prototype, getterName, {
          get() {
            return this.invokeBooleanGetter(accessor.name);
          },
          /*
          set(value) {
            throw new Error(`${className}:${getterName} is read-only`);
          },*/
          enumerable: true,
          configurable: true,
        });
      }
    }
  }
  return nativeType;
}

SweetieKitPrefixes = {
  AR: "ARKit",
  AU: "AudioToolbox",
  AV: "AVFoundation",
  CA: "QuartzCore",
  CG: "CoreGraphics",
  CI: "CoreImage",
  CL: "CoreLocation",
  CM: "CoreMotion",
  CN: "Contacts",
  CV: "CoreVideo",
  EA: "OpenGLES",
  GK: "GameplayKit",
  GLK: "GLKit",
  MDL: "ModelIO",
  MK: "MapKit",
  MP: "MediaPlayer",
  MTK: "MetalKit",
  MTL: "Metal",
  NS: "Foundation",
  nw_: "Network",
  RP: "ReplayKit",
  SCN: "SceneKit",
  Sec: "Security",
  SK: "SpriteKit",
  UI: "UIKit",
  VN: "Vision",
  WK: "WebKit",
};

Object.getOwnPropertyNames(SweetieKit)
  .filter(x => Object.keys(SweetieKitPrefixes)
                 .filter(y => (x.startsWith(y) || x.startsWith("k"+y)))
                 .length > 0)
  .sort()
  .forEach(x => {
    console.log(x);
    //BindClass(SweetieKit[x]);
    global[x] = SweetieKit[x];
   });

global.id = SweetieKit.id;
global.objc = SweetieKit.id;
global.NSClassFromString = objc.NSClassFromString;
global.NSSearchPathForDirectoriesInDomains = objc.NSSearchPathForDirectoriesInDomains;

global.FS = require('fs');
global.Path = require('path');
global.DocumentsPath = objc.NSSearchPathForDirectoriesInDomains(9, 1, true)[0]

global.Require = require;

global.NSMakeRange = (location, length) => {
  return {location, length};
};

global.CGRectMake = (x, y, width, height) => {
  return {x, y, width, height};
};

global.CGPointMake = (x, y) => {
  return {x, y};
};

global.CGPointZero = CGPointMake(0, 0);

global.CGSizeMake = (width, height) => {
  return {width, height};
};

global.CGSizeZero = CGSizeMake(0, 0);

global.UIEdgeInsetsMake = (top, left, bottom, right) => {
  return {top, left, bottom, right};
};

global.UIEdgeInsetsZero = UIEdgeInsetsMake(0, 0, 0, 0);

global.IsUIColor = (x) => {
  return (typeof x === 'object' &&
    typeof x.red === 'number' &&
    typeof x.green === 'number' &&
    typeof x.blue === 'number');
};

global.UIColor = (...args) => {
  let [x, y, z, w] = args;
  switch (args.length) {
    case 0: return { red: 0, green: 0, blue: 0, alpha: 0 };
    case 1: if (IsUIColor(x)) return { ... x };
    case 1: return { red: x, green: x, blue: x };
    case 2: if (IsUIColor(x)) return UIColor(x.red, x.green, x.blue, y);
    case 2: return { red: x, green: x, blue: x, alpha: y };
    case 3: return { red: x, green: y, blue: z };
   default: return { red: x, green: y, blue: z, alpha: w };
  }
};

global.ColorHasAlpha = (color) => {
  return (typeof color === 'object') && (typeof color.alpha === 'number');
}

global.ColorWithAlpha = ({red, green, blue}, alpha) => {
  return { red, green, blue, alpha };
};

global.ColorScaleRGB = (color, mult) => {
  color.red *= mult;
  color.green *= mult;
  color.blue *= mult;
  return color;
};

global.RGB = (...args) => {
  return ColorScaleRGB(UIColor(...args), 1.0 / 255.0);
};

UIColor.black      = UIColor(0);
UIColor.darkGray   = UIColor(1/3);
UIColor.gray       = UIColor(1/2);
UIColor.lightGray  = UIColor(2/3);
UIColor.white      = UIColor(1);
UIColor.clear      = UIColor(UIColor.black, 0.0);

UIColor.red        = UIColor(1, 0, 0);
UIColor.green      = UIColor(0, 1, 0);
UIColor.blue       = UIColor(0, 0, 1);
UIColor.cyan       = UIColor(0, 1, 1);
UIColor.yellow     = UIColor(1, 1, 0);
UIColor.magenta    = UIColor(1, 0, 1);

UIColor.orange     = UIColor(1, 0.5, 0);
UIColor.purple     = UIColor(0.5, 0, 0.5);
UIColor.brown      = UIColor(0.6, 0.4, 0.2);

RGB.clear    = RGB();
RGB.black    = RGB(0);
RGB.white    = RGB(255);
RGB.gray     = RGB(255*Math.pow(0.5, 1/2.2));

RGB.red      = RGB(255, 0, 0);
RGB.green    = RGB(0, 255, 0);
RGB.blue     = RGB(0, 0, 255);
RGB.cyan     = RGB(0, 255, 255);
RGB.yellow   = RGB(255, 255, 0);
RGB.magenta  = RGB(255, 0, 255);

RGB.linkblue = RGB(0, 0, 190);
RGB.orange   = RGB(255, 102, 0);
RGB.darkred  = RGB(180, 0, 0);
RGB.darkblue = RGB(0, 0, 120);

global.SCNVector3Make = (x, y, z) => {
  return {x, y, z};
};

/*
// gc periodically
SweetieKit._gcInterval = setInterval(() => {
  gc();
}, 1000);
 */

uidemos = require('./uidemos');
