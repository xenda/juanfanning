class Admin::AdminsController < InheritedResources::Base
  
  layout "admin"
  before_filter :authenticate_admin!
  
  def index
    index!
  end
end