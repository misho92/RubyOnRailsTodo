Rails.application.routes.draw do
  #devise_for :members

  get 'register/signup'

  get 'account/account'

  resources :accounts

  resources :portals

  #get 'portal/portal'

  resources :todos
  
  root to: "todo#index"
  
  # make devise use my own registation controller instead of its custom default (necessary for the additional fields added in signup form)
  devise_for :members, :controllers => {:registrations => "registration"}
  
  #devise_for :members, :controllers => { registration: "registration" }
#setting routes - matching verbs to the corresponding controllers and definitions to them  
  put "mark" => "todos#mark"
  
  put "todos" => "todos#put"
  
  delete "todos" => "todos#delete"
  
  put "portals" => "portals#put"
  
  put "accounts" => "accounts#put"
  
  post "registers" => "registers#post"
  
  post "account" => "registers#post"
  
  # urls routing
  get "todo" => "todo#index"
  
  get "portal" => "portals#portal"
  
  get "account" => "account#account"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
