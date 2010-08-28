class Share < ActiveRecord::Base
  
  belongs_to :project
end

# == Schema Information
#
# Table name: shares
#
#  id         :integer(4)      not null, primary key
#  from       :string(255)
#  from_email :string(255)
#  to_email   :string(255)
#  subject    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  project_id :integer(4)
#  content    :text
#

