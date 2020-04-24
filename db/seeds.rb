##
# clear out the current information
##

User.destroy_all
Blog.destroy_all
Post.destroy_all
Comment.destroy_all

##
# create 10 users
##

10.times do
  user = User.create(email: Faker::Internet.email, password: 'password')
end

## create some blogs, posts, and comments
rand(5..10).times do
  rand_blogger = User.all.sample
  blog         = Blog.create(title: Faker::Company.name, user: rand_blogger)

  ## add some posts to the blog
  rand(10).times do

    post = Post.create( blog: blog,
                        user: rand_blogger,
                        title: Faker::Quote.famous_last_words,
                        content: Faker::Books::Lovecraft.paragraph(sentence_count: 4, random_sentences_to_add: 10))

    ## add some comments to our post
    rand(10).times do
      rand_poster = User.all.sample
      Comment.create( user: rand_poster,
                      blog: blog,
                      post: post,
                      content: Faker::Books::Lovecraft.paragraph(sentence_count: 2, random_sentences_to_add: 10))
    end
  end
end
