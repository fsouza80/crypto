Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  #get '/inicio', to: 'welcome#index'

  resources :coins
  #get '/coins', to: 'coins#index'

  #rota padrão - pagina inicial da aplicacao
  root to: 'welcome#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
