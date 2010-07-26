class PagesController < InheritedResources::Base

  def show
    @page = Page.find_by_slug(params[:id])
    @page = Page.find_by_id(params[:id]) unless @page
    show!
  end

end