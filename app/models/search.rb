class Search
  
  attr_accessor :keywords, :search_type, :results_type, :state, :underwriter, :timeframe, :sort, :sort_type
  
  SEARCH_TYPES = { "All Keywords" => "all", "Any Keywords" => "any", "Exact Keywords" => "exact"}
  RESULT_TYPES = {"Final Only" => "finals","Preliminary only" => "preliminaries","Both" => "both"}
  TIMEFRAMES = { "Past day" => "day", "Past week" => "week", "Past month" => "month", "Past year" => "year"}
  
  SORT_LIST = { "By date" => "date", "Alphabetically" => "alpha"}
  SORT_TYPES = { "Descending" => "desc", "Ascending" => "asc"  }
  
  def initialize(params)

     params.each do |key,value|
       self.send("#{key}=",value)
     end
     
  end
  
  def timeframe_range
    if self.timeframe.present?
      
      range = case self.timeframe
        when TIMEFRAMES["Past day"]
          1.day.ago.beginning_of_day..Time.zone.now.end_of_day
        when TIMEFRAMES["Past week"]
          1.week.ago.beginning_of_week..1.week.ago.end_of_week
        when TIMEFRAMES["Past month"]
          1.month.ago.beginning_of_month..1.month.ago.end_of_month
        when TIMEFRAMES["Past year"]
          1.year.ago.beginning_of_year..1.year.ago.end_of_year
        end
        
        
    else
      
        nil
        
    end
    
  end
  
  def sphinx_search_type
  
    if self.search_type.present?
      
      type = case self.search_type
        
              when SEARCH_TYPES["All Keywords"]
                :all
              when SEARCH_TYPES["Any Keywords"]
                :any
              when SEARCH_TYPES["Exact Keywords"]
                :phrase  
              end
      
    else
      :all
    end
    
  end
  
  def sphinx_result_type
    
    if self.results_type.present?
      case self.results_type
        
        when RESULT_TYPES["Both"]
          nil
        when RESULT_TYPES["Preliminaries only"]
          0
        when RESULT_TYPES["Finals Only"]
          1
      end
    else
      nil
    end
    
    
  end
  
  
  # PROJECT_TYPES = {
  #                     :preliminary=>"preliminary Official Statement",
  #                     :final=> "final Official Statement",
  #                     :notice => "preliminary Official Statement + Notice of Sale"
  #                   }
  #   
  
end