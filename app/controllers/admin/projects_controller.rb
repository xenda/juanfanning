class Admin::ProjectsController < InheritedResources::Base
  
  layout "admin"
  before_filter :authenticate_admin!
  
  def new
    @project = Project.new
    @project.state = ""
    new!
  end
    
  def create
    create! { admin_projects_path }
  end
  
  def update
    update! { admin_projects_path }
  end
  
  def publish
    @project = Project.find(params[:id])
    @project.publish
    redirect_to admin_projects_path
  end
  
  def unpublish
    @project = Project.find(params[:id])
    @project.unpublish
    redirect_to admin_projects_path
  end
  
  def index
    if current_admin.complete?
      projects = Project
    else
      projects = current_admin.projects
    end
    
    if params[:filter]
      if params[:filter] == "active"
        @projects = projects.published.paginate :page => params[:page] 
      else
        @projects = projects.pending.paginate :page => params[:page]
      end
    else
      @projects = projects.paginate :page => params[:page]
    end
    index!
  end
  
  def collection
    @projects ||= end_of_association_chain.paginate :page => params[:page], :per_page => (params[:per_page] || 10), :order => "created_at DESC"
  end
  
end