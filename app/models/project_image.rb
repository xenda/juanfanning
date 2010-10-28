class ProjectImage < ActiveRecord::Base
  
  belongs_to :project
  
  has_attached_file :image, :styles => { :thumb =>"217x164#", :small => "32x32#", :medium=> "52x44#", :large => "290x244#"}
  
  def self.per_page
    4
  end
  
end


# == Schema Information
#
# Table name: project_images
#
#  id                 :integer(4)      not null, primary key
#  project_id         :integer(4)
#  image_file_name    :string(255)
#  image_file_size    :integer(4)
#  image_content_type :string(255)
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  temp_id            :string(255)
#

