class Member::DownloadsController < InheritedResources::Base
  
  before_filter :authenticate_user!
  
  # actions :index, :show
  
  def recent
    @downloads = current_user.downloads.recent.paginate :page => params[:page]
  end
  
  def new
    @project = Project.find(params[:project_id])
    flash[:notice] = ""
    @download = @project.downloads.build
  end
  
  def create
    create! do |success, failure|
        
        success.html { 
            flash[:notice] = ""
            redirect_to ["member",@download] 
            }
        failure.html { 
          flash[:notice] = "You need to accept the terms and conditions before continuing"
          render :new
        }
      end
  end
  
  def request_print
    @download = Download.find(params[:id])
    @download.request_print
    redirect_to member_download_path(@download)
    flash[:notice] = "We've received your request for a printed copy and will respond shortly."
  end
  
  def share
    @download = Download.find(params[:id])
    @share = Share.new
    @share.project = @download.project
    @share.from = current_user.name
    @share.from_email = current_user.email
    @share.subject = "[DigitalMuni] Document Link: #{@download.project.issuer_name}"
    @share.content = "#{@share.from} has sent you a link to the following offering: <br /><br />#{@download.project.description}\n<a href='http://digitalmuni.com#{@download.project.document.url}'>#{@download.project.issuer_name}</a><p>http://digitalmuni.com\nDigitalMuni</p>"
  end
  
end
