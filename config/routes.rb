Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'index#home'
  get '/json-to-hash-ruby', to: 'jsonhash#app'
	post '/json-to-hash-ruby', to: 'jsonhash#parsing'
end
