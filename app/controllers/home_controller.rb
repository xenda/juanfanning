class HomeController < ApplicationController
  def index
    @projects = Project.published.paginate(:page => params[:page])
  end
  
  def search
    @projects = Project.published.search params[:terms]
    render "index"
  end
  
  def rss
    @projects = Project.paginate(:page => params[:page])
    respond_to do |wants|
      wants.html { render "index" }
      wants.atom { render "index" }
    end		
  end
end