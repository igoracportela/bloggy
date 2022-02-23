# README

This project simulates some situations that can happen and works as a deeper test than brushing bits ;)

# Issues

There are some known issues with the application.

- The posts#show page has a ruby object in the view. 

- The BlogsController and PostsController are performing a lot of database queries. Reduce the number of DB calls if possible.

- The blogs#show page displays the number of comments per post.
