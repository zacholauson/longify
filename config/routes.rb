Longify::Application.routes.draw do
  get  '/show/:id', to: 'longify#show', as: :show_longified
  post '/create', to: 'longify#create', as: :create_longified
  get  '/:longified_url', to: 'longify#redirect', as: :redirect_to_original

  root to: 'longify#new'
end
