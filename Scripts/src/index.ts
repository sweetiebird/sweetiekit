// @ts-ignore
import * as Sweetiekit from 'std:sweetiekit.node';

const { UIKit, CGRect, ObjC } = Sweetiekit;

let app = new UIKit.UIApplication();
let vc = new UIKit.UIViewController();
let view = new UIKit.UIView();

let button = UIKit.UIButton.alloc('title', 0, 0, 0, 0, () => {});

console.log(vc, view, button);
