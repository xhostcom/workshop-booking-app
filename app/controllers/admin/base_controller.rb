# frozen_string_literal: true

module Admin
  class BaseController < ActionController::Base
    include Pagy::Backend

    before_action :set_time_zone
    before_action :authenticate

    def set_time_zone
      Time.zone = cookies[:time_zone]
    end

    def authenticate
      if user = Admin::User.find_by_id(session[:admin_user_id])
        Admin::Current.user = user
      else
        redirect_to admin_sign_in_path
      end
    end
  end
end
