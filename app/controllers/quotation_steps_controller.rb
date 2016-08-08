class QuotationStepsController < ApplicationController
  layout "quotation"
  include Wicked::Wizard
  steps :data_vehicle, :use_vehicle, :driver_info, :insured_info, :owner_info

  def show
    @quotation = Quotation.find session[:quotation_id]
    case step
    when :data_vehicle
      @quotation.has_alarm = false
      @quotation.has_blocker_ignition = false
      @quotation.has_tracker = false
      @quotation.funded_alienated = false
      @quotation.has_armor = false
      @quotation.has_gaskit = false
      @quotation.has_chassis_remarked = false

    when :use_vehicle
      @quotation.has_house_park = false
      @quotation.has_house_remote_control = false
      @quotation.use_go_work = false
      @quotation.funded_alienated = false
      @quotation.has_work_park = false
      @quotation.has_work_remote_control = false
      @quotation.use_commercial = false
      @quotation.use_go_study = false
      @quotation.has_study_park = false
      @quotation.has_study_remote_control = false
    end

    render_wizard
  end

  def get_address
    val = params[:cep]
    result = ""
    begin
      address = Correios::CEP::AddressFinder.get(val)
    rescue ArgumentError
      render plain: "CEP inválido"
    else
      result = address[:address] + " - " + address[:neighborhood] + " - " + address[:city] + "/" + address[:state]
      render plain: result  
    end
    

  end

  def get_drop_down_options
    val = params[:year].to_i
    #Use val to find records
    array = [val, val+1]
    render :text => array
  end

  def update
    @quotation = Quotation.find session[:quotation_id]
    case step
    when :data_vehicle
      @quotation.attributes = quotation_data_vehicle_params
    when :use_vehicle
      @quotation.attributes = quotation_use_vehicle_params
    when :driver_info
      @quotation.attributes = quotation_driver_info_params
      if @quotation.driver_is_insured
        @quotation.insured_name = @quotation.driver_name
        @quotation.insured_cpf = @quotation.driver_cpf
        @quotation.insured_gender = @quotation.driver_gender
        @quotation.insured_birth_date = @quotation.driver_birth_date
        @quotation.insured_marital_status = @quotation.driver_marital_status
      else
        @quotation.insured_name = nil
        @quotation.insured_cpf = nil
        @quotation.insured_gender = nil
        @quotation.insured_birth_date = nil
        @quotation.insured_marital_status = nil
        @quotation.insured_email = nil
        @quotation.insured_is_driver = nil
      end

      if @quotation.driver_is_owner
        @quotation.owner_name = @quotation.driver_name
        @quotation.owner_cpf = @quotation.driver_cpf
        @quotation.owner_gender = @quotation.driver_gender
        @quotation.owner_birth_date = @quotation.driver_birth_date
        @quotation.owner_marital_status = @quotation.driver_marital_status
        @quotation.insured_is_owner = false
      else
        @quotation.owner_name = nil
        @quotation.owner_cpf = nil
        @quotation.owner_gender = nil
        @quotation.owner_birth_date = nil
        @quotation.owner_marital_status = nil
        @quotation.owner_email = nil
        @quotation.owner_is_driver = nil
      end      
    when :insured_info
      @quotation.attributes = quotation_insured_info_params
      if ( not @quotation.driver_is_owner) and @quotation.insured_is_owner
        @quotation.owner_name = @quotation.insured_name
        @quotation.owner_cpf = @quotation.insured_cpf
        @quotation.owner_gender = @quotation.insured_gender
        @quotation.owner_birth_date = @quotation.insured_birth_date
        @quotation.owner_marital_status = @quotation.insured_marital_status
        @quotation.owner_email = @quotation.insured_email
        @quotation.insured_is_owner = false
      elsif @quotation.driver_is_owner and @quotation.driver_is_insured
        @quotation.owner_email = @quotation.insured_email
      end      
    when :owner_info
      @quotation.attributes = quotation_owner_info_params
    end    
    @quotation.status = step
    render_wizard @quotation
  end

  private
    def redirect_to_finish_wizard(options = nil)
      @quotation = Quotation.find session[:quotation_id]
      QuotationMailer.quotation_email(@quotation).deliver
      redirect_to quotation_quotation_success_path, notice: ""
    end

    def quotation_data_vehicle_params
      params.require(:quotation).permit(:brand, :manufacturing_year, 
        :model_year, :vehicle_model_name, :vehicle_model_id, :has_alarm, 
        :has_blocker_ignition, :has_tracker, :funded_alienated, 
        :has_armor, :has_gaskit, :has_chassis_remarked)
    end

    def quotation_use_vehicle_params
      params.require(:quotation).permit(:cep, :cep_night, :has_house_park, 
        :has_house_remote_control, :use_go_work, :has_work_park, 
        :has_work_remote_control, :use_commercial, :use_go_study, 
        :has_study_park, :has_study_remote_control, :km_daily)
    end

    def quotation_driver_info_params
      params.require(:quotation).permit(:driver_name, :driver_cpf, :driver_gender,
        :driver_birth_date, :driver_marital_status, :has_driver_dependent, 
        :enabling_time, :home_cep, :has_other_vehicles, :schooling, :professional_activity,
        :was_stolen, :driver_is_insured, :driver_is_owner)
    end

    def quotation_insured_info_params
      params.require(:quotation).permit(:insured_name, :insured_cpf, :insured_email, 
        :insured_gender, :insured_birth_date, :insured_marital_status, 
        :insured_is_driver, :insured_is_owner)
    end

    def quotation_owner_info_params
      params.require(:quotation).permit(:owner_name, :owner_cpf, :owner_email, 
        :owner_gender, :owner_birth_date, :owner_marital_status, 
        :owner_is_driver)
    end
end
