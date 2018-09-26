# WELCOME TO BURLY

Burly shortens urls, keeps track of the most-requests, and redirects users to the original (unshortened) url. 

This was done as a personal project to get me more familiar with Rails 5 and React plus a Sidekiq worker and a garden-variety mySQL database.

You can check out [the Heroku demo]("https://burly.herokuapp.com"). It's ... rough. It's also my first successful Heroku deploy. Lotta new territory. Fun stuff, all in all, but this cries out for refactoring (see below). 

It's pre-seeded with the top 500 websites [according to this page]("https://moz.com/top500/pages"), which were obtained, parsed and rendered with a task that opens the page, grabs every one of the urls, parses and persists them, then fires of a Sidekiq worker for each to obtain its title. 

To check it out locally, you'll need to clone, run `bundle install`, then you can fire it up with foreman: 
```foreman start -f Procfile.development```

## Partial To-Do
1.  Optimize the URL shortening algorithm. The current one is pretty naive and starts with a minimum of 3 characters, adding more as the combos are exhausted.
2.  Convert LinkShortening Service to form object.
3. Make original url handling more flexible/less naive.
4. I dunno, add some styling? I mean, it's not coding, but who wants to use a page that looks like this one does?
5.  Add specs.

