class CommentSerializer < Panko::Serializer
    attributes :id, :content, :post, :user

    def post
        {id: object.post.id, title: object.post.title, content: object.post.content}
    end
    
    def user
        {name: object.user.name}
    end
end