class Member::SharesController < InheritedResources::Base
  
  before_filter :authenticate_user!
  
  # actions :index, :show
    
  def create
    flash[:notice] = "The document was successfully shared"
    create! { access_member_project_path(@share.project)  }
  end
  
end
