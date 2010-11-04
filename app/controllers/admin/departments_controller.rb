class Admin::DepartmentsController < InheritedResources::Base
  
  layout "admin"
  before_filter :authenticate_admin!
  belongs_to :project
      
  def new
    session[:department_temp_id] = Digest::MD5.hexdigest(Time.zone.now.to_s)
    new!
  end    
  
  # def edit
  #   # session[:department_temp_id] = Digest::MD5.hexdigest(Time.zone.now.to_s)
  #   # new!    
  # end
      
  def create
    create! { 
      
      DepartmentImage.find_all_by_temp_id(session[:department_temp_id]).each{|i| i.department = @department;i.save}
      session[:department_temp_id] = nil
      admin_project_departments_path(@department.project)
    
      }
  end
  
  def update
    update! { admin_project_departments_path(@department.project) }
  end
  
  def index
    index!
  end
  
  def collection
    @departments ||= end_of_association_chain.paginate :page => params[:page], :per_page => (params[:per_page] || 10), :order => "updated_at DESC"
  end
  
end