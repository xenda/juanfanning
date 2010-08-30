class Download < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :project, :foreign_key => "document_id"
  
  named_scope :recent, :order=>"created_at DESC", :limit => 10
  attr_accessible :terms, :document_id, :user_id, :enabled_at
  
  validates_acceptance_of :terms
  
  named_scope :for_print, :conditions=>{:printed => true }
  
  def request_print
    self.printed = true
    self.save
  end
  
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
#  printed     :boolean(1)      default(FALSE)
#

