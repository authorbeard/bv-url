import React, { Component } from 'react';
import axios from 'axios';
import ShortenedUrl from './ShortenedUrl';
import NewUrlForm from './NewUrlForm';
import NewUrl from './NewUrl';

class ShortenedUrlContainer extends Component {
    constructor(props){
      super(props)
      this.state = {
        shortenedUrls: []
      }
      this.addNewUrl = this.addNewUrl.bind(this)
    }

    componentDidMount() {
      axios.get("http://localhost:3000/api/v1/shortened_urls")
      .then(response => {
        debugger;
        console.log(response.data)
        this.setState({
          newUrl: response.data,
          shortenedUrls: response.data
        })
      })
      .catch(error => console.log(error))
    }

    addNewUrl(orig_url) {
        axios.post( 'http://localhost:3000/api/v1/shortened_urls', { orig_url: orig_url })
        .then(response => {
          debugger;
            console.log(response)
            const shortenedUrls = [ response.data ]
            this.setState({newUrl: shortenedUrls})
        })
        .catch(error => {
            console.log(error)
        })
    }

    render() {
      return (
          <div>
            <NewUrlForm onNewUrl={this.addNewUrl} />
            <NewUrl newUrl={this.newUrl} />
            <h1>THE TOP HUNDO</h1>
            {this.state.shortenedUrls.map( shortenedUrl => {
                return (
                    <ShortenedUrl shortenedUrl={shortenedUrl} key={shortenedUrl.id} />
                )
          })}

          </div>
      )
    }
}

export default ShortenedUrlContainer;