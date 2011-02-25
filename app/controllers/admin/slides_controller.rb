class Admin::SlidesController < InheritedResources::Base
  
  layout "admin"
  before_filter :authenticate_admin!
              
  def collection
    @slides ||= end_of_association_chain.paginate :page => params[:page], :per_page => (params[:per_page] || 10), :order => "updated_at DESC"
  end
  
end