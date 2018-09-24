import React from 'react';
const ShortenedUrl = ({shortenedUrl}) =>
    <div className="single-shortenedUrl" key={shortenedUrl.id}>
        <h4>{shortenedUrl.title}</h4>
        <p>{shortenedUrl.orig_url}</p>
    </div>
export default ShortenedUrl;