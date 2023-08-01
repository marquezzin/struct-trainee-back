class PostSerializer < Panko::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :title, :content, :user

    def user
        {email: object.user.email}
    end
end