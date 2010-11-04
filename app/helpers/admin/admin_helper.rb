module Admin::AdminHelper
  
  def text_button_tag(text,path, options={})  
    options.merge!({:class => "button"})
    link_to content_tag(:span,content_tag(:span,text)), path, options
  end
  
  def pretty_button_tag(text, options = {})
    content_tag(:button,content_tag(:span,content_tag(:span,text)),options)
  end
  
  def app_models
    models = [] 
    Dir.glob( RAILS_ROOT + '/app/models/*' ).each do |f| 
      models << File.basename( f ).gsub( /^(.+).rb/, '\1') 
    end 
    models = models.reject{|i| ["contact_form","state","admin","project_image","department","department_image"].include? i }    
    models
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