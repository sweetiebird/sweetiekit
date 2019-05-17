//
// import {
//   CellForRowFn,
//   Color,
//   Completion,
//   CoreAnimation,
//   CoreGraphics,
//   NumberRowsFn,
//   ObjC,
//   Optional,
//   Rect
//   // @ts-ignore
// } from "../index.d.ts";
//
//   export enum UIControlState {
//     normal = 'normal',
//     highlighted = 'highlighted',
//     disabled = 'disabled',
//     selected = 'selected',
//     focused = 'focused',
//     application = 'application',
//   }
//
//   export enum UIControlEvent {
//     touchDown = 'touchDown',
//     touchUpInside = 'touchUpInside',
//     touchCancel = 'touchCancel',
//   }
//
//   export class UIResponder extends ObjC.NSObject {
//
//   }
//
//   export class UIView extends UIResponder {
//     constructor(frame: CoreGraphics.CGRect);
//     constructor(frame: Rect);
//     constructor(x: number, y: number, width: number, height: number);
//
//     layer: CoreAnimation.CALayer;
//     frame: Rect;
//     autoresizesSubviews: Boolean;
//     subviews: UIView[];
//     backgroundColor: UIColor;
//
//     width: number;
//     height: number;
//
//     addSubview(subview: UIView): void;
//
//     sizeThatFits(size: CoreGraphics.CGSize): CoreGraphics.CGSize;
//
//     sizeToFit(): void;
//
//     viewWithStringTag(tag: string): Optional<UIView>;
//   }
//
//   export class UIColor extends ObjC.NSObject {
//     constructor(color: Color);
//
//     red: number;
//     green: number;
//     blue: number;
//     alpha?: number;
//   }
//
//   export class UIWindow extends UIView {
//     setRootViewController(vc: UIViewController): void;
//   }
//
//   export class UIApplication extends UIResponder {
//     keyWindow: UIWindow;
//   }
//
//   export class UIImagePickerControllerDelegate extends ObjC.NSObject {
//     result: Optional<UIImage>;
//
//     onInfo: Function;
//
//     onCancel(picker: UIImagePickerController): void;
//   }
//
//   export class UITableViewDataSource extends ObjC.NSObject {
//     numberOfRowsInSection: NumberRowsFn
//     cellForRowAt: CellForRowFn;
//   }
//
//   export class UITextFieldDelegate extends ObjC.NSObject {
//   }
//
//   export class UIStoryboard extends ObjC.NSObject {
//     constructor(name: string);
//
//     instantiateViewController(identifier: string): UIViewController;
//   }
//
//   export class UIViewController extends UIResponder {
//     view: UIView;
//
//     present(viewController: UIViewController, animated: Boolean, completion: Completion): void;
//
//     dismiss(animated: Boolean, completion: Completion): void;
//   }
//
//   export class UITabBarController extends UIViewController {
//     setViewControllers(viewControllers: UIViewController[], animated: Boolean): void;
//   }
//
//   export class UITableViewController extends UIViewController {
//     tableView: UITableView;
//   }
//
//   export class UINavigationController extends UIViewController {
//     constructor(viewController: UIViewController);
//
//     pushViewController(viewController: UIViewController, animated: Boolean): void;
//
//     popViewController(animated: Boolean): Optional<UIViewController>;
//
//     popToRootViewController(animated: Boolean): Optional<UIViewController[]>;
//
//     popToViewController(animated: Boolean): Optional<UIViewController[]>;
//
//     setViewControllers(viewControllers: UIViewController[], animated: Boolean): void;
//   }
//
//   export class UIImagePickerController extends UIViewController {
//     delegate: Optional<UIImagePickerControllerDelegate>;
//   }
//
//   export class UIButton extends UIView {
//     static alloc(
//       title: string,
//       x: number,
//       y: number,
//       width: number,
//       height: number,
//       callback: Function,
//     ): UIButton;
//
//     title: string;
//
//     callback: Completion;
//
//     // @ts-ignore
//     addTarget(
//       target: Optional<any>,
//       selector: Function,
//       controlEvents: UIControlEvent[] | UIControlEvent,
//     ): void;
//   }
//
//   export class UITextField extends UIView {
//     static alloc(x: number, y: number, width: number, height: number, callback: Function): UITextField;
//
//     text: Optional<string>;
//     delegate: Optional<UITextFieldDelegate>;
//     callback: Completion;
//   }
//
//   export class UIImageView extends UIView {
//     constructor(image: Optional<UIImage>, highlightedImage: Optional<UIImage>);
//     constructor(image: Optional<UIImage>);
//     constructor(frame: CoreGraphics.CGRect);
//     constructor(frame: Rect);
//
//     image: Optional<UIImage>;
//   }
//
//   export class UILabel extends UIView {
//     static alloc(x: number, y: number, width: number, height: number): UILabel;
//
//     text: string;
//   }
//
//   export class UITableView extends UIView {
//     dataSource: Optional<UITableViewDataSource>;
//     refreshControl: Optional<UIRefreshControl>;
//
//     rowHeight: number;
//     estimatedRowHeight: number;
//
//     reloadData(): void;
//   }
//
//   export class UITableViewCell extends UIView {
//     textLabel: Optional<UILabel>;
//     detailTextLabel: Optional<UILabel>;
//   }
//
//   export class UIControl extends UIView {
//     state: UIControlState;
//     isSelected: Boolean;
//     isEnabled: Boolean;
//     isHighlighted: Boolean;
//     isTracking: Boolean;
//     isTouchInside: Boolean;
//   }
//
//   export class UIRefreshControl extends UIControl {
//     static alloc(): UIRefreshControl;
//
//     addTargetFor(table: UITableView, callback: Function): void;
//
//     endRefreshing(): void;
//   }
//
//   export class UIImage extends ObjC.NSObject {
//     constructor(name: string);
//   }
//
