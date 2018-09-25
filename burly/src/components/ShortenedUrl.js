import React from 'react';
const ShortenedUrl = ({shortenedUrl}) =>
    <div className="single-shortenedUrl" key={shortenedUrl.id}>
        <h3>{shortenedUrl.title || "HANG ON, TRYNA GRAB THAT TITLE"}</h3>
        <p>{shortenedUrl.orig_url}</p>
        <p>Requests: {shortenedUrl.requests}</p>
    </div>
export default ShortenedUrl;