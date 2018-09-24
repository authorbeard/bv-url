import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import ShortenedUrlContainer from "./components/ShortenedUrlContainer";

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Shorten some Urls, son.</h1>
        </header>
        <ShortenedUrlContainer />
      </div>
    );
  }
}

export default App;
