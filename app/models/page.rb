class Page < ActiveRecord::Base
  
  after_save :generate_slug
  validates_presence_of :title
  
  belongs_to :user
  
  def generate_slug
    unless self.slug
      self.slug = self.title.parameterize
      self.save
    end
  end
  
end
