Rails.application.routes.draw do
  get 'docker_reg_v1/index'
  post 'docker_reg_v1/index'
  root 'docker_reg_v1#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
