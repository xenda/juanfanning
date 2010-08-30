ActionController::Routing::Routes.draw do |map|
  
	map.namespace :admin do |admin| 
		admin.resources :admins 
	end


  
	map.namespace :admin do |admin| 
		admin.resources :pages 
		admin.resources :admins
	end


  

  map.devise_for :admins

  map.resources :projects

  map.resources :downloads

  map.resources :pages

  map.devise_for :users
  map.site "/web/:id", :controller=>"pages", :action=>"show"
  map.root :controller => 'home'
  
  map.namespace :member do |member|
    member.resources :downloads, :collection => { :recent => :get}, :member => { :share => :get }  
    member.resources :projects, :has_many => :downloads, :member => {:access => :get}  
    member.resources :shares
  end
  
  map.namespace :admin do |admin|
    admin.connect "/", :controller => "home", :action => "index"
		admin.resources :projects, :member => { :publish => :get, :unpublish => :get }
		admin.reports "/reports", :controller => "reports", :action => "index"
  end
  
  map.rss "/feed", :controller => "home", :action => "rss", :format => "atom"
  map.search "/search", :controller => "home", :action => "search"
  map.filter_date "/admin/reports/filter", :controller => "admin/reports", :action => "filter_date"
  map.filter_number "/admin/reports/filter/number", :controller => "admin/reports", :action => "filter_number"  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.

  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
