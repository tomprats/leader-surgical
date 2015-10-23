Rails.application.routes.draw do
  root "pages#home", as: :home

  controller :pages do
    get :vision
    get :doctors
    get :services
    get :visit
    get :faq
  end
end
