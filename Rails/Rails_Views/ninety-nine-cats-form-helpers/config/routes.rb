Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #resources :cats, only: [:index, :show, :new, :create, :edit, :update]

  #routes for cats controller. collection/nested routes to cat_rental_requests controller.
  resources :cats do 
    resources :cat_rental_requests, only: [:index, :new, :create]
  end 

  #member routes for cat_rental_requests controller
  resources :cat_rental_requests do 
    get 'approve', on: :member
    get 'deny', on: :member
  end 

  # Defines the root path route ("/")
  root "cats#index"
end