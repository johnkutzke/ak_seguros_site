class QuotesController < ApplicationController
  autocomplete :vehicle_model, :model, :full => true

  def new
    @quote = Quote.new
  end

  def data_vehicle
    @vehicle_quote = VehicleQuote.new
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

  def use_vehicle
    @use_vehicle_quote = UseVehicleQuote.new
  end

  def vehicle_driver

  end  
end
