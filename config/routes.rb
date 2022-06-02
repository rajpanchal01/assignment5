Rails.application.routes.draw do
  resources :authors 
  resources :books 
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "authors/home",to: "authors#home"
  # Defines the root path route ("/")
  root "authors#home"
end
