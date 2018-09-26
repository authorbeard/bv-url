import React from 'react'
import ShortenedUrl from './ShortenedUrl';

const NewUrl = ({responseObj}) => {
  let newUrl = responseObj.url_record
    if ( newUrl.hasOwnProperty("id") ) {
      debugger;
      if (responseObj.is_new) {
        return (
          <div className="new-url">
            <h1>ADDED!</h1>
            <ShortenedUrl shortenedUrl={newUrl} key={newUrl.id} />
          </div>
        )
      } else {
        return (
          <div className="new-url">
            <h1>Already Exists!</h1>
            <ShortenedUrl shortenedUrl={newUrl} key={newUrl.id} />
          </div>
        )
      }
    } else {
      return null;
    } 
}

export default NewUrl