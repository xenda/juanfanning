# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def display_flashes
     flash_tags = [:error, :warning, :notice, :alert, :ok].map { |type| flash_tag(type, "message #{type}")}.join
     content_tag(:div,flash_tags,{:class=>"flash"})
  end

  def flash_tag(type,tag_class)
    content_tag(:span,flash[type],:class=>tag_class) unless flash[type].blank?
  end

  def body_classes
    [controller.controller_name,controller.action_name,@body_class].join(" ")
  end
  
  def copyright_notice
    page = Page.get("copyright-footer")
    return "© DigitalMuni" unless page
    strip_tags(page.content)
  end

  def colorize(project_type)
    
    red_targets = [Project::PROJECT_TYPES[:preliminary], Project::PROJECT_TYPES[:notice], Project::PROJECT_TYPES[:remarketing], Project::PROJECT_TYPES[:memorandum]]
    
    green_targets = [Project::PROJECT_TYPES[:circular],Project::PROJECT_TYPES[:offering]]
    
    blue_targets = [Project::PROJECT_TYPES[:supplement]]
    
    color_class = if red_targets.include? project_type
                    "red"
                  elsif green_targets.include? project_type
                    "green"
                  elsif blue_targets.include? project_type
                    "blue"
                  end

    content_tag(:span, project_type.humanize, :class => color_class)
    
  
  end
  
  
  def title
    title_name = "DigitalMuni"
    title_name <<  ":: #{@title}" if @title
    title_name
  end
end
