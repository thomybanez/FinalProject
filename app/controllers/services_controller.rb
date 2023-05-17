class ServicesController < ApplicationController


    def show
        @performer = Performer.find_by(token: session[:performer_token])        
        
    end

    def create
        
        
    end
   
end