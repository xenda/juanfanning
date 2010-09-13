class ContactFormsController < InheritedResources::Base
  
  def create
    create! do |s,f| 
      
      s.html { 
        flash[:notice] = "Your contact form was succesfully sent"
        redirect_to root_path 
      
      }
      f.html { 
  
        flash[:notice] = "There were some issues while sending your contact form. Did you entered all your required details?"
        render "home/contact"

      }
      
    end
  end
  
end
