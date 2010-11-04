class Admin::DepartmentImagesController < InheritedResources::Base
  # belongs_to :department
  layout "simple"
  def index
    if params[:department_id]
      department = Department.find(params[:department_id])
      @department_images = department.department_images.paginate(:page => params[:page], :order => "created_at DESC")
      @department_image = department.department_images.build
      
    elsif session[:department_temp_id]
      @department_images = DepartmentImage.paginate(:all, :conditions => ["temp_id like ?",session[:department_temp_id]], :page => params[:page], :order => "created_at DESC")
      @department_image = DepartmentImage.new(:temp_id => session[:department_temp_id])
    end
  end
  
  def default_path
    if params[:department_id]
      admin_department_department_images_path
    else
      admin_department_images_path
    end
  end
  
  def create
    create! { default_path }
  end
  
  def destroy
    destroy!{ default_path }
  end
  
end
