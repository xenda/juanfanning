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
  
  def share
    @download = Download.find(params[:id])
    @share = Share.new
    @share.project = @download.project
    @share.from = current_user.name
    @share.from_email = current_user.email
    @share.subject = "[DigitalMuni] Document Link: #{@download.project.issuer_name}"
    @share.content = "#{@share.from} has sent you a link to the following offering: \n\n\n#{@download.project.issuer_name}\n#{@download.project.description}\n#{access_member_project_url(@download.project)}\n\n\nhttp://digitalmuni.com\nDigitalMuni"
  end
  
end
