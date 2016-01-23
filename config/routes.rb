Rails.application.routes.draw do
  root "pages#home", as: :home

  controller :pages do
    get :vision
    get :doctors
    get :services
    get :visit
    get :faq
  end

  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    root "users#index"

    resources :users, only: [:index, :edit, :create, :update, :destroy]
    resources :doctors, only: [:index, :edit, :create, :update, :destroy]
    resources :specialties, only: [:index, :edit, :create, :update, :destroy]
    resources :procedures, only: [:index, :edit, :create, :update, :destroy]
  end
end
