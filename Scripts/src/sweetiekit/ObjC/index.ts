/// <reference path="../index.d.ts" />
// import {IndexPath, Row, Section} from "../index";

// @ts-ignore
import {IndexPath, Section, Row} from "../index.d.ts";

// @ts-ignore
import * as SweetieKit from 'std:sweetiekit.node';
for (let k of Object.keys(SweetieKit)) {
  if (k.startsWith("NS")) {
    // @ts-ignore
    exports[k] = SweetieKit[k];
  }
}
//
// declare module "sweetiekit/ObjC" {
//   export class NSObject {
//   }
//
//   export class NSIndexPath extends NSObject implements IndexPath {
//     constructor(indexPath: IndexPath);
//
//     section: Section;
//     row: Row;
//   }
//
//   export class NSUserDefaults extends NSObject {
//     synchronize(): void;
//
//     setValueForKey(value: any, key: string): void;
//
//     objectForKey(key: string): Object;
//
//     stringForKey(key: string): string;
//   }
// }
export default exports
