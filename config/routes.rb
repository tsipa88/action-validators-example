Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get 'docs/swaggers/docs.json', to: 'docs#index'

    namespace :v1 do
      resources :contracts, only: :create
    end

    namespace :v2 do
      resources :contracts, only: :create
    end

    namespace :v3 do
      resources :contracts, only: :create
    end
  end

  mount SwaggerEngine::Engine, at: '/api/docs'
end
