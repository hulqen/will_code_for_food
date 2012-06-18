Matplanera::Application.routes.draw do

  get "sl_product_row/destroy"

  get   "recipes/id"         => "recipes#show"
  get   "recipes"            => "recipes#index",           :as => "recipes"
  match "new_recipe"         => "recipes#new",             :as => "new_recipe"

  match "log_in"             => "sessions#new",            :as => "log_in"
  delete "log_out"           => "sessions#destroy"

  get   "shopping_list"      => "shopping_lists#show",     :as => "shopping_list"
  match "shopping_list/:id"  => "shopping_lists#update",   :as => "add_recipe_to_shopping_list"
  delete "shopping_list"     => "shopping_lists#destroy",  :as => "clear_shopping_list"

  delete "sl_product_row/:id"    => "sl_product_row#destroy",  :as => "delete_shopping_list_row"

  get   "sign_up"            => "users#new",               :as => "sign_up"

  resources :users
  resources :sessions
  resources :recipes
  resources :shopping_lists

  root :to => "recipes#index"

  # match 'products/:id' => 'catalog#view'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
