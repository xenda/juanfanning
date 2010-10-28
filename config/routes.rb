ActionController::Routing::Routes.draw do |map|
  map.resources :project_images

  
  map.devise_for :admins

  map.resources :projects, :as => "proyectos"

  map.resources :pages, :as => "paginas"
  
  map.resources :contact_forms
  
  map.namespace :admin do |admin| 
		admin.resources :pages 
    admin.connect "/", :controller => "home", :action => "index"
    admin.resources :project_images
		admin.resources :projects, :member => { :publish => :get, :unpublish => :get }, :has_many => :project_images
	end
    
  map.with_options :controller => "home" do |home|
    home.web "/web/:slug", :action => "page"
  end
  
  map.site ":slug", :controller => "pages", :action => "show"
  map.root :controller => 'home'

end
