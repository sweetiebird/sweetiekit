// @ts-ignore
import {Point, Size} from "../index.d.ts";

// @ts-ignore
import * as SweetieKit from 'std:sweetiekit.node';
for (let k of Object.keys(SweetieKit)) {
  if (k.startsWith("CG")) {
    // @ts-ignore
    exports[k] = SweetieKit[k];
  }
}
//
// declare module "sweetiekit/CoreGraphics" {
//   export class CGSize implements Size {
//     constructor(size: Size);
//
//     width: number;
//     height: number;
//   }
//
//   export class CGRect implements Size {
//     constructor(x: number, y: number, width: number, height: number);
//
//     origin: Point;
//     center: Point;
//     size: CGSize;
//     width: number;
//     height: number;
//     minX: number;
//     minY: number;
//     maxX: number;
//     maxY: number;
//   }
// }
