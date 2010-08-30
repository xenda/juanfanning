class Member::ProjectsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def access
    # download =  current_user.download_for(Project.find(params[:id]))
    # # if download
    # #   redirect_to member_download_path(download) 
    # # else
    # #   redirect_to new_member_download_path(:project_id => params[:id])
    # # end
    # # 
    redirect_to new_member_download_path(:project_id => params[:id])
  end

  
  def collection
    @projects ||= end_of_association_chain.paginate :page => params[:page], :per_page => (params[:per_page] || 10), :order => "created_at DESC"
  end
  
end