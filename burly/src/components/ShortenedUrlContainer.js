import React, { Component } from 'react';
import axios from 'axios';
import ShortenedUrl from './ShortenedUrl';
import NewUrlForm from './NewUrlForm';

class ShortenedUrlContainer extends Component {
    constructor(props){
      super(props)
      this.state = {
        shortenedUrls: []
      }
    }

    componentDidMount() {
      axios.get("http://localhost:3000/api/v1/shortened_urls/index.json")
      .then(response => {
        debugger;
        console.log(response)
        this.setState({
          urls: response.data
        })
      })
      .catch(error => console.log(error))
    }

    addNewUrl(orig_url) {
      debugger;
        axios.post( '/api/v1/shortened_urls', { orig_url: orig_url })
        .then(response => {
            console.log(response)
            const shortenedUrls = [ ...this.state.shortenedUrls, response.data ]
            this.setState({shortenedUrls})
        })
        .catch(error => {
            console.log(error)
        })
    }

    render() {
      return (
          <div className="urls-container">
            <NewUrlForm onNewUrl={this.addNewUrl} />
              {this.state.shortenedUrls.map( shortenedUrl => {
                  return (<ShortenedUrl shortenedUrl={shortenedUrl} key={shortenedUrl.id} />)
              })}
          </div>
      )
    }
}

export default ShortenedUrlContainer;