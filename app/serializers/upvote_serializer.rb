class UpvoteSerializer < Panko::Serializer
    attributes :id, :status, :post, :user

    def post
        {id: object.post.id, title: object.post.title, content: object.post.content}
    end

    def user
        {email: object.user.email}
    end
end