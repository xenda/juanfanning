class Member::DownloadsController < InheritedResources::Base
  
  before_filter :authenticate_user!
  
  # actions :index, :show
  
  def recent
    @downloads = current_user.downloads.recent
  end
  
  def new
    @project = Project.find(params[:project_id])
    @download = @project.downloads.build
  end
  
end
