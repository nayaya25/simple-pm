Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/admin', to: 'users#index'
  scope '/admin' do
    resources :users
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "projects#index"
end
