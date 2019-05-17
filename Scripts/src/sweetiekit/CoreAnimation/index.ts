// @ts-ignore
import {Point, Size} from "../index.d.ts";
import ObjC from '../ObjC'
import UIKit from '../UIKit'

// @ts-ignore
import * as SweetieKit from 'std:sweetiekit.node';
for (let k of Object.keys(SweetieKit)) {
  if (k.startsWith("CA")) {
    // @ts-ignore
    exports[k] = SweetieKit[k];
  }
}
//
// declare module "sweetiekit/CoreAnimation" {
//   export class CALayer extends ObjC.NSObject {
//     cornerRadius: number;
//     borderWidth: number;
//     shadowRadius: number;
//
//     shadowOffset: Size;
//     shadowColor: UIKit.UIColor;
//   }
// }
export default exports
