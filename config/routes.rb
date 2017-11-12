Rails.application.routes.draw do

  
  root "posts#index"

  
  get '/myposts' => 'supporters#index'
  get '/myorders' => 'charities#index'
  # get '/hello' => 'contents#hello'

  resources :contents, controller: "contents", only: [:index, :show]

  resources :supporters, controller: "supporters", only: [:create, :new, :index, :update ,:show, :edit]

  resources :charities, controller: "charities", only: [:create, :new, :index, :update ,:show, :edit]

  resources :posts

  resources :posts do
    resources :orders, only: [:index, :new, :create, :show]
  end
  
  resources :order, only:[:show]

  resource :session, controller: "sessions", only: [:create, :new, :destroy ]




  
  # resource :session, controller: "clearance/sessions", only: [:create]

  # resources :users, controller: "clearance/users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end

  get "/sign_in" => "sessions#new", as: "sign_in"
  post "/sign_in" => "session#create"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  # get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
