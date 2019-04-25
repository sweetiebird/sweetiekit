type Optional<T> = T | null;
type DelegateGet<T1, T2, T3> = (arg0: T2, arg1: T2) => T3;
type Completion = () => void;
type Identifier = string;
type Section = number;
type Row = number;
type Point = { x: number, y: number };
type Size = { width: number, height: number };
type Rect = Size & Point;
type IndexPath = { section: Section, row: Row };
type Color = {
  red: number;
  green: number;
  blue: number;
  alpha: number;
};

declare module Sweetiekit {
  export namespace CoreGraphics {
    export class CGSize implements Size {
      constructor(size: Size);

      width: number;
      height: number;
    }

    export class CGRect implements Size {
      constructor(x: number, y: number, width: number, height: number);

      origin: Point;
      center: Point;
      size: CGSize;
      width: number;
      height: number;
      minX: number;
      minY: number;
      maxX: number;
      maxY: number;
    }
  }

  export namespace ObjC {
    export class NSObject {}

    export class NSIndexPath extends NSObject implements IndexPath {
      constructor(indexPath: IndexPath);

      section: Section;
      row: Row;
    }

    export class NSUserDefaults extends NSObject {
      synchronize(): void;
      setValueForKey(value: any, key: string): void;
      objectForKey(key: string): Object;
      stringForKey(key: string): string;
    }
  }

  export namespace CoreAnimation {
    export class CALayer extends ObjC.NSObject {
      cornerRadius: number;
      borderWidth: number;
      shadowRadius: number;

      shadowOffset: Size;
      shadowColor: UIKit.UIColor;
    }
  }

  export namespace UIKit {
    export enum UIControlState {
      normal = 'normal',
      highlighted = 'highlighted',
      disabled = 'disabled',
      selected = 'selected',
      focused = 'focused',
      application = 'application',
    }

    export enum UIControlEvent {
      touchDown = 'touchDown',
      touchUpInside = 'touchUpInside',
      touchCancel = 'touchCancel',
    }

    export class UIColor extends ObjC.NSObject implements Color {
      constructor(color: Color);

      red: number;
      green: number;
      blue: number;
      alpha: number;
    }

    export class UIResponder extends ObjC.NSObject {

    }

    export class UIWindow extends UIView {
      setRootViewController(vc: UIViewController): void;
    }

    export class UIApplication extends UIResponder {
      keyWindow: UIWindow;
    }

    export class UIImagePickerControllerDelegate extends ObjC.NSObject {
      result: Optional<UIImage>;

      onInfo: Function;
      onCancel: Function;
    }

    export class UITableViewDataSource extends ObjC.NSObject {
      numberOfRowsInSection: DelegateGet<Identifier, Section, number>;
      cellForRowAt: DelegateGet<Identifier, ObjC.NSIndexPath, UITableViewCell>;
    }

    export class UITextFieldDelegate extends ObjC.NSObject {}

    export class UIStoryboard extends ObjC.NSObject {
      constructor(name: string);

      instantiateViewController(identifier: string): UIViewController;
    }

    export class UIViewController extends UIResponder {
      view: UIView;

      present(viewController: UIViewController, animated: Boolean, completion: Completion): void;
      dismiss(animated: Boolean, completion: Completion): void;
    }

    export class UITabBarController extends UIViewController {
      setViewControllers(viewControllers: UIViewController[], animated: Boolean): void;
    }

    export class UITableViewController extends UIViewController {
      tableView: UITableView;
    }

    export class UINavigationController extends UIViewController {
      constructor(viewController: UIViewController);

      pushViewController(viewController: UIViewController, animated: Boolean): void;
      popViewController(animated: Boolean): Optional<UIViewController>;
      popToRootViewController(animated: Boolean): Optional<UIViewController[]>;
      popToViewController(animated: Boolean): Optional<UIViewController[]>;
      setViewControllers(viewControllers: UIViewController[], animated: Boolean): void;
    }

    export class UIImagePickerController extends UINavigationController {
      delegate: Optional<UIImagePickerControllerDelegate>;
    }

    export class UIView extends UIResponder {
      constructor(frame: CoreGraphics.CGRect);
      constructor(frame: Rect);

      layer: CoreAnimation.CALayer;
      frame: Rect;
      autoresizesSubviews: Boolean;
      subviews: UIView[];
      backgroundColor: UIColor;

      addSubview(subview: UIView): void;
      sizeThatFits(size: CoreGraphics.CGSize): CoreGraphics.CGSize;
      sizeToFit(): void;
      viewWithStringTag(tag: string): Optional<UIView>;
    }

    export class UIButton extends UIView {
      static alloc(
        title: string,
        x: number,
        y: number,
        width: number,
        height: number,
        callback: Function,
      ): UIButton;

      title: string;

      callback: Completion;
      // @ts-ignore
      addTarget(
        target: Optional<any>,
        selector: Function,
        controlEvents: UIControlEvent[]|UIControlEvent,
      ): void;
    }

    export class UITextField extends UIView {
      text: Optional<string>;
      delegate: Optional<UITextFieldDelegate>;
      callback: Completion;
    }

    export class UIImageView extends UIView {
      constructor(image: Optional<UIImage>, highlightedImage: Optional<UIImage>);
      constructor(image: Optional<UIImage>);
      constructor(frame: CoreGraphics.CGRect);
      constructor(frame: Rect);

      image: Optional<UIImage>;
    }

    export class UILabel extends UIView {
      static alloc(x: number, y: number, width: number, height: number): UILabel;

      text: string;
    }

    export class UITableView extends UIView {
      dataSource: Optional<UITableViewDataSource>;
      refreshControl: Optional<UIRefreshControl>;

      rowHeight: number;
      estimatedRowHeight: number;

      reloadData(): void;
    }

    export class UITableViewCell extends UIView {
      textLabel: Optional<string>;
      detailTextLabel: Optional<string>;
    }

    export class UIControl extends UIView {
      state: UIControlState;
      isSelected: Boolean;
      isEnabled: Boolean;
      isHighlighted: Boolean;
      isTracking: Boolean;
      isTouchInside: Boolean;
    }

    export class UIRefreshControl extends UIControl {}

    export class UIImage extends ObjC.NSObject {
      constructor(name: string);
    }
  }
}
