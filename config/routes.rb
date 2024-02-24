Rails.application.routes.draw do
  namespace :v1, { format: 'json' } do
    namespace :public do
      resources :lectures, only: %i[index show]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
