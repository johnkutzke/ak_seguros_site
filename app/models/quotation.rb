class Quotation < ApplicationRecord
  validates :vehicle_model, :presence => true, :if => :active?
  
  validates :contact_name, :contact_email, :insurance_type, :presence => true
  
  validates :brand, :manufacturing_year, :model_year, :vehicle_model_name, :presence => true, :if => :data_vehicle?
  
  validates :cep_night, :km_daily, :presence => true, :if => :use_vehicle?
  
  validates :driver_name, :driver_cpf, :driver_gender, :driver_birth_date, 
    :driver_marital_status, :enabling_time, :presence => true, :if => :driver_info?

  validates_inclusion_of :has_driver_dependent, :has_other_vehicles, 
    :was_stolen, :driver_is_insured, :driver_is_owner, :in => [true, false], 
    message: 'não pode ficar em branco', :if => :driver_info?

  validates :insured_name, :insured_cpf, :insured_email, :insured_gender, 
    :insured_birth_date, :insured_marital_status, :presence => true, :if => :insured_info?

  validates_inclusion_of :insured_is_owner, :in => [true, false], 
    message: 'não pode ficar em branco', :if => :insured_info?

  validates :owner_name, :owner_cpf, :owner_email, :owner_gender, 
    :owner_birth_date, :owner_marital_status, :presence => true, :if => :owner_info?

  validate :option_must_be_selected, :if => :data_vehicle?

  def option_must_be_selected
    errors.add(:vehicle_model_name, 'Um modelo da lista deve ser selecionado') if vehicle_model_id.blank? and data_vehicle?
  end


  def active?
    status == 'active'
  end

  def data_vehicle?
    status == 'data_vehicle'
  end

  def use_vehicle?
    status == 'use_vehicle'
  end

  def driver_info?
    status == 'driver_info'
  end

  def insured_info?
    status == 'insured_info'
  end

  def owner_info?
    status == 'owner_info'
  end

  def not_found_owner?
    not driver_is_owner
  end

  belongs_to :vehicle_model, optional: true
  belongs_to :insurance_type

  attr_accessor :brand
  attr_accessor :manufacturing_year
  attr_accessor :model_year
  attr_accessor :vehicle_model_name
end
