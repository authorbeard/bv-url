import React, { Component } from 'react';
import axios from 'axios';
import ShortenedUrl from './ShortenedUrl';
import NewUrlForm from './NewUrlForm';
import NewUrl from './NewUrl';

class ShortenedUrlContainer extends Component {
    constructor(props){
      super(props)
      this.state = {
        newUrl: {is_new: {}, url_record:{}},
        shortenedUrls: []
      }
      this.addNewUrl = this.addNewUrl.bind(this)
    }

    componentDidMount() {
      axios.get("/api/v1/shortened_urls")
      .then(response => {
        this.setState({
          shortenedUrls: response.data
        })
      })
      .catch(error => console.log(error))
    }

    addNewUrl(orig_url) {
        axios.post( '/api/v1/shortened_urls', {orig_url: orig_url})
        .then(response => {
          const newUrl = response.data
          this.setState({newUrl})
        })
        .catch(error => {
            console.log(error)
        })
    }

    render() {
      return (
          <div>
            <NewUrl responseObj={this.state.newUrl} />
            <NewUrlForm onNewUrl={this.addNewUrl} />
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