Rails.application.routes.draw do

  get 'user/index'
  get 'user/login'
  get 'user/logout'
  get 'user/adasession'

  get 'home/index'
  get 'about/index'
  get 'kosan/upload'

  resources :kosan

  root 'home#index'
end
