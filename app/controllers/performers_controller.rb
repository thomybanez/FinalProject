class PerformersController < ApplicationController
  def register
    @performer = Performer.new
  end

  def create
    @performer = Performer.new(performer_account_params)

    if @performer.save
      redirect_to performers_login_path
    else
      render :register, status: :unprocessable_entity
    end
  end

  def login_submit
    if @performer = Performer.authenticate(params[:email], params[:password])
      session[:performer_token] = @performer.token
      redirect_to performers_dashboard_path(@performer)
    else
      redirect_to performers_login_path
    end
  end

  def dashboard
    @performer = current_performer
    @client = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @performer = Performer.find_by(token: session[:performer_token])
    @photos = @performer.photos
  end

  def update
    @performer = Performer.find_by(token: session[:performer_token])
    @photos = @performer.photos

    if @performer.update(performer_update_params)
      @performer.resize_photos(@photos)
      redirect_to performers_dashboard_path(@performer)
    else
      render :edit
    end
  end

  def logout
    session.delete(:performer_token)
    redirect_to users_home_path
  end

  private

  def performer_account_params
    params.require(:performer).permit(:email, :password, :password_confirmation)
  end

  def performer_update_params
    params.require(:performer).permit(:stage_name, :description, :contact_number, :age, :gender, :location,
                                      photos: [])
  end

  def current_performer
    return unless session[:performer_token]

    @current_performer ||= Performer.find_by(token: session[:performer_token])
  end
end
