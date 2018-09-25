import React from 'react'
import ShortenedUrl from './ShortenedUrl';

const NewUrl = ({responseObj}) => {
  debugger;
  let newUrl = responseObj.record
    if ( newUrl.hasOwnProperty("id") ) {
      if (newUrl.is_new) {
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