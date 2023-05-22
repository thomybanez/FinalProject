class ApplicationController < ActionController::Base
  # before_action :authenticate_user

  # def authenticate_user
  #     if session[:client_token]
  #         @current_client = Client.find_by(token: session[:client_token])
  #     end

  #     redirect_to users_home_path unless @current_client

  # end
end
