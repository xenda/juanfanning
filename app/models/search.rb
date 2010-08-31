class Search
  
  attr_accessor :keywords, :search_type, :results_type, :state, :underwriter, :timeframe, :sort, :sort_type
  
  SEARCH_TYPES = { "All Keywords" => "all", "Any Keywords" => "any", "Exact Keywords" => "exact"}
  RESULT_TYPES = { "Both" => "both", "Preliminaries only" => "preliminaries", "Finals Only" => "finals"}
  TIMEFRAMES = { "Past day" => "day", "Past week" => "week", "Past month" => "month", "Past year" => "year"}
  
  SORT_LIST = { "By date" => "date", "Alphabetically" => "alpha"}
  SORT_TYPES = { "Descending" => "desc", "Ascending" => "asc"  }
  
end