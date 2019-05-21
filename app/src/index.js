/*
import App from "./App";
import React from "react";
import ReactDOM from "react-dom";
*/
/*
import React from "react";
import ReactDOM from "react-dom";
const Faker = Require('Faker');
console.log(Faker);


class App extends React.Component {
  render() {
    return <div>Hello {this.props.name}!</div>;
  }
}
*/

/*
var mountNode = document.getElementById("app");
ReactDOM.render(<App vc={VC} nav={Nav} />, mountNode);
*/



import React from 'react';
import ReactDOM from 'react-dom';
import { AppContainer } from 'react-hot-loader';
import App from './App';

const render = Component => {
  ReactDOM.render(
    <AppContainer>
      <Component nav={Nav} vc={VC} />
    </AppContainer>,
    document.getElementById('app'),
  );
};

render(App);

// webpack Hot Module Replacement API
if (module.hot) {
  // keep in mind - here you are configuring HMR to accept CHILDREN MODULE
  // while `hot` would configure HMR for the CURRENT module
  module.hot.accept('./App', () => {
    console.log('module.hot.accept');
    // if you are using harmony modules ({modules:false})
    //render(App);
    // in all other cases - re-require App manually
    render(require('./App'));
  });
}
