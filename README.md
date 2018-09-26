# WELCOME TO BURLY

Burly shortens urls, keeps track of the most-requests, and redirects users to the original (unshortened) url. 

This was done as a personal project to get me more familiar with Rails 5 and React. 

You can check out [the Heroku demo]("https://burly.herokuapp.com"). It's ... rough. It's also my first successful Heroku deploy. Lotta new territory. Fun stuff, all in all, but this cries out for refactoring (see below). 

To check it out locally, you'll need to clone, run `bundle install`, then you can fire it up with foreman: 
```foreman start -f Procfile.development```

## Partial To-Do
1.  Optimize the URL shortening algorithm. The current one is pretty naive and starts with a minimum of 3 characters, adding more as the combos are exhausted.  
2.  Make original url handling more flexible/less naive.
3.  I dunno, add some styling? I mean, it's not coding, but who wants to use a page that looks like this one does?
4.  Add specs.

