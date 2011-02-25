class HomeController < ApplicationController
  
   #before_filter :authenticate_user!, :except => :rss
      
  def index
    @projects = Project.published.paginate(:page => params[:page], :per_page => params[:per_page], :order => "position") #[Project.new] * 10 # 
  end
  
  def page
    if page = Page.find_by_slug(params[:slug])
      redirect_to page
    else
      redirect_to root_path
    end
  end
  
end