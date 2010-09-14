class HomeController < ApplicationController
  
    before_filter :authenticate_user!, :except => :rss
      
  def index
    @projects = Project.published.paginate(:page => params[:page], :per_page => params[:per_page], :order => "updated_at DESC")
  end
  
  def search
     
     if params[:search]
       search = Search.new(params[:search])
       logger.info search.inspect
       conditions, with  = {},{}
       
       conditions.merge! ({:underwriters => search.underwriter}) if search.underwriter.present?
       conditions.merge! ({:state => search.state}) if search.state.present?
       
       range = search.timeframe_range 
       with.merge! ({:updated_at => range}) if range
       
       match_mode = search.sphinx_search_type
       
       results_type = search.sphinx_result_type
       
       if results_type
         with.merge! ( {:project_type_mapping => results_type } )
       end
       
       if search.sort == "alpha"
         order = :issuer
       elsif search.sort == "date"
         order = :updated_at
       end

       sort_type = search.sort_type.to_sym if search.sort_type.present?
       
       logger.info conditions.inspect
       logger.info with.inspect
       logger.info order.inspect
       logger.info sort_type.inspect
       
       @projects = Project.search search.keywords, :conditions => conditions, :with => with, :order => order, :sort_mode => sort_type
       
     else
       @projects = Project.search params[:terms]
     end
    
    
    render "index"
  end
  
  def rss
    @projects = Project.published.paginate(:page => params[:page], :order => "created_at DESC")
    respond_to do |wants|
      wants.html { render "index" }
      wants.atom { render "index" }
    end		
  end
end