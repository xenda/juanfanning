ActionController::Routing::Routes.draw do |map|
  map.resources :slides

  map.resources :department_images

  map.resources :departments

  map.resources :project_images

  
  map.devise_for :admins

  map.resources :projects, :as => "proyectos" do |projects|
    projects.resources :departments, :as => "departamentos"
  end

  map.resources :pages, :as => "paginas"
  
  map.resources :contact_forms
  
  map.namespace :admin do |admin| 
		admin.resources :pages 
    admin.connect "/", :controller => "home", :action => "index"
    admin.resources :project_images
    admin.resources :department_images
    admin.resources :slides
		admin.resources :projects, :member => { :publish => :get, :unpublish => :get }, :collection => {:reorder => :get, :order => :post} do |projects|
		  projects.resources :project_images
		  projects.resources :departments, :has_many => :department_images
	  end
	end
    
  map.with_options :controller => "home" do |home|
    home.web "/web/:slug", :action => "page"
  end
  
  map.contact "/contacto", :controller => "pages", :action => "contact"
  map.site ":slug", :controller => "pages", :action => "show"
  map.root :controller => 'home'

end
