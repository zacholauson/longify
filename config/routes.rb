Longify::Application.routes.draw do
  resources :urls
  get '/:longified_url', to: 'urls#redirect'

  root 'urls#new'
end
