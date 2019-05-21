const SweetieKit = require('std:sweetiekit.node');
SweetieKitDom = require('sweetiekit-dom');
SweetieKitDom();

React = window.React = require('react');
ReactDOM = window.ReactDOM = require('react-dom');

const { UIControlState, UIControlEvents } = require('../enums');
const colors = require('../colors');

const {
  UIButton,
  UIImage,
  UIView,
  UIImageView,
} = SweetieKit;

div = document.createElement('div');
div.setAttribute('id', 'app');
document.body.appendChild(div);

const _ui = [];

function PushUI(view) {
  _ui.push(view);
}

function PopUI(view) {
  const view2 = _ui.pop();
  if (view !== view2) {
    throw new Error("Internal error");
  }
}

function WithUI(view, fn) {
  PushUI(view);
  try {
    fn(view);
  } finally {
    PopUI(view);
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
    return React.createElement('button', {}, );
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

  componentDidUpdate(prevProps) {
    const { isDarkTheme } = this.props;
    const { isDarkTheme: wasDarkTheme } = prevProps;
    if (isDarkTheme !== wasDarkTheme) {
      if (isDarkTheme) {
        this.el.backgroundColor = colors.fitbodMedGrey;
      } else {
        this.el.backgroundColor = colors.white;
      }
    }
  }

  componentWillUnmount() {
    this.el.removeFromSuperview();
    delete this.el;
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
    // return React.createElement(Button, {
    //   superview: this.el,
    //   isDarkTheme,
    //   onClick: onButtonClick,
    // });
  }
}

class Image extends React.PureComponent {
  constructor(props) {
    super(props);
    const { source, el } = this.props;
    this.ui = new UIImage(source);
    if (!el) {
      throw new Error("expected el to be a container");
    }
  }

  componentDidUpdate() {
    const { source, el } = this.props;
    delete el.handle;
    el.handle = new UIImage(source);
    this.ui = new UIImage(source);
  }

  static el(me) {
    const { source, el } = me.props;
    if (!el.handle) {
      el.handle = new UIImage(source);
    }
    return el.handle;
  }

  render() {
    return React.createElement('span');
  }
}

class ImageView extends React.Component {
  constructor(props) {
    super(props);
    this.imgRef = React.createRef();
  }

  componentDidMount() {
    const { children, superview } = this.props;
    let src;
    React.Children.forEach(children, (child) => {
      if (child.props.isSelected) {
        src = child;
      }
    });
    if (!src) {
      throw new Error("expected selected image");
    }
    this.el = new UIImageView(Image.el(src));
    this.el.frame = superview.frame;
    this.el.backgroundColor = colors.white;
    console.log('tktk', this.el.frame);
    superview.addSubview(this.el);
  }

  componentDidUpdate(prevProps) {
    const { superview, children, isDarkView } = this.props;
    //if (isDarkView !== prevProps.isDarkView) {
      let src;
      React.Children.forEach(children, (child) => {
        if (child.props.isSelected) {
          src = child;
        }
      });
      if (this.imgRef.current) {
        console.log(this.imgRef.current.ui);
        console.log('setting image', src.props, Image.el(src));
        this.el.image = this.imgRef.current.ui;
      }
    //}
  }

  componentWillUnmount() {
    this.el.removeFromSuperview();
    delete this.el;
  }

  render() {
    return React.Children.map(this.props.children, (child) => {
      const newProps = { ...child.props };
      if (child.props.isSelected) {
        newProps.ref = this.imgRef;
      }
      return React.cloneElement(child, newProps, child.children);
    });
  }
}

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isDarkTheme: false,
    };
    this.handleButtonClick = this.handleButtonClick.bind(this);
  }

  componentDidMount() {
    const { nav, vc } = this.props;
    nav.pushViewController(vc);
  }

  handleButtonClick() {
    const { isDarkTheme } = this.state;
    this.setState({ isDarkTheme: !isDarkTheme });
  }

  render() {
    const { vc } = this.props;
    const { isDarkTheme } = this.state;

    const img = React.createElement(Image, {
      source: isDarkTheme ? 'user' : 'user_unselected',
      isSelected: true,
      el: {},
    });

    const imageView = React.createElement(ImageView, {
      isDarkTheme,
      key: 'img-view',
    }, img);

    const button = React.createElement(Button, {
      isDarkTheme,
      onClick: this.handleButtonClick,
      key: 'btn',
    });

    return React.createElement(FullScreenView, {
      isDarkTheme,
      superview: vc.view,
    }, [imageView, button]);
  }
}

module.exports = (nav, demoVC) => {
  ReactDOM.render(
    React.createElement(App, {
      vc: demoVC,
      nav,
    }),
    document.getElementById('app')
  );
  console.log(document);
};
