# README

Welcome to the future of blogging!

This will be the defacto standard for blogging. The new amazing features and tools will be
driven by marketing and sales. For now, we will build the skeleton of the application so that
a user can have many blogs with posts and comments!

Local setup

Get your gems on

`bundle install`

and get your javascript dependencies with the yarn command

To get some basic data into the application for developement and testing, please ensure that you
run the command

`bundle exec rails db:seed`

Each user will have a default password of `password` from the seed file

# Known Issues

There are some known issues with the application.

- The posts#show page has a ruby object in the view. Please fix this.

- The BlogsController and PostsController are performing a lot of database queries. Reduce the number of DB calls if possible. Add a presenter perhaps.

- The blogs#show page displays the number of comments per post. Please implement a counter cache.
