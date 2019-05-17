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
const SweetieKit = __importStar(require("std:sweetiekit.node"));
const { CALayer, NSObject, NSUserDefaults, UIApplication, UIWindow, UIStoryboard, UIViewController, UIView, UIButton, UITextField, UITabBarController, UIImage, UIImageView, UILabel, UINavigationController, UIImagePickerController, UIImagePickerControllerDelegate, UITableView, UITableViewDataSource, UITableViewCell, UIRefreshControl, } = SweetieKit;
const UIKit = {
    UIApplication,
    UIWindow,
    UIStoryboard,
    UIViewController,
    UIView,
    UIButton,
    UITextField,
    UITabBarController,
    UIImage,
    UIImageView,
    UILabel,
    UINavigationController,
    UIImagePickerController,
    UIImagePickerControllerDelegate,
    UITableView,
    UITableViewDataSource,
    UITableViewCell,
    UIRefreshControl,
};
const ObjC = {
    NSObject,
    NSUserDefaults,
};
const CoreAnimation = {
    CALayer,
};
exports.default = {
    UIKit,
    ObjC,
    CoreAnimation,
};
//# sourceMappingURL=index.js.map