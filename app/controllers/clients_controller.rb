class ClientsController < ApplicationController

    

    def register
        @client = Client.new
    end

    def create
        @client = Client.new(client_account_params)   

        if @client.save
            redirect_to clients_login_path       
        else
            render :register, status: :unprocessable_entity
        end
    end

    def login_submit  
        if Client.authenticate(params[:email], params[:password])
            redirect_to clients_dashboard_path
          else
            redirect_to clients_login_path
          end   
    end


    private
    def client_account_params
        params.require(:client).permit(:email, :password, :password_confirmation)
    end


end