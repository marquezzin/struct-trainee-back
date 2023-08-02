class UserSerializer < Panko::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :email, :bio, :is_admin, :profile_picture_url

    def profile_picture_url
        rails_blob_path(object.profile_picture, only_path: true) if object.profile_picture.attached?
    end
end
