Rails.application.routes.draw do
  root 'home#index'
  post '/notify', to: 'home#notify'
  get '/get_notify', to: 'home#get_notify'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
