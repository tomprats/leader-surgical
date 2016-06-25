Rails.application.routes.draw do
  root "pages#home", as: :home

  controller :pages do
    get :vision
    get :doctors
    get :services
    get :visit
    get :faq
    get :pay
  end

  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    root "users#index"

    resources :users, only: [:index, :edit, :create, :update, :destroy]
    resources :pages, only: [:index, :edit, :create, :update, :destroy]
    resources :visions, only: [:index, :edit, :create, :update, :destroy]
    resources :doctors, only: [:index, :edit, :create, :update, :destroy]
    resources :specialties, only: [:index, :edit, :create, :update, :destroy]
    resources :procedures, only: [:index, :edit, :create, :update, :destroy]
    resources :body_parts, only: [:index, :edit, :create, :update, :destroy]
    resources :visits, only: [:index, :edit, :create, :update, :destroy]
    resources :faqs, only: [:index, :edit, :create, :update, :destroy]
  end

  resources :doctors, only: [:show]
  resources :specialties, only: [:show]
  resources :procedures, only: [:show]
  resources :body_parts, only: [:show]

  get ":path", to: "pages#show", as: :page
end
