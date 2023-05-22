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
    if @client = Client.authenticate(params[:email], params[:password])
      session[:client_token] = @client.token
      redirect_to clients_dashboard_path(@client)
    else
      redirect_to clients_login_path
    end
  end

  def dashboard
    @client = current_client
    @performer = Performer.all
    @performer_photos = []

    @performer.each do |performer|
      performer_photos = performer.photos
      performer_photos.each do |photo|
        @performer_photos << photo
        puts "PERFORMER PHOTOS #{@performer_photos.inspect}"
      end
    end
  end

  def show
    session[:selected_performer] = params[:id]
    @selected_performer = Performer.find_by(id: session[:selected_performer])
    @service = Service.where(performer_id: session[:selected_performer])
    @booking = Booking.new
  end

  def edit
    @client = Client.find_by(token: session[:client_token])
    @photos = @client.photos
  end

  def update
    @client = Client.find_by(token: session[:client_token])
    @photos = @client.photos

    if @client.update(client_update_params)
      @client.resize_photos(@photos)
      redirect_to clients_edit_path(@client)
    else
      render :edit
    end
  end

  def logout
    session.delete(:client_token)
    redirect_to users_home_path
  end

  private

  def client_account_params
    params.require(:client).permit(:email, :password, :password_confirmation)
  end

  def client_update_params
    params.require(:client).permit(:nick_name, :contact_number, :age, :gender, :location, photos: [])
  end

  def current_client
    return unless session[:client_token]

    @current_client ||= Client.find_by(token: session[:client_token])
  end
end
