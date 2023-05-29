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

  def edit    
    @performer = Performer.find_by(token:session[:performer_token])
    @service = Service.find_by(id: params[:id])  
  end

  def update
    @performer = Performer.find_by(token:session[:performer_token])
    @service = Service.find_by(id: params[:id])

    puts "HAVE YOU FOUND THE SERVICE ID?#{@service}"

    if @service.update(service_update_params)
        redirect_to services_show_path
      else
        redirect_to services_edit_path
      end

  end

  def delete
    @performer = Performer.find_by(token: session[:performer_token])
    @service = Service.find(params[:id])  

    if @service.destroy
      redirect_to services_show_path
    end
  end

  def pending


  end



  private

  def service_create_params
    params.require(:service).permit(:category, :service_name, :fee, :duration)
  end

  def service_update_params
    params.require(:service).permit(:category, :service_name, :fee, :duration)
  end
end
