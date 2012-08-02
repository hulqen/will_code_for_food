Matplanera::Application.routes.draw do

  match "log_in"             => "sessions#new",             :as => "log_in"
  delete "log_out"           => "sessions#destroy"
  get   "sign_up"            => "users#new",                :as => "sign_up"

  post "shopping_list/:id"   => "shopping_lists#add_recipe",:as => "add_recipe_to_shopping_list"
  delete "shopping_list/:id" => "shopping_lists#destroy",   :as => "clear_shopping_list"

  delete "sl_product_row/:id"  => "sl_product_rows#destroy",:as => "delete_shopping_list_row"
  get "sl_product_row/:product_name" => "sl_product_rows#shop",   :as => "product_shop"
  put "sl_product_row/:product_name" => "sl_product_rows#unshop", :as => "product_unshop"

  get "sl_custom_row/:id" => "sl_custom_rows#shop",   :as => "custom_product_shop"
  put "sl_custom_row/:id" => "sl_custom_rows#unshop", :as => "custom_product_unshop"

  post "collection_blocks/:id" => "collection_blocks#edit", :as => "add_recipe_to_collection"

  resources :users, :only => [:index, :show, :create]
  resources :sessions
  resources :recipes
  resources :collection_blocks, :except => :edit
  resources :recipe_collections
  resource :shopping_list, :except => :destroy
  resources :block_contents, :only => :update

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
