class Download < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :document
  
  named_scope :recent, :order=>"created_at DESC", :limit => 10
  
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

