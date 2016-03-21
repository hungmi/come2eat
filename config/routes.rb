Rails.application.routes.draw do

  #resources :fooditems

  resources :orders do
    post 'fooditems/create' => 'orders#create_fooditem'
    get 'fooditems/new' => 'orders#new_fooditem'
  end

  #delete 'orders/:order_id/fooditems/:fooditem_id' => 'fooditems#destroy', as: :remove_fooditem
  # dont use route to pass params, set hash in view.

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :restaurants

  devise_for :admins

  resources :restaurants do
    get 'orders' => 'restaurants/orders#index'
    resources :foods, controller: 'restaurants/foods'
  end

  namespace :admin do
    resources :locations
    resources :restaurants
    resources :orders do
      get 'by_restaurants' => 'orders#by_restaurants', on: :collection
      get 'by_locations' => 'orders#by_locations', on: :collection
    end
  end

  root 'orders#new'
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
