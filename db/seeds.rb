# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
blog1 = Blog.create(title: 'dream about code', body: 'has a dream about code that can fix a bug and it worked!', user_id: 1, status: 1)
blog2 = Blog.create(title: 'Flying cats', body: 'a dream where cats were flying', user_id: 1, status: 1)
blog3 = Blog.create(title: 'Exotic Colors', body: 'all of my dreams have vibrant colors', user_id: 2, status: 1)
blog4 = Blog.create(title: 'No Colors', body: 'Black and grey world', user_id: 2, status: 1)
blog5 = Blog.create(title: 'Neon lights', body: 'Its all neon, john mayer neon', user_id: 2, status: 1)
blog6 = Blog.create(title: 'Meshuggah', body: 'all chugs all the time', user_id: 2, status: 0)
blog7 = Blog.create(title: 'Turing solutions', body: 'my dream told me it was real', user_id: 2, status: 0)
blog8 = Blog.create(title: 'Seeds', body: 'All deku seeds, everywhere I look', user_id: 2, status: 0)
blog9 = Blog.create(title: 'Dreams', body: 'It was inception, I came up with it first', user_id: 2, status: 0)
blog10 = Blog.create(title: 'New hip lingo', body: 'Bussin, cap, savage, pek pek', user_id: 2, status: 0)
blog11 = Blog.create(title: 'Hidden Message', body: 'Good job front end', user_id: 2, status: 0)
blog12 = Blog.create(title: 'Other message', body: 'Good job back end', user_id: 3, status: 0)
blog13 = Blog.create(title: 'Bryce', body: 'Best youtube videos award, also very Marshall', user_id: 3, status: 0)
blog14 = Blog.create(title: 'Shirley', body: 'Smooth like BTS butter, theres no other?', user_id: 3, status: 0)
blog15 = Blog.create(title: 'Gwendoly', body: 'All spice, some of the time', user_id: 3, status: 0)
blog16 = Blog.create(title: 'Nikky', body: 'Making jokes and doing funny things on camera on accident', user_id: 3, status: 0)
blog17 = Blog.create(title: 'Tyler', body: 'All ark all the time, maybe rainbow six', user_id: 4, status: 0)
blog18 = Blog.create(title: 'Parker', body: 'Beautiful beard, also the good youtube videos', user_id: 4, status: 0)
blog19 = Blog.create(title: 'Dream Book', body: 'The best project for real for real', user_id: 4, status: 0)
blog20 = Blog.create(title: 'Bootstrap', body: 'Sucks 10/10 do not recomend', user_id: 4, status: 0)


Comment.create(comment_text: 'sounds like a nighmare!', user_id: 2, blog_id: blog1.id )
Comment.create(comment_text: 'thats happened to me too!', user_id: 3, blog_id: blog1.id )
Comment.create(comment_text: 'sounds so pretty!', user_id: 1, blog_id: blog2.id )
Comment.create(comment_text: 'bussin', user_id: 1, blog_id: blog2.id )
Comment.create(comment_text: 'cap!', user_id: 1, blog_id: blog2.id )
Comment.create(comment_text: 'bus caps!', user_id: 1, blog_id: blog2.id )
Comment.create(comment_text: 'giga dope!', user_id: 1, blog_id: blog3.id )
Comment.create(comment_text: 'bootstrap sucks!', user_id: 1, blog_id: blog3.id )
Comment.create(comment_text: 'seeeeeeds!', user_id: 1, blog_id: blog4.id )
Comment.create(comment_text: 'Hip gen z words!', user_id: 1, blog_id: blog4.id )
