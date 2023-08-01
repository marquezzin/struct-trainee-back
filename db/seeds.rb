# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(id:1, name: "Joao", email: "joao@gmail.com", password: "12345678", is_admin: true, bio:"eu sou o joao")
User.create(id:2, name: "Maria", email: "maria@gmail.com", password: "12345678", is_admin: true, bio:"eu sou a maria")
User.create(id:3, name: "Pedro", email: "pedro@gmail.com", password: "12345678", is_admin: true, bio:"eu sou o pedro")

# User.find_by(name:"Joao").profile_picture.attach(io: File.open('./public/joao.png'), filename:('joao.png'))
# User.find_by(name:"Maria").profile_picture.attach(io: File.open('./public/maria.png'), filename:('maria.png'))
# User.find_by(name:"Pedro").profile_picture.attach(io: File.open('./public/pedro.png'), filename:('pedro.png'))

Post.create(id:1, title: "Post 1", content: "11111", user_id: 1)
Post.create(id:2, title: "Post 2", content: "22222", user_id: 2)
Post.create(id:3, title: "Post 3", content: "33333", user_id: 3)

Category.create(id:1, name: "Cat 1")
Category.create(id:2, name: "Cat 2")
Category.create(id:3, name: "Cat 3")

PostCategory.create(id:1, post_id: 1, category_id: 1)
PostCategory.create(id:2, post_id: 1, category_id: 3)
PostCategory.create(id:3, post_id: 2, category_id: 2)
PostCategory.create(id:4, post_id: 3, category_id: 3)

Upvote.create(id:1, status: false, post_id: 1, user_id: 2)
Upvote.create(id:2, status: true, post_id: 1, user_id: 3)
Upvote.create(id:3, status: false, post_id: 2, user_id: 1)
Upvote.create(id:4, status: true, post_id: 2, user_id: 3)
Upvote.create(id:5, status: false, post_id: 3, user_id: 1)
Upvote.create(id:6, status: true, post_id: 3, user_id: 2)

Comment.create(id:1, content: "11", post_id: 1, user_id: 2)
Comment.create(id:2, content: "22", post_id: 1, user_id: 3)
Comment.create(id:3, content: "33", post_id: 2, user_id: 1)
Comment.create(id:4, content: "44", post_id: 2, user_id: 3)
Comment.create(id:5, content: "55", post_id: 3, user_id: 1)
Comment.create(id:6, content: "66", post_id: 3, user_id: 2)