class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        User.find(cookies[:user_id])
    end
end
