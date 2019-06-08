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
Object.getOwnPropertyNames(SweetieKit)
  .filter(x => ["AR", "AV", "CA", "CL", "MK", "NS", "RP", "SCN", "SK", "UI", "WK", "MP"]
                 .filter(y => x.startsWith(y))
                 .length > 0)
  .sort()
  .forEach(x => {
    console.log(x);
    BindClass(SweetieKit[x]);
    global[x] = SweetieKit[x];
   });

global.id = SweetieKit.id;

// gc periodically
setInterval(() => {
  gc();
}, 1000);
require('./uidemos');
