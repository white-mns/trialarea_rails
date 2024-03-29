Rails.application.routes.draw do
  resources :chara_use_skills
  resources :all_use_skills
  resources :name_dummies
  resources :matchings
  resources :skill_concatenates
  resources :skills
  resources :skill_lists
  resources :uploaded_checks
  resources :proper_names
  resources :names
  get 'script', :to => "top_page#script", :as => "top_page_script"
  get "privacy", :to => "top_page#privacy", :as => "privacy"
  root 'top_page#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
