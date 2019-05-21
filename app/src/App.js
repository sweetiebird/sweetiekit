import React from 'react';
const e = React.createElement;
import { hot } from 'react-hot-loader';
const SweetieKit = Require('std:sweetiekit.node');

const { UIControlState, UIControlEvents } = Require('../enums');
const colors = Require('../colors');

const {
  UIButton,
  UIImage,
  UIView,
  UIImageView,
} = SweetieKit;

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

class App extends React.Component {
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
    console.log('app handleButtonClick');
    const { isDarkTheme } = this.state;
    this.setState({ isDarkTheme: !isDarkTheme });
  }

  render() {
    console.log('app render');
    const { vc } = this.props;
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

    const button = e(Button, {
      isDarkTheme,
      onClick: this.handleButtonClick,
      key: 'btn',
    });

    return e(FullScreenView, {
      isDarkTheme,
      superview: vc.view,
    }, isDarkTheme ? [imageView, button] : [button]);
  }
}

console.log(colors);

export default hot(module)(App);
