import React from 'react';
const ShortenedUrl = ({shortenedUrl}) =>
    <div className="single-shortenedUrl" key={shortenedUrl.id}>
        <h2>{shortenedUrl.title || "HANG ON, TRYNA GRAB THAT TITLE"}</h2>
        <h3>burly url: {window.location.href + shortenedUrl.key}</h3>
        <p>{shortenedUrl.orig_url}</p>
        <p>Requests: {shortenedUrl.requests}</p>
    </div>
export default ShortenedUrl;