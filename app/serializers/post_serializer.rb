class PostSerializer < Panko::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :title, :content, :user, :images_url

    def user
        {email: object.user.email}
    end

    def images_url
        array = []
        if object.images.attached?
            object.images.each do |image|
                array.append rails_blob_path(image, only_path: true)
            end
        end
        array
    end
end