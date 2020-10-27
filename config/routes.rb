Rails.application.routes.draw do

  post '/', to: 'urls#create', as: 'create_url'
  get '/:key', to: 'urls#show', as: 'show_url'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
