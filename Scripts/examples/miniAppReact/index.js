const SweetieKit = require('std:sweetiekit.node');
SweetieKitDom = require('sweetiekit-dom');
SweetieKitDom();

React = window.React = require('react');
ReactDOM = window.ReactDOM = require('react-dom');

const { UIControlState } = require('../enums');

const {
  UIButton,
} = SweetieKit;

div = document.createElement('div');
div.setAttribute('id', 'app');
document.body.appendChild(div);

class Button extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isToggleOn: true };
    // This binding is necessary to make `this` work in the callback
    this.handleClick = this.handleClick.bind(this);
  }

  // componentDidUpdate(prevProps, prevState) {
  //   const { isToggleOn } = this.state;
  //   const { isToggleOn: wasToggleOn } = prevState;
  //   if (isToggleOn !== wasToggleOn) {
  //     this.button.setTitleForState();
  //   }
  // }

  async componentDidMount() {
    const { vc } = this.props;
    const w = vc.view.frame.width;
    this.button = await UIButton.alloc('Hello Button', 12, 80, w - 24, 50, this.handleClick);
    this.button.backgroundColor = { red: 87/255, green: 174/255, blue: 176/255 };
    this.button.layer.cornerRadius = 4;
    this.button.layer.shadowRadius = 12;
    this.button.layer.shadowColor = { red: 87/255, green: 174/255, blue: 176/255 };
    this.button.layer.shadowOffset = { width: 0, height: 12 };
    vc.view.addSubview(this.button);
  }

  handleClick() {
    this.setState(state => ({
      isToggleOn: !state.isToggleOn,
    }), () => {
      console.log(this.state.isToggleOn);
    });
  }

  render() {
    if (this.button) {
      this.button.setTitleForState(this.state.isToggleOn ? 'ON' : 'OFF', UIControlState.normal);
    }

    return React.createElement("button", {
      onClick: this.handleClick,
    });
  }
}

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const { nav, vc } = this.props;
    nav.pushViewController(vc);
  }

  // handleClick() {
  //
  // }

  render() {
    const { vc } = this.props;

    return React.createElement(Button, {
      vc,
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
