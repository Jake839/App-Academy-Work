Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #resources :cats, only: [:index, :show, :new, :create, :edit, :update]

  #routes for cats controller. nested routes to cat_rental_requests controller.
  resources :cats do 
    resources :cat_rental_requests, only: [:new, :create]
  end 

  # Defines the root path route ("/")
  root "cats#index"
end