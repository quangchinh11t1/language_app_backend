Rails.application.routes.draw do
  post "auth_user" => "authentication#authenticate_user"
  
  namespace :v1 do
    resources :users, only: [:show, :create]
  end
end
