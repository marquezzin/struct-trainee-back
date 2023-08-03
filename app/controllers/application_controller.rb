class ApplicationController < ActionController::API

    private

    def admin_authentication
        unless current_user.is_admin == true
            render json: {message: "Permission denied"}, status: :unauthorized
        end
    end
end
