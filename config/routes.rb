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
    get 'questions/similar_questions' => 'validations#similar_questions'
    get 'questions/hottest' => 'questions#hottest'
    get 'questions/insterested' => 'questions#interested'
  end
end
