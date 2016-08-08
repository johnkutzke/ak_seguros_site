# Preview all emails at http://localhost:3000/rails/mailers/quotation_mailer
class QuotationMailerPreview < ActionMailer::Preview
  def quotation_mail_preview
    quotation = Quotation.new
    quotation.contact_name = "Teste de nome"
    quotation.contact_email = "abs@abs.com"
    insurance_type = InsuranceType.first
    quotation.insurance_type = insurance_type
    
    quotation.vehicle_model = VehicleModel.first
    quotation.brand = VehicleBrand.first
    quotation.manufacturing_year = "2015"
    quotation.model_year = "2016"
    quotation.vehicle_model_name = "Modelo do carro"
    quotation.has_alarm = true
    quotation.has_blocker_ignition = false
    quotation.has_tracker = true
    quotation.funded_alienated = false
    quotation.has_armor = true
    quotation.has_gaskit = false
    quotation.has_chassis_remarked = true

    quotation.cep_night = "80820-500"
    quotation.has_house_park = true
    quotation.has_house_remote_control = false
    quotation.use_go_work = true
    quotation.has_work_park = true
    quotation.has_work_remote_control = true
    quotation.use_commercial = false
    quotation.use_go_study = false
    quotation.has_study_park = false
    quotation.has_study_remote_control = false
    quotation.km_daily = 50
    
    QuotationMailer.quotation_email(quotation).deliver
  end
end
