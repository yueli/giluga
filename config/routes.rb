Giluga::Application.routes.draw do

  # get "static_pages/home"
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
 
  root to: 'home#index'

  get 'home' => 'home#index', as: 'home'
  
# get "static_pages/about"
  match 'demo', to: 'home#demo'

  # get "static_pages/help"
  match 'help', to: 'static_pages#help'
  
  # get "static_pages/about"
  match 'about', to: 'static_pages#about'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
   # match '/resource/:str' => 'resources#list'
    
  # match resource/list?category='a' to resource/a
  match 'resource/:category' => 'resources#list', :as => 'atoz'
  
  # match subject/list?subject='chemistry' to subject/chemistry
  match 'subject/:subject' => 'subjects#list', :as => 'subname'  
  
  match "refresh" => "subjects#refresh"  # match "/update_resources" => "subjects#update_resources"

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
  # root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
  
  #Last route in routes.rb
  # match '*a', :to => 'home#routing_error'
  
  #unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  #end
 
end
