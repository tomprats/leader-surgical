Rails.application.routes.draw do
  root "pages#home", as: :home

  controller :pages do
    get :vision
    get :services
    get :visit
    get :faq
    get :feedback
  end
end
