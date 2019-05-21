import React from 'react';

import { UIControlEvents } from '../examples/enums';

import colors from '../examples/colors';

class MyView extends React.Component {
  render() {
    const { frame, clicks, handleButtonClick } = this.props;

    return (
      <ui-view
        backgroundColor={colors.fitbodPink}
        frame={{
          x: 0,
          y: 0,
          width: frame.width,
          height: frame.height,
        }}
      >
        <ui-button
          backgroundColor={colors.black}
          frame={{
            x: 100,
            y: 100,
            width: 60,
            height: 50,
          }}
          target={[handleButtonClick, UIControlEvents.touchUpInside]}
        />
        <ui-label
          frame={{
            x: 150,
            y: 150,
            width: 200,
            height: 50,
          }}
          backgroundColor={colors.white}
          text={`Hello ${clicks}`}
        />
      </ui-view>
    )
  }
}

class App extends React.Component {
  state = {
    clicks: 0,
  };

  handleButtonClick = () => {
    this.setState(state => ({
      clicks: state.clicks + 1,
    }));
  };

  render() {
    const { clicks } = this.state;

    return (
      <MyView
        {...this.props}
        clicks={clicks}
        handleButtonClick={this.handleButtonClick}
      />
    );
  }
}

export default App;
