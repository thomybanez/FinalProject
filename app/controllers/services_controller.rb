class ServicesController < ApplicationController
  def new
    @performer = Performer.find_by(token: session[:performer_token])
    @service = Service.new
  end

  def show
    @performer = Performer.find_by(token: session[:performer_token])
    @service = Service.where(performer_id: @performer.id)
  end

  def create
    @performer = Performer.find_by(token: session[:performer_token])
    @service = Service.new(service_create_params)
    @service.performer_id = @performer.id

    if @service.save
      redirect_to services_show_path
    else
      render :show
    end
  end

  private

  def service_create_params
    params.require(:service).permit(:category, :service_name, :rate_hour, :no_hour)
  end
end
