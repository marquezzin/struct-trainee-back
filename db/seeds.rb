
User.create(id:1, name: "joaocarlos", email: "joao@gmail.com", password: "12345678", is_admin: true, bio: "eu sou o joao carlos")
User.create(id:2, name: "mariaclara", email: "maria@gmail.com", password: "12345678", is_admin: true, bio: "eu sou a maria clara")
User.create(id:3, name: "pedropaulo", email: "pedro@gmail.com", password: "12345678", is_admin: true, bio: "eu sou o pedro paulo")
User.create(id:4, name: "leopcortes", email: "leo@gmail.com", password:"12345678", is_admin: true, bio: "eu sou o leo cortes")
User.create(id:5, name: "gabrielmarques", email: "marques@gmail.com", password:"12345678", is_admin: true, bio: "eu sou o gabriel marques")

# User.find_by(name:"Joao").profile_picture.attach(io: File.open('./public/joao.png'), filename:('joao.png'))
# User.find_by(name:"Maria").profile_picture.attach(io: File.open('./public/maria.png'), filename:('maria.png'))
# User.find_by(name:"Pedro").profile_picture.attach(io: File.open('./public/pedro.png'), filename:('pedro.png'))

Post.create(id:1, title: "Esse é o titulo da postagem 1", content: "Esse é o conteúdo da postagem 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", user_id: 1)
Post.create(id:2, title: "Esse é o titulo da postagem 2", content: "Esse é o conteúdo da postagem 2. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", user_id: 2)
Post.create(id:3, title: "Esse é o titulo da postagem 3", content: "Esse é o conteúdo da postagem 3. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", user_id: 3)

Category.create(id:1, name: "Categoria 1")
Category.create(id:2, name: "Categoria 2")
Category.create(id:3, name: "Categoria 3")

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

Comment.create(id:1, content: "comentário 11111111111111", post_id: 1, user_id: 2)
Comment.create(id:2, content: "comentário 22222222222222", post_id: 1, user_id: 3)
Comment.create(id:3, content: "comentário 33333333333333", post_id: 2, user_id: 1)
Comment.create(id:4, content: "comentário 44444444444444", post_id: 2, user_id: 3)
Comment.create(id:5, content: "comentário 55555555555555", post_id: 3, user_id: 1)
Comment.create(id:6, content: "comentário 66666666666666", post_id: 3, user_id: 2)
