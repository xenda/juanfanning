class Admin::ReportsController < ApplicationController
  
  layout "admin"
  before_filter :authenticate_admin!
  
  
  def index
      
      @downloads = Download.paginate :page => params[:page]
        
  end
  
  def print
    @downloads = Download.for_print.paginate :page => params[:page]
  end
  
  def filter_date
    to = params[:to]
    from = params[:from]
    to_date = Date.parse("#{to[:month]}/#{to[:day]}/#{to[:year]}")
    from_date = Date.parse("#{from[:month]}/#{from[:day]}/#{from[:year]}")
    @downloads = Download.paginate(:all, :conditions =>{:created_at => from_date.at_beginning_of_day...to_date.end_of_day}, :page => params[:page])
    render "index"
  rescue
    redirect_to :action => "index"
  end
  
  def filter_number
    @downloads = [].paginate
    project = Project.find(:all, :conditions => ["bond_number like ?","%#{params[:number]}%"])
    if project and not project.empty?
      @downloads = project.first.downloads.paginate :page => params[:page]
    end
    render "index"
  end
  
end