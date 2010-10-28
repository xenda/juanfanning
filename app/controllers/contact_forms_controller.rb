class ContactFormsController < InheritedResources::Base
  
  def create
    create! do |s,f| 
      
      s.html { 
        flash[:notice] = "Consulta enviada exitosamente"
        redirect_to root_path 
      
      }
      f.html { 
  
        flash[:notice] = "Hubieron problemas enviando tu formulario. ¿Enviaste todos los datos necesarios?"
        render "home/contact"

      }
      
    end
  end
  
end
