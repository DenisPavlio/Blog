# Rails Blog
This Rails-based blog with categories, comments and likes.

You can see how it work here:
https://www.youtube.com/watch?v=bL04Rs72Yzk

## Installation and usage

Clone repository and run following commands:
```
bundle install
rake db:migrate
```

To test the app with mock data by running the following rake task:
```
rake fill:data
```

Run rails using

```
rails s
```

You can try app here: http://0.0.0.0:3000/

If you want to run Rspec tests use following command

```
bundle exec rspec spec
```

What I used:
```
Device
Bootstrap
Carrierwave
will_paginate
Acts As Votable
Acts As Commentable
jQuery
Font Awesome
Faker
Populator
Rspec
```

Thnx :)