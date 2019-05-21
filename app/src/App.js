import React from 'react';
const e = React.createElement;
import { hot } from 'react-hot-loader';
const SweetieKit = Require('std:sweetiekit.node');

const { UIControlState, UIControlEvents } = Require('../enums');
const colors = Require('../colors');
colors.red = {red: 1, green: 0, blue: 0};
colors.green = {red: 0, green: 1, blue: 0};
colors.blue = {red: 0, green: 0, blue: 1};
colors.magenta = {red: 1, green: 0, blue: 1};
colors.yellow = {red: 1, green: 1, blue: 0};

const {
  UIButton,
  UIImage,
  UIView,
  UIImageView,
} = SweetieKit;

class Responder extends React.Component {
  componentDidMount() {
  }
  componentDidUpdate(prevProps) {
  }
  componentWillUnmount() {
  }
  create() {
  }

  configure() {
  }

  dispose() {
  }
}

class View extends Responder {

  static UIProps(props) {
    let r = {};
    for (let k in props) {
      if (k == "frame" ||
        k == "backgroundColor" ||
        k == "width" ||
        k == "height" ||
        k == "center")
      {
        r[k] = props[k];
      }
    }
    return r;
  }

  componentDidMount() {
    super.componentDidMount();
    console.log('View componentDidMount');
    this.configure();
  }

  componentDidUpdate(prevProps) {
    super.componentDidUpdate(prevProps);
    console.log('View componentDidUpdate', this.props, prevProps);
    this.configure();
  }

  componentWillUnmount() {
    try {
      console.log('View componentWillUnmount');
      this.dispose();
    } finally {
      super.componentWillUnmount();
    }
  }

  create() {
    let el = super.create();
    if (el) {
      return el;
    }
    const { superview, children } = this.props;
    if (superview) {
      return new UIView(superview.frame);
    }
  }

  configure() {
    super.configure();
    const { superview, children } = this.props;
    console.log('View.configure', superview != null);
    if (!superview) {
      return;
    }

    /*
    let src;
    React.Children.forEach(children, (child) => {
      if (child.props.isSelected) {
        src = child;
      }
    });
    */
    let el = this.props.el ? this.props.el.handle : this.el;
    if (!el) {
      el = this.create();
      if (el) {
        if (this.props.el) {
          this.props.el.handle = el;
        } else {
          console.log('Warning: expected this.props.el to be an object');
          this.el = el;
        }
        superview.addSubview(el);
      }
    }
    if (el) {
      /*
      console.log('setting image', src.props, Image.el(src));
      if (!this.el) {
        this.el = new UIImageView(Image.el(src));
        superview.addSubview(this.el);
      }
      this.el.image = Image.el(src);
      this.el.frame = superview.frame;
      this.el.width /= 3;
      this.el.height /= 3;
      this.el.backgroundColor = colors.clear;
      */
      Object.assign(el, View.UIProps(this.props));
    }
  }

  dispose() {
    try {
      console.log('View dispose');
      if (this.el) {
        console.log('View dispose this.el');
        this.el.removeFromSuperview();
        console.log('View dispose this.el done');
        delete this.el;
      }
      if (this.props.el) {
        console.log('View dispose this.props.el');
        if (this.props.el.handle) {
          console.log('View dispose this.props.el.handle');
          this.props.el.handle.removeFromSuperview();
          console.log('View dispose this.props.el.handle done');
          delete this.props.el.handle;
        }
      }
    } finally {
      super.dispose();
    }
  }

  render() {
    return e('div', {className: 'view'}, this.props.children);
  }
}

class Button extends React.Component {
  componentDidMount() {
    const { superview, onClick } = this.props;
    const w = superview.frame.width;
    this.el = new UIButton({ x: 12, y: 80, width: w - 24, height: 50 });
    this.el.backgroundColor = { red: 87/255, green: 174/255, blue: 176/255 };
    this.el.layer.cornerRadius = 4;
    this.el.layer.shadowRadius = 12;
    this.el.layer.shadowColor = { red: 87/255, green: 174/255, blue: 176/255 };
    this.el.layer.shadowOffset = { width: 0, height: 12 };
    this.el.setTitleForState('Toggle Me', UIControlState.normal);
    this.el.addTarget(onClick, UIControlEvents.touchUpInside);
    superview.addSubview(this.el);
  }

  componentDidUpdate(prevProps) {
    const { isDarkTheme } = this.props;
    const { isDarkTheme: wasDarkTheme } = prevProps;
    if (isDarkTheme !== wasDarkTheme) {
      if (isDarkTheme) {
        this.el.titleLabel.textColor = colors.white;
        this.el.backgroundColor = colors.fitbodMedGrey;
      } else {
        this.el.titleLabel.textColor = colors.fitbodDarkGrey;
        this.el.backgroundColor = colors.fitbodPink;
      }
    }
  }

  componentWillUnmount() {
    this.el.removeFromSuperview();
  }

  render() {
    return (<button></button>);
  }
}

class FullScreenView extends React.Component {
  componentWillMount() {
    const { superview, isDarkTheme } = this.props;
    this.el = new UIView({ x: 0, y: 0, width: superview.frame.width, height: superview.frame.height });
    if (isDarkTheme) {
      this.el.backgroundColor = colors.fitbodDarkGrey;
    } else {
      this.el.backgroundColor = colors.white;
    }
    superview.addSubview(this.el);
  }

  componentWillUnmount() {
    this.el.removeFromSuperview();
    delete this.el;
  }

  componentDidUpdate(prevProps) {
    const { isDarkTheme } = this.props;
    const { isDarkTheme: wasDarkTheme } = prevProps;
    if (isDarkTheme !== wasDarkTheme) {
      if (isDarkTheme) {
        this.el.backgroundColor = colors.white;
      } else {
        this.el.backgroundColor = colors.white;
      }
    }
  }

  render() {
    const { children, isDarkTheme, onButtonClick } = this.props;

    const newChildren = React.Children.map(children, (child, idx) => {
      return React.cloneElement(child, {
        ...child.props,
        superview: this.el,
      });
    });

    return newChildren;
    // return e(Button, {
    //   superview: this.el,
    //   isDarkTheme,
    //   onClick: onButtonClick,
    // });
  }
}

class Image extends React.PureComponent {
  constructor(props) {
    super(props);
    const { el } = this.props;
    if (!el) {
      throw new Error("expected el to be a container");
    }
  }

  componentDidUpdate() {
    const { source, el } = this.props;
    delete el.handle;
    el.handle = new UIImage(source);
  }

  static el(me) {
    const { source, el } = me.props;
    if (!el.handle) {
      el.handle = new UIImage(source);
    }
    return el.handle;
  }

  render() {
    return (<span></span>);
  }
}

class ImageView extends React.Component {
  componentDidMount() {
    console.log('ImageView componentDidMount');
    this.configure();
  }

  componentDidUpdate(prevProps) {
    console.log('ImageView componentDidUpdate');
    this.configure();
  }

  componentWillUnmount() {
    console.log('ImageView componentWillUnmount');
    this.dispose();
  }

  configure() {
    const { superview, children, isDarkView } = this.props;
    let src;
    React.Children.forEach(children, (child) => {
      if (child.props.isSelected) {
        src = child;
      }
    });
    if (src) {
      console.log('setting image', src.props, Image.el(src));
      if (!this.el) {
        this.el = new UIImageView(Image.el(src));
        superview.addSubview(this.el);
      }
      this.el.image = Image.el(src);
      this.el.frame = superview.frame;
      this.el.width /= 3;
      this.el.height /= 3;
      this.el.backgroundColor = colors.clear;
    }
  }

  dispose() {
    console.log('ImageView dispose');
    if (this.el) {
      this.el.removeFromSuperview();
      delete this.el;
    }
  }

  render() {
    return e('image');
  }
}

class MyApp extends React.Component {
  constructor(props) {
    console.log('app constructor ', props);
    super(props);
    this.state = {
      isDarkTheme: false,
    };
    this.handleButtonClick = this.handleButtonClick.bind(this);
  }

  componentDidMount() {
    console.log('app componentDidMount');
    const { nav, vc } = this.props;
    nav.pushViewController(vc);
  }

  componentWillUnmount() {
    console.log('app componentWillUnmount');
    //this.el.removeFromSuperview();
    //delete this.el;
  }

  handleButtonClick() {
    console.log('app  handleButtonClick');
    const { isDarkTheme } = this.state;
    this.setState({ isDarkTheme: !isDarkTheme });
  }

  componentDidUpdate() {
    console.log(document);
  }

  render() {
    const { vc } = this.props;
    console.log('app render', (vc != null));
    if (!vc) {
      return null;
    }
    const view = vc.view;
    const { isDarkTheme } = this.state;

    const img = e(Image, {
      source: isDarkTheme ? 'truck' : 'laarc',
      isSelected: true,
      el: {},
    });

    const imageView = e(ImageView, {
      isDarkTheme,
      key: 'img-view',
    }, img);

    this.viewEl = this.viewEl || {};

    return (
        <FullScreenView
            isDarkTheme={isDarkTheme}
            superview={view}>

          <View
            el={this.viewEl}
            key={'view'}
            superview={view}
            width={view.width/7}
            height={view.height/7}
            
            backgroundColor={colors.blue}
          >
          </View>
           

          <Button
            isDarkTheme={isDarkTheme}
            onClick={this.handleButtonClick}
            key={'btn'}
           />

          {isDarkTheme ? [imageView] : [imageView]}
        </FullScreenView>
      );
  }
}
class App extends React.Component {
  render() {
    return e(MyApp, this.props, this.props.children);
  }
}

console.log(colors);

export default hot(module)(App);
