class Project < ActiveRecord::Base
  
  belongs_to :admin, :foreign_key => "user_id"
  has_many :downloads, :foreign_key => "document_id"
  has_many :shares
  
  PROJECT_TYPES = {
                    :preliminary=>"preliminary Official Statement",
                    :final=> "final Official Statement",
                    :notice => "preliminary Official Statement + Notice of Sale"
                  }
                  
  STATUS = { 
              :unpublished => "unpublished",
              :published => "published"
            }
            
  SALE_TYPE = {
                :competitive => "competitive",
                :negotiated => "negotiated"
              }
                  
  define_index do
     indexes project_type, :sortable => true
     indexes state
     indexes cusip
     indexes description
     indexes issuer
     indexes bond_amount
     indexes sale_type
     indexes underwriters
     indexes ratings
     indexes admin(:name), :as => :author, :sortable => true
     has user_id, created_at, updated_at
     set_property :delta => true
     where "status = 'published'"
   end
  
   has_attached_file :document,:path => "#{RAILS_ROOT}/public/system/:attachment/:id/:style.:extension", :url => "/system/:attachment/:id/:style.:extension" #, :storage => :s3, :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),  :bucket => "xendacentral.com-digitalmuni"
   
   has_attached_file :preview,:path => "#{RAILS_ROOT}/public/system/:attachment/:id/:style.:extension", :url => "/system/:attachment/:id/:style.:extension", :styles => {:small => "300x400"} #, :storage => :s3, :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),  :bucket => "xendacentral.com-digitalmuni"
  
  named_scope :published, :conditions=>{:status => STATUS[:published]}
  named_scope :pending, :conditions=>{:status => STATUS[:unpublished]}
  
  def update_thumbnail(file)
    url = file.path
    logger.info(url)
    id = self.id
    id ||= Time.zone.now
    @output_file_path = File.join(RAILS_ROOT,"public","/system/documents/#{id}/original")
    FileUtils.mkdir_p(@output_file_path)
    copied_file = "#{@output_file_path}/original.pdf"
    FileUtils.mv(file.path,copied_file)
    
    logger.info(@output_file_path)
    Docsplit.extract_images(copied_file, :pages => [1], :output => @output_file_path, :size => "300x400")
    self.preview = File.open("#{@output_file_path}/original_1.png")
    
  end
  
  def document=(file)
    update_thumbnail(file)    
    attachment_for(:document).assign(file)
  end
  
  def issuer_name
    self.issuer.present? ? self.issuer : "Unnamed issuer"
  end
  
  def publish
    self.status = STATUS[:published]
    notify_suscribers
    self.save
  end
  
  def unpublish
    self.status = STATUS[:unpublished]
    # notify_suscribers
    self.save
  end
  
  def notify_suscribers
    
  content_text = <<TEXT 
  
  <p>A new project has been uploaded to DigitalMuni:</p>
  <p>You can check the details following the link below:</p>
  
  <a href="http://digitalmuni.com/member/projects/#{self.id}/access">#{self.issuer_name}</a>
  
TEXT
    
    case self.sale_type
      when  SALE_TYPE[:competitive]
         list_id = $competitive_id
      when SALE_TYPE[:negotiated]
         list_id = $negotiated_id
    end
    
    all_list_id = $all_id
    options = {:list_id => list_id, :subject => "[DigitalMuni] A new project uploaded", :from_email => "contact@digitalmuni.com",
                :from_name=> "DigitalMuni"}
    content = {:html => content_text}
    logger.info "Creating a new campaign"
    campaign_id = $hominid.create_campaign(options, content, "trans")
    $hominid.send(campaign_id)
    logger.info "Sending email to suscribers"
    #$hominid.delete(campaign_id)
    
    
    options[:list_id] = all_list_id
    campaign_id = $hominid.create_campaign(options, content, "trans")

    logger.info "Sending email to suscribers"
    $hominid.send(campaign_id)

    #$hominid.delete(campaign_id)    
  end
  
  
  def unpublish
    self.status = STATUS[:unpublished]
    self.save
  end
  
  def published?
    self.status == STATUS[:published]
  end
  
end












# == Schema Information
#
# Table name: projects
#
#  id                    :integer(4)      not null, primary key
#  project_type          :string(255)     default("preliminary"), not null
#  state                 :string(255)     default("0"), not null
#  description           :text
#  published_at          :datetime
#  issuer                :string(255)
#  bond_amount           :decimal(12, 2)
#  sale_type             :string(255)     default("competitive")
#  status                :string(255)     default("unpublished")
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
#  preview_file_name     :string(255)
#  preview_file_size     :integer(4)
#  preview_content_type  :string(255)
#  preview_updated_at    :datetime
#  cusip                 :string(255)
#  delta                 :boolean(1)      default(TRUE), not null
#  bond_number           :string(255)
#

