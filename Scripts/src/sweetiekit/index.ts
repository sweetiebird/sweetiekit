
// @ts-ignore
import {ObjC} from "./index";
import NSIndexPath = ObjC.NSIndexPath;
import * as UIKit from './UIKit'

export { UIKit }

// @ts-ignore
export * from "./index.d.ts"
// export * from "./UIKit";
// export import ObjC = require("./ObjC");
// export import CoreAnimation = require("./CoreAnimation");
// export import CoreGraphics = require("./CoreGraphics");


// export import UIKit = require("./UIKit");

// export UIKit;


// export * from "./index.d.ts";
// // import {
// //   NSObject,
// //   NSUserDefaults,
// //   UIApplication,
// //   UIWindow,
// //   UIStoryboard,
// //   UIViewController,
// //   UIView,
// //   UIButton,
// //   UITextField,
// //   UITabBarController,
// //   UIImage,
// //   UIImageView,
// //   UILabel,
// //   UINavigationController,
// //   UIImagePickerController,
// //   UIImagePickerControllerDelegate,
// //   UITableView,
// //   UITableViewDataSource,
// //   UITableViewCell,
// //   UIRefreshControl,
// //   CALayer,
// //   // @ts-ignore
// // } from './native-bindings'
// //
// // export const UIKit = {
// //   UIApplication,
// //   UIWindow,
// //   UIStoryboard,
// //   UIViewController,
// //   UIView,
// //   UIButton,
// //   UITextField,
// //   UITabBarController,
// //   UIImage,
// //   UIImageView,
// //   UILabel,
// //   UINavigationController,
// //   UIImagePickerController,
// //   UIImagePickerControllerDelegate,
// //   UITableView,
// //   UITableViewDataSource,
// //   UITableViewCell,
// //   UIRefreshControl,
// // };
// //
// // export const ObjC = {
// //   NSObject,
// //   NSUserDefaults,
// // };
// //
// // export const CoreAnimation = {
// //   CALayer,
// // };
// //
// //
// // // @ts-ignore
// // export { IndexPath as Foo } from "std:sweetiekit.node";
// //
// // export const UIKit =
// // { UIApplication,
// //     UIWindow,
// //     UIStoryboard,
// //     UIViewController,
// //     UIView,
// //     UIButton,
// //     UITextField,
// //     UITabBarController,
// //     UIImage,
// //     UIImageView,
// //     UILabel,
// //     UINavigationController,
// //     UIImagePickerController,
// //     UIImagePickerControllerDelegate,
// //     UITableView,
// //     UITableViewDataSource,
// //     UITableViewCell,
// //     UIRefreshControl
// // };
// // export type Optional<T> = T | null;
// // export type DelegateGet<T1, T2, T3> = (arg0: T2, arg1: T2) => T3;
// // export type DelegateGet3<T1, T2, T3, T4> = (arg0: T2, arg1: T2, arg2: T3) => T4;
// // export type NumberRowsFn = (id: string, section: number) => number;
// // export type CellForRowFn = (id: string, indexPath: IndexPath, cell?: UIKit.UITableViewCell) => UIKit.UITableViewCell;
// // export type Completion = () => void;
// // export type Identifier = string;
// // export type Section = number;
// // export type Row = number;
// // export type Point = { x: number, y: number };
// // export type Size = { width: number, height: number };
// // export type Rect = Size & Point;
// // export type IndexPath = { section: Section, row: Row };
// // export type Color = {
// //   red: number;
// //   green: number;
// //   blue: number;
// //   alpha?: number;
// // };
// // // // import * from 'std:sweetiekit.node'
// // // import {UIApplication} from "std:sweetiekit.node";
// // //
// // // export const UIKit = { UIApplication }
//
//
// /// <reference path="index.d.ts" />
//
// // @ts-ignore
// import * as SweetieKit from 'std:sweetiekit.node'
// // export * from 'std:sweetiekit.node'
// // import {UIKit} from "std:sweetiekit";
// // import UIApplication = UIKit.UIApplication;
//
//
//

// //
// // export type Optional<T> = T | null;
// // export type DelegateGet<T1, T2, T3> = (arg0: T2, arg1: T2) => T3;
// // export type DelegateGet3<T1, T2, T3, T4> = (arg0: T2, arg1: T2, arg2: T3) => T4;
// // export type NumberRowsFn = (id: string, section: number) => number;
// // export type CellForRowFn = (id: string, indexPath: IndexPath, cell?: UIKit.UITableViewCell) => UIKit.UITableViewCell;
// // export type Completion = () => void;
// // export type Identifier = string;
// // export type Section = number;
// // export type Row = number;
// // export type Point = { x: number, y: number };
// // export type Size = { width: number, height: number };
// // export type Rect = Size & Point;
// // export type IndexPath = { section: Section, row: Row };
// // export type Color = {
// //   red: number;
// //   green: number;
// //   blue: number;
// //   alpha?: number;
// // };
//
// //@ts-ignore
// // import * as SweetieKit from "std:sweetiekit.node";
//
// // export default SweetieKit;
//
// // export const UIKit =
// // { UIApplication,
// //     UIWindow,
// //     UIStoryboard,
// //     UIViewController,
// //     UIView,
// //     UIButton,
// //     UITextField,
// //     UITabBarController,
// //     UIImage,
// //     UIImageView,
// //     UILabel,
// //     UINavigationController,
// //     UIImagePickerController,
// //     UIImagePickerControllerDelegate,
// //     UITableView,
// //     UITableViewDataSource,
// //     UITableViewCell,
// //     UIRefreshControl
// // };
//
// //
// //  export namespace UIKit {
// //   export const {
// //     UIApplication, UIButton, UIImage, UIImagePickerController, UIImagePickerControllerDelegate, UIImageView,
// //     UILabel, UINavigationController, UIRefreshControl,
// //     UIStoryboard,
// //     UITabBarController, UITableView,
// //     UITableViewCell, UITableViewDataSource, UITextField,
// //     UIView,
// //     UIViewController, UIWindow
// //   } = require('std:sweetiekit.node');
// // }

// @ts-ignore
// import * as SweetieKit from 'std:sweetiekit.node';
//
// module UIKit {
//   export * from './UIKit'
// }

//
// for (let k of Object.keys(SweetieKit)) {
//   if (k.startsWith("UI")) {
//     exports.UIKit[k] = SweetieKit[k];
//   }
// }

//
//
// export type IndexPath = NSIndexPath
// export namespace UIKit {
//
//   const {
// // @ts-ignore
//     UIApplication,
// // @ts-ignore
//     UIButton,
// // @ts-ignore
//     UIColor,
// // @ts-ignore
//     UIControl,
// // @ts-ignore
//     UIImage,
// // @ts-ignore
//     UIImagePickerController,
// // @ts-ignore
//     UIImagePickerControllerDelegate,
// // @ts-ignore
//     UIImageView,
// // @ts-ignore
//     UILabel,
// // @ts-ignore
//     UINavigationController,
// // @ts-ignore
//     UIRefreshControl,
// // @ts-ignore
//     UIResponder,
// // @ts-ignore
//     UIStoryboard,
// // @ts-ignore
//     UITabBarController,
// // @ts-ignore
//     UITableView,
// // @ts-ignore
//     UITableViewCell,
// // @ts-ignore
//     UITableViewController,
// // @ts-ignore
//     UITableViewDataSource,
// // @ts-ignore
//     UITextField,
// // @ts-ignore
//     UITextFieldDelegate,
// // @ts-ignore
//     UIView,
// // @ts-ignore
//     UIViewController,
// // @ts-ignore
//     UIWindow,
// // @ts-ignore
//   } = UIKit;
//   // // @ts-ignore
//   // export * from './UIKit'
// }
