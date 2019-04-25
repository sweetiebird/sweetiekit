"use strict";
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
// @ts-ignore
const Sweetiekit = __importStar(require("std:sweetiekit.node"));
const { UIKit, CGRect, ObjC } = Sweetiekit;
let app = new UIKit.UIApplication();
let vc = new UIKit.UIViewController();
let view = new UIKit.UIView();
let button = UIKit.UIButton.alloc('title', 0, 0, 0, 0, () => { });
console.log(vc, view, button);
//# sourceMappingURL=index.js.map