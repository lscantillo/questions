# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  Healthcheck.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: 'json' } do
    resources :questions
    resources :departments
    resources :employees
    get '/admins', to: 'employees#admins'
    resources :tags
    resources :locations
    get '/tones', to: 'tones#tone'
    resources :comments
    post 'similar_questions' => 'validations#similar_questions'
    get 'hottest' => 'validations#hottest'
    get 'interesting' => 'validations#interesting'
    post '/upvote', to:'votes#upvote'
    delete '/downvote', to: 'votes#downvote'
    get 'unanswered' => 'validations#unanswered'
    get 'answered' => 'validations#answered'
  end
end
