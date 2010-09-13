class Member::SharesController < InheritedResources::Base
  
  before_filter :authenticate_user!
  
  # actions :index, :show
    
  def create
    create! do |success,failure| 
      
      success.html do
        flash[:notice] = "The document was successfully shared"
        redirect_to root_path 
      end
      
      failure.html do 
        flash[:notice] = "There were some issues with when trying to share your link. Have you entered all the required info?"
        redirect_to share_member_download_path(@share.project.last_download_from_user(current_user))
      end
      
    end
  end
  
end
