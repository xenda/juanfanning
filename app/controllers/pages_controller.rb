class PagesController < InheritedResources::Base

  def show
    if @page = Page.find(params[:id])
      @title = @page.head_title
      @tags = @page.metatags
      show!
    else
      redirect_to root_path
    end
  end
  
  def contact
    
  end

end
