class Member::DownloadsController < InheritedResources::Base
  
  before_filter :authenticate_user!
  
  actions :index, :show
  
end
