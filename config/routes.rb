Rails.application.routes.draw do
  post "auth_user" => "authentication#authenticate_user"
  get "/all_courses", to: "v1/courses#get_all"
  get "/get_lessons", to: "v1/lessons#get_lessons"
  get "/get_words", to: "v1/words#get_words"


  namespace :v1 do
    resources :users, only: [:show, :create]
    resources :courses, except: [:edit, :new]
    resources :lessons, except: [:edit, :new]
    resources :words, except: [:edit, :new]
  end
end
