class UsersController < ApplicationController
  def home
    session.delete(:client_token)
    session.delete(:performer_token)
  end
end
