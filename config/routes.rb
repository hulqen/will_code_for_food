Matplanera::Application.routes.draw do

  # get   "recipes/:id"        => "recipes#show",             :as => "recipe"
  # get   "recipes"            => "recipes#index",            :as => "recipes"
  get   "new_recipe"         => "recipes#new",              :as => "new_recipe"

  match "log_in"             => "sessions#new",             :as => "log_in"
  delete "log_out"           => "sessions#destroy"
  get   "sign_up"            => "users#new",                :as => "sign_up"

  get   "shopping_list"      => "shopping_lists#show",      :as => "shopping_list"
  match "shopping_list/:id"  => "shopping_lists#update",    :as => "add_recipe_to_shopping_list"
  delete "shopping_list"     => "shopping_lists#destroy",   :as => "clear_shopping_list"

  delete "sl_product_row/:id"=> "sl_product_rows#destroy",  :as => "delete_shopping_list_row"

  get "collection_block"     => "collection_blocks#show"
  post "collection_block"    => "collection_blocks#new",     :as => "new_collection_block"
  delete "collection_block"  => "collection_blocks#destroy", :as => "delete_collection_block"

  get "recipe_collections"   => "recipe_collections#index", :as => "recipe_collections"
  get "recipe_collection/:id"=> "recipe_collections#show",  :as => "show_recipe_collection"
  post "recipe_collection"   => "recipe_collections#new",   :as => "new_recipe_collection"
  delete "recipe_collection/:id" => "recipe_collections#destroy", :as => "delete_recipe_collection"

  resources :users, :only => ["index", "show", "create"]
  resources :sessions
  resources :recipes, :only => ["index", "show", "create", "edit"]
  # resources :shopping_lists
  # resources :recipe_collections

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
