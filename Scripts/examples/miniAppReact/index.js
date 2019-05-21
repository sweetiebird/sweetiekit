SweetieKitDom = require('sweetiekit-dom');
SweetieKitDom();

React = window.React = require('react');
ReactDOM = window.ReactDOM = require('react-dom');

div = document.createElement('div');
div.setAttribute('id', 'app');
document.body.appendChild(div);

class Toggle extends React.Component {
  constructor(props) {
    super(props);
    this.state = {isToggleOn: true};

    // This binding is necessary to make `this` work in the callback
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState(state => ({
      isToggleOn: !state.isToggleOn
    }));
  }

  render() {
    return React.createElement("button", {
      onClick: this.handleClick
    }, this.state.isToggleOn ? 'ON' : 'OFF');
  }
}

ReactDOM.render(
  React.createElement(Toggle),
  document.getElementById('app')
);

module.exports = () => {
  console.log(document);
};
