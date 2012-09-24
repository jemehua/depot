Depot::Application.routes.draw do
  get "almacen/index"

  resources :products

  #cambia la ruta original
  root :to => 'almacen#index', :as => 'almacen'
end
