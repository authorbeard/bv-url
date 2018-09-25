import React, { Component } from 'react';
import './App.css';
import ShortenedUrlContainer from "./components/ShortenedUrlContainer";

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <h1>bURLy</h1>
          <span>(get it? because it has 'url' in it?)</span>
          <h2 className="App-title">Shorten some Urls, son.</h2>
        </header>
        <ShortenedUrlContainer />
      </div>
    );
  }
}

export default App;
