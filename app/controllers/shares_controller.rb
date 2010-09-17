class SharesController < InheritedResources::Base
  
  
  # actions :index, :show
    
  def create
    create! do |success,failure| 
      
      success.html do
        flash[:notice] = "The link was successfully shared"
        redirect_to root_path 
      end
      
      failure.html do 
        flash[:notice] = "There were some issues with when trying to share your link. Have you entered all the required info?"
        redirect_to home_share_path
      end
      
    end
  end
  
end
