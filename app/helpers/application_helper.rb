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
  
  def title
    title_name = "DigitalMuni"
    title_name <<  ":: #{@title}" if @title
    title_name
  end
end
