Spree::Core::Engine.routes.draw do
  namespace :api do
    post '/api_status', to: 'nf4web#api_status'
    get  '/api_status', to: 'nf4web#api_status'
    post '/api_nfecommerce', to: 'nf4web#api_nfecommerce'
    get  '/api_nfecommerce', to: 'nf4web#api_nfecommerce'
  end
end
