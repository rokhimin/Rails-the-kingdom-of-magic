Rails.application.routes.draw do
  
  # homepage
  root to: 'index#home'
  
  # JSON to hash ruby
  get '/json-to-hash-ruby.rb', to: 'jsonhash#app'
  post '/json-to-hash-ruby.rb', to: 'jsonhash#parsing'
  
  # Lorem ipsum generator
  get '/lorem-ipsum-generator.rb', to: 'lorem#app'
  post '/lorem-ipsum-generator.rb', to: 'lorem#generate'
  
end
