Rails.application.routes.draw do
  
  # Homepage
  root to: 'index#home'
  
  # JSON to hash ruby
  get '/json-to-hash-ruby.rb', to: 'jsonhash#app'
  post '/json-to-hash-ruby.rb', to: 'jsonhash#parsing'
  
  # Lorem ipsum generator
  get '/lorem-ipsum-generator.rb', to: 'lorem#app'
  post '/lorem-ipsum-generator.rb', to: 'lorem#generate'
  
  # Discord webhook test
  get '/discord-webhook-test.rb', to: 'discord#app'
  post '/discord-webhook-test.rb', to: 'discord#post'
  
  # Slack webhook test
  get '/slack-webhook-test.rb', to: 'slack#app'
  post '/slack-webhook-test.rb', to: 'slack#post'
  
end
