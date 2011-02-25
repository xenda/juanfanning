class Admin::ProjectsController < InheritedResources::Base
  
  layout "admin"
  before_filter :authenticate_admin!
      
  def new
    @project = Project.new
    session[:temp_id] = Digest::MD5.hexdigest(Time.zone.now.to_s)
    new!
  end    
      
  def create
    create! { 
      
      ProjectImage.find_all_by_temp_id(session[:temp_id]).each{|i| i.project = @project;i.save}
      session[:temp_id] = nil
      admin_projects_path
    
      }
  end
  
  def update
    @project = Project.find(params[:id])
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
  
  def reorder
    @projects = Project.find(:all, :order => "position" )
  end
  
  def order
      projects = Project.all
      projects.each do |project|
        project.position = params['project'].index(project.id.to_s) + 1
        project.save
      end
      render :nothing => true
  end
  
  def index
    if params[:filter]
      if params[:filter] == "active"
        @projects = Project.published.paginate :page => params[:page], :order => "updated_at DESC" 
      else
        @projects = Project.pending.paginate :page => params[:page],:order => "updated_at DESC" 
      end
    else
      @projects = Project.paginate :page => params[:page],:order => "created_at DESC" 
    end
    index!
  end
  
  def collection
    @projects ||= end_of_association_chain.paginate :page => params[:page], :per_page => (params[:per_page] || 10), :order => "updated_at DESC"
  end
  
end