Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/sobre', to: 'static_pages#about'
  get '/produtos', to: 'static_pages#others_insurances'

  get '/get_drop_down_options', to: 'quotation_steps#get_drop_down_options'
  get '/get_address', to: 'quotation_steps#get_address'

  resources :questions
  resources :quotation_steps
  resources :quotations do
    get :autocomplete_vehicle_model_model, :on => :collection
  end

  get 'quotation/quotation_success', to: 'quotations#quotation_success'
end
