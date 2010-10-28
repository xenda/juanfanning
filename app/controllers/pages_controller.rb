class PagesController < InheritedResources::Base

  def show
    if @page = Page.find_by_slug(params[:id])
      @title = @page.head_title
      @tags = @page.metatags
      show!
    else
      redirect_to root_path
    end
  end

end
