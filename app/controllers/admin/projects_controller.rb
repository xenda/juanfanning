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
  
  def collection
    @projects ||= end_of_association_chain.paginate :page => params[:page], :per_page => (params[:per_page] || 10), :order => "created_at DESC"
  end
  
end