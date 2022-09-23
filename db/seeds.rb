blog1 = Blog.create(title: 'dream about code', body: 'had a dream about code that can fix a bug and it worked!', user_id: 1, status: 1, keyword: 'work')

Comment.create(comment_text: 'sounds like a nighmare!', user_id: 2, blog_id: blog1.id )
Comment.create(comment_text: 'thats happened to me too!', user_id: 3, blog_id: blog1.id )
