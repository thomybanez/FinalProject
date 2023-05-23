class UsersController < ApplicationController
  def home
    session.delete(:client_token)
    puts "HOME NOTTTTTTTTTTTTTTHING??? #{session[:client_token]}"
  end
end
