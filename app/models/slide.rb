class Slide < ActiveRecord::Base
  
    has_attached_file :image, :styles => { :thumb =>"217x164#", :small => "32x32#", :medium=> "52x44#", :large => "290x244#"}
  
end
