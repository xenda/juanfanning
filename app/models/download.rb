class Download < ActiveRecord::Base
  
  belongs_to :object, :class_name => "Object", :foreign_key => "object_id"
  
end

# == Schema Information
#
# Table name: downloads
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  document_id :integer(4)
#  enabled_at  :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

