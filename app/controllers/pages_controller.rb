class PagesController < InheritedResources::Base

  def show
    @page = Page.find_by_slug(params[:id])
    @page = Page.find_by_id(params[:id]) unless @page
    if @page
      @title = @page.head_title
      @tags = @page.metatags
      show!
    else
      redirect_to root_path
    end
  end

end
