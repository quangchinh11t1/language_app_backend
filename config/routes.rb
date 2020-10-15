Rails.application.routes.draw do
  post "auth_user" => "authentication#authenticate_user"
  get "/all_courses", to: "v1/courses#get_all"

  namespace :v1 do
    resources :users, only: [:show, :create]
    resources :courses, except: [:edit, :new]
  end
end
