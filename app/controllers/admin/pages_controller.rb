class Admin::PagesController < InheritedResources::Base
  
  layout "admin"
  before_filter :authenticate_admin!
  
  def create
    create! { admin_pages_path }
  end
  
  def update
    update! { admin_pages_path }
  end
  
  def collection
    @pages ||= end_of_association_chain.paginate :page => params[:page], :per_page => (params[:per_page] || 10), :order => "created_at DESC"
  end
  
end