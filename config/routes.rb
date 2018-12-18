Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get 'home/index' 
  # get 'home/house_provider'
  # post 'home/house_provider'
  # get 'home/house_needed'
  # post 'home/house_needed'
  get "home/search"
  post "home/search"

  post 'house_providers/new'
  post 'house_providers/edit'
  post 'house_providers/create'
  post 'house_providers/search'
  get  'house_providers/search'

  post 'house_neededs/new'
  post 'house_neededs/edit'
  post 'house_neededs/create'
  

  get "shared/flash_messages"
  resource :house_neededs
  resource :house_providers

end
