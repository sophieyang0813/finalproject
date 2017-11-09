Rails.application.routes.draw do
  
  root "sessions#new"
 

  resources :supporters, controller: "supporters", only: [:create, :new, :index]



  resources :posts

  resources :posts do
    resources :orders, only: [:index, :new, :create]
  end

  resources :orders, only: [:show, :edit, :update, :destroy]

  resources :charities, controller: "charities", only: [:create, :new, :index]

  resource :session, controller: "sessions", only: [:create, :new]

  resources :deliveries, controller: "deliveries"
 
  get "confirmation", to: :confirmation, controller: "deliveries"
  
  # resource :session, controller: "clearance/sessions", only: [:create]

  # resources :users, controller: "clearance/users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end

  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
