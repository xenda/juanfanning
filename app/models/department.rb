class Department < ActiveRecord::Base
  
  belongs_to :project
  has_many :department_images
  
  
end

# == Schema Information
#
# Table name: departments
#
#  id              :integer(4)      not null, primary key
#  size            :string(255)
#  bathroom_number :string(255)
#  garages_number  :string(255)
#  rooms_number    :string(255)
#  project_id      :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

