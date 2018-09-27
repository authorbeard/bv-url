import React from 'react'
import ShortenedUrl from './ShortenedUrl';

const NewUrl = ({responseObj}) => {
  let newUrl = responseObj.url_record
    if ( newUrl.hasOwnProperty("id") ) {
      if (responseObj.is_new) {
        return (
          <div className="new-url">
            <h1>Created burly url: {window.location.href + newUrl.key}</h1>
            <h3>original URL: {newUrl.original_url}</h3>
            <ShortenedUrl shortenedUrl={newUrl} key={newUrl.id} />
          </div>
        )
      } else {
        return (
          <div className="new-url">
            <h1>Already Exists!</h1>
            <h3>burly url: {window.location.href + newUrl.key}</h3>
            <ShortenedUrl shortenedUrl={newUrl} key={newUrl.id} />
          </div>
        )
      }
    } else {
      return null;
    } 
}

export default NewUrl