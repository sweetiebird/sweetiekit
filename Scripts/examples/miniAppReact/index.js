const SweetieKit = require('std:sweetiekit.node');
SweetieKitDom = require('sweetiekit-dom');
SweetieKitDom();

React = window.React = require('react');
ReactDOM = window.ReactDOM = require('react-dom');

const { UIControlState, UIControlEvents } = require('../enums');
const colors = require('../colors');

const {
  UIButton,
} = SweetieKit;

div = document.createElement('div');
div.setAttribute('id', 'app');
document.body.appendChild(div);

class Button extends React.Component {
  componentDidMount() {
    const { superview, onClick } = this.props;
    const w = superview.frame.width;
    this.ui = new UIButton({ x: 12, y: 80, width: w - 24, height: 50 });
    this.ui.backgroundColor = { red: 87/255, green: 174/255, blue: 176/255 };
    this.ui.layer.cornerRadius = 4;
    this.ui.layer.shadowRadius = 12;
    this.ui.layer.shadowColor = { red: 87/255, green: 174/255, blue: 176/255 };
    this.ui.layer.shadowOffset = { width: 0, height: 12 };
    this.ui.setTitleForState('Toggle Me', UIControlState.normal);
    this.ui.addTarget(onClick, UIControlEvents.touchUpInside);
    superview.addSubview(this.ui);
  }

  componentDidUpdate(prevProps) {
    const { isDarkTheme } = this.props;
    const { isDarkTheme: wasDarkTheme } = prevProps;
    if (isDarkTheme !== wasDarkTheme) {
      if (isDarkTheme) {
        this.ui.titleLabel.textColor = colors.white;
        this.ui.backgroundColor = colors.fitbodMedGrey;
      } else {
        this.ui.titleLabel.textColor = colors.fitbodDarkGrey;
        this.ui.backgroundColor = colors.fitbodPink;
      }
    }
  }

  componentWillUnmount() {
    this.ui.removeFromSuperview();
  }

  render() {
    return React.createElement('button', {}, );
  }
}

class FullScreenView extends React.Component {
  componentWillMount() {
    const { superview, isDarkTheme } = this.props;
    this.ui = new UIView({ x: 0, y: 0, width: superview.frame.width, height: superview.frame.height });
    if (isDarkTheme) {
      this.ui.backgroundColor = colors.fitbodDarkGrey;
    } else {
      this.ui.backgroundColor = colors.white;
    }
    superview.addSubview(this.ui);
  }

  componentDidUpdate(prevProps) {
    const { isDarkTheme } = this.props;
    const { isDarkTheme: wasDarkTheme } = prevProps;
    if (isDarkTheme !== wasDarkTheme) {
      if (isDarkTheme) {
        this.ui.backgroundColor = colors.fitbodMedGrey;
      } else {
        this.ui.backgroundColor = colors.white;
      }
    }
  }

  componentWillUnmount() {
    this.ui.removeFromSuperview();
  }

  render() {
    const { children, isDarkTheme, onButtonClick } = this.props;

    return React.createElement(Button, {
      superview: this.ui,
      isDarkTheme,
      onClick: onButtonClick,
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

    return React.createElement(FullScreenView, {
      isDarkTheme,
      onButtonClick: this.handleButtonClick,
      superview: vc.view,
    });
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
