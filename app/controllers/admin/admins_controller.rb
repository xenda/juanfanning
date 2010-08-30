class Admin::AdminsController < InheritedResources::Base
  
  layout "admin"
  before_filter :authenticate_admin!
  
  def index
    @admins = Admin.paginate :page => params[:page]
    index!
  end
  
  def update
    update! { admin_admins_path }
  end
  
  def create
    create! { admin_admins_path}
  end
end