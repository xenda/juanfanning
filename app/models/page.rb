class Page < ActiveRecord::Base
  
  before_save :generate_slug
  validates_presence_of :title
  
  belongs_to :admin, :foreign_key => "user_id"
  
  STATUS = ["unpublished", "published"]
  
  def generate_slug
    unless self.slug
      self.slug = self.title.parameterize
    end
  end
  
  def self.get(name)
    Page.find_by_slug(name)
  end
  
  
  
end



# == Schema Information
#
# Table name: pages
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)     default("Untitled"), not null
#  content      :text
#  slug         :string(255)
#  published_at :string(255)
#  status       :string(255)     default("unpublished")
#  user_id      :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#  metatags     :text
#  head_title   :string(255)
#

