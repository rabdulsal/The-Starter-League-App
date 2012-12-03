Myapp::Application.routes.draw do

  get "comments/destroy"

  root to: 'pictures#index'

  resources :users

  resources :votes

  get "sessions/new" => 'sessions#new', :as => 'login'
  post "sessions" => 'sessions#create'
  get "logout" => 'sessions#destroy', :as => 'logout'

   # ------------------- PICTURES ----------------------

  get "/pictures", :controller => 'Pictures', :action => 'index' 
  post "/pictures", :controller => 'Pictures', :action => 'create'
  get "/pictures/new", :controller => 'Pictures', :action => 'new'  
  match "/new_picture" => "Pictures#new"
  get "/pictures/:id", :controller => 'Pictures', :action => 'show'
  delete "/pictures/:id", :controller => 'Pictures', :action => 'destroy'
  get "/pictures/:id/edit", :controller => 'Pictures', :action => 'edit', :as => 'picture'
  put "/pictures/:id/edit", :controller => 'Pictures', :action => 'update'
  post "/pictures/:id/comments" => 'Pictures#comment_create', as: 'new_comment'
  
  # ------------------ COMMENTS ----------------------

  get "/comments" => 'Pictures#comment_index'
  delete "/comments/:id" => 'Pictures#comment_destroy'
  post "/comments" => 'Pictures#comment_create'
  get "/comments/new" => 'Comments#new'
  get "/comments/:id" => 'Pictures#comment_show'
  
  

  #Key concept with the below controller is that custom Pages;
  #whether the user is logged-in or not, for instance
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
