class QuotationsController < ApplicationController
  layout "quotation"
  autocomplete :vehicle_model, :model, :full => true

  def new
    @quotation = Quotation.new
  end

  def create
    @quotation = Quotation.new(quotation_params)
    if @quotation.save
      session[:quotation_id] = @quotation.id
      redirect_to quotation_steps_path
    else
      render :new
    end

    
  end

  def quotation_success
    
  end

  def autocomplete_vehicle_model_model
    term = params[:term]
    brand_id = params[:brand_id]
    model_year = params[:model_year]
      vehicles = VehicleModel.where(
        'LOWER(vehicle_models.model) ILIKE ? and vehicle_brand_id = ? and year = ?', "%#{term}%", "#{brand_id}", "#{model_year}"
        ).order('LOWER(vehicle_models.model)').all
      render :json => vehicles.map { |profile| {:id => profile.id, :label => profile.model, :value => profile.model} }
  end

  private
    def quotation_params
      params.require(:quotation).permit(:contact_name, :contact_email, :insurance_type_id)
    end
end
