import React from 'react'
import ShortenedUrl from './ShortenedUrl';

const NewUrl = ({ newUrl }) => {
  debugger;
    if (typeof(newUrl) !== "undefined") {
      return (
        <div class="new-url"><ShortenedUrl shortenedUrl={newUrl} key={newUrl.id} /></div>
      )
    } else {
      return null;
    }
}

export default NewUrl