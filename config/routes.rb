Spree::Core::Engine.routes.draw do
  namespace :api do
    post '/api_status', to: 'nf4web#api_status'
    get  '/api_status', to: 'nf4web#api_status'
  end
end
