class DepartmentImage < ActiveRecord::Base
  
  has_attached_file :image, :styles => { :thumb =>"217x164#", :small => "32x32#", :medium=> "52x44#", :large => "290x244#"}
  
  belongs_to :department
  
end

# == Schema Information
#
# Table name: department_images
#
#  id                 :integer(4)      not null, primary key
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  department_id      :integer(4)
#  temp_id            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

