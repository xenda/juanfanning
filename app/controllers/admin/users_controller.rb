class Admin::UsersController < InheritedResources::Base
  
  layout "admin"
  before_filter :authenticate_admin!
  
  def index
    @users = User.paginate :page => params[:page]
    index!
  end
  
  def update
    update! { admin_users_path }
  end
  
  def create
    create! { admin_users_path}
  end
end