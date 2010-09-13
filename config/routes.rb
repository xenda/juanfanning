ActionController::Routing::Routes.draw do |map|
  map.resources :contact_forms

  
	map.namespace :admin do |admin| 
		admin.resources :pages 
		admin.resources :admins
    admin.resources :users
    admin.connect "/", :controller => "home", :action => "index"
		admin.resources :projects, :member => { :publish => :get, :unpublish => :get }
		admin.reports "/reports", :controller => "reports", :action => "index"
		admin.prints "/reports/printed", :controller => "reports", :action => "print"
    
	end

  map.devise_for :admins

  map.resources :projects

  map.resources :downloads

  map.resources :pages

  map.devise_for :users

  map.site "/web/:id", :controller=>"pages", :action=>"show"
  map.contact "/contact", :controller => "home", :action => "contact"

  map.root :controller => 'home'
  
  map.namespace :member do |member|
    member.resources :downloads, :collection => { :recent => :get}, :member => { :share => :get , :request_print => :get}  
    member.resources :projects, :has_many => :downloads, :member => {:access => :get}  
    member.resources :shares
  end
  
  map.rss "/feed", :controller => "home", :action => "rss", :format => "atom"
  map.search "/search", :controller => "home", :action => "search"
  map.advanced_search "/search/advanced", :controller => "home", :action => "advanced"
  map.filter_date "/admin/reports/filter", :controller => "admin/reports", :action => "filter_date"
  map.filter_number "/admin/reports/filter/number", :controller => "admin/reports", :action => "filter_number"  
  map.autocomplete "/auto_complete_for_project_issuer", :controller => "projects", :action => "auto_complete_for_project_issuer"

end
