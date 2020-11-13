Rails.application.routes.draw do
  resources :name_dummies
  resources :matchings
  resources :skill_concatenates
  resources :skills
  resources :skill_lists
  resources :uploaded_checks
  resources :proper_names
  resources :names
  get "privacy", :to => "top_page#privacy", :as => "privacy"
  root 'top_page#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
