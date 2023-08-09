class PostSerializer < Panko::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :title, :content, :user

    def user
        {name: object.user.name}
    end
end