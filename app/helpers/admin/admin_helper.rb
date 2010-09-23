module Admin::AdminHelper
  
  def app_models
    models = [] 
    Dir.glob( RAILS_ROOT + '/app/models/*' ).each do |f| 
      models << File.basename( f ).gsub( /^(.+).rb/, '\1') 
    end 
    models = models.reject{|i| ["download", "contact_form","search", "state", "share"].include? i }
    models = models.reject{|i| ["admin","page","user"].include? i } unless current_admin.complete?
    
    models
  end
  
  def file_name
    if @project.document_file_name
      @project.document_file_name
    else
      "None"
    end
  end
    
  def display_app_models_links(options = {})
    if options[:ul]
      list = ul_tag(app_models)
    else
      list = app_models.map{|item| li_tag(item) }
    end
    list
  end
  
  def ul_tag(items,options={})
    
    items_list = items.map{|item| li_tag(item) }.join
    content_tag(:ul,items_list,options)
  end
  
  def li_tag(item)    
       name = item
       name = "user list" if item.include? "user"
       name = "admin" if item.include? "admin"
       
       menu_label = t("activerecord.models.#{name.downcase}")
       
       menu_label = menu_label.pluralize unless menu_label.include? "user list" 
        content_tag(:li,link_to(menu_label,url_for(:controller=>"admin/#{item.downcase.pluralize}",:action=>"index")))
        
  end
  
  def summary(text)
    truncate(strip_tags(text),50)
  end
  
  def date(date_string)
    l(date_string,:format=>:short)
  end
  
  def image(picture)
    image_tag(picture.url(:thumbnail)) if picture
  end
  
end