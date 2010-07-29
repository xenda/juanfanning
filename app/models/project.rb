class Project < ActiveRecord::Base
  
  belongs_to :user
  has_many :downloads, :foreign_key => "document_id"
  
  PROJECT_TYPES = {
                    :preliminary=>"preliminary Official Statement",
                    :final=> "final Official Statement",
                    :notice => "preliminary Official Statement + Notice of Sale"
                  }
                  
  STATUS = { 
              :unpublished => "unpublished",
              :published => "uublished"
            }
            
  SALE_TYPE = {
                :competitive => "competitive",
                :negotiated => "negotiated"
              }
  
  
  
  # define_index do
  #    indexes project_type, :sortable => true
  #    indexes state
  #    indexes description
  #    indexes issuer
  #    indexes bond_amount
  #    indexes sale_type
  #    indexes status
  #    indexes author(:name), :as => :author, :sortable => true
  #    has user_id, created_at, updated_at
  #  end
  
   has_attached_file :document,:path => ":attachment/:id/:style.:extension", :storage => :s3, :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),  :bucket => "xendacentral.com-digitalmuni"
  
  named_scope :published, :conditions=>{:state => STATUS[:published]}
  named_scope :pending, :conditions=>{:state => STATUS[:unpublished]}
  
end







# == Schema Information
#
# Table name: projects
#
#  id                    :integer(4)      not null, primary key
#  project_type          :string(255)     default("preliminary"), not null
#  state                 :string(255)     default("unpublished"), not null
#  description           :text
#  published_at          :datetime
#  issuer                :string(255)
#  bond_amount           :decimal(12, 2)
#  sale_type             :string(255)     default("competitive")
#  status                :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  user_id               :integer(4)
#  delivery_date         :datetime
#  document_file_name    :string(255)
#  document_file_size    :integer(4)
#  document_content_type :string(255)
#  document_updated_at   :datetime
#  underwriters          :string(255)
#  ratings               :string(255)
#

