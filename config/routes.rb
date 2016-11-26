Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'images/:namespace/:image_name', to: 'show_image#index'
  get 'images/:id', to: 'show_image#show'
  get 'search/index'
  post 'search/index'
  root 'search#index'
end
