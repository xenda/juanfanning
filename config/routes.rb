ActionController::Routing::Routes.draw do |map|
  
  map.devise_for :admins

  map.devise_for :users

  map.resources :projects

  map.resources :downloads

  map.resources :pages
  
  map.resources :shares
  
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
  
  map.namespace :member do |member|
    member.resources :downloads, :collection => { :recent => :get}, :member => { :share => :get , :request_print => :get}  
    member.resources :projects, :has_many => :downloads, :member => {:access => :get}  
    member.resources :shares
  end
  
  map.with_options :controller => "home" do |home|
    home.contact "/contact", :action => "contact"    
    home.home_share "/share",:action => "share"
    home.rss "/feed", :action => "rss", :format => "atom"
    home.search "/search", :action => "search"
    home.advanced_search "/search/advanced", :action => "advanced"
  end
  
  map.filter_date "/admin/reports/filter", :controller => "admin/reports", :action => "filter_date"
  map.filter_number "/admin/reports/filter/number", :controller => "admin/reports", :action => "filter_number"  
  map.autocomplete "/auto_complete_for_project_issuer", :controller => "projects", :action => "auto_complete_for_project_issuer"

  map.site "/web/:id", :controller=>"pages", :action=>"show"

  map.root :controller => 'home'


end
