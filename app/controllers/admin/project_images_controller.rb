class Admin::ProjectImagesController < InheritedResources::Base
  # belongs_to :project
  layout "simple"
  def index
    if params[:project_id]
      project = Project.find(params[:project_id])
      @project_images = project.project_images.paginate(:page => params[:page], :order => "created_at DESC")
      @project_image = project.project_images.build
      
    elsif session[:temp_id]
      @project_images = ProjectImage.paginate(:all, :conditions => ["temp_id like ?",session[:temp_id]], :page => params[:page], :order => "created_at DESC")
      @project_image = ProjectImage.new(:temp_id => session[:temp_id])
      
      
    end
  end
  
  def default_path
    if params[:project_id]
      admin_project_project_images_path
    else
      admin_project_images_path
    end
  end
  
  def create
    create! { default_path }
  end
  
  def destroy
    destroy!{ default_path }
  end
  
end
