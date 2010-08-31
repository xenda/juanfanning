class HomeController < ApplicationController
  
    before_filter :authenticate_user!
  
  def index
    @projects = Project.published.paginate(:page => params[:page], :per_page => params[:per_page])
  end
  
  def search
     
     if params[:search]
       search = Search.new(params[:search])
       
       terms = search.keywords
       conditions, with  = {},{}
       
       conditions.merge! ({:underwriters => search.underwriters}) if search.underwriters.present?
       conditions.merge! ({:project_type => Project::PROJECT_TYPES[search.sphinx_result_type]}) if search.results_type.present?
       
       range = search.timeframe_range 
       with.merge! ({:updated_at => range}) if range
       
       match_mode = search.sphinx_search_type
       
       # SEARCH_TYPES = { "All Keywords" => "all", "Any Keywords" => "any", "Exact Keywords" => "exact"}
       # RESULT_TYPES = { "Both" => "both", "Preliminaries only" => "preliminaries", "Finals Only" => "finals"}
       # TIMEFRAMES = { "Past day" => "day", "Past week" => "week", "Past month" => "month", "Past year" => "year"}
       # 
       # SORT_LIST = { "By date" => "date", "Alphabetically" => "alpha"}
       # SORT_TYPES = { "Descending" => "desc", "Ascending" => "asc"  }
       # 
       #"results_type"=>"preliminaries", "sort_type"=>"desc", "sort"=>"alpha", "keywords"=>"Alvaro", "state"=>"Alabama"}
       
       
       # PROJECT_TYPES = {
       #                   :preliminary=>"preliminary Official Statement",
       #                   :final=> "final Official Statement",
       #                   :notice => "preliminary Official Statement + Notice of Sale"
       #                 }

       
       # define_index do
       #    indexes project_type, :sortable => true
       #    indexes state
       #    indexes cusip
       #    indexes description
       #    indexes issuer
       #    indexes bond_amount
       #    indexes sale_type
       #    indexes underwriters
       #    indexes ratings
       #    indexes admin(:name), :as => :author, :sortable => true
       #    has user_id, created_at, updated_at
       #    set_property :delta => true
       #    where "status like 'published'"
       #  end
       
       @projects = Project.published.search search.keywords
       
     else
       @projects = Project.published.search params[:terms]
     end
    
    
    render "index"
  end
  
  def rss
    @projects = Project.paginate(:page => params[:page])
    respond_to do |wants|
      wants.html { render "index" }
      wants.atom { render "index" }
    end		
  end
end