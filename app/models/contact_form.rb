class ContactForm < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :email
  
  after_create :send_form
  
  
  def send_form

      content_text = <<TEXT 
      <p>You've received a message from #{self.name} (#{self.email}):</p>
      #{self.message}
      <p><strong>Company</strong>: #{self.company} <strong>Phone</strong>: #{self.phone} </p>
TEXT

      options = { :list_id => $contact_id, :subject => "[DigitalMuni] Contact message from #{self.name} (#{self.email})", :from_email => "contact@digitalmuni.com", :from_name=> "DigitalMuni" }
      content = { :html => content_text }
      campaign_id = $hominid.create_campaign(options, content, "trans")

      email_list = ["info@digitalmuni.com"]

      $hominid.subscribe_many($contact_id,email_list.map{|i| {"EMAIL"=>i}})
      $hominid.send_now(campaign_id)
      # $hominid.delete(campaign_id)    
      $hominid.unsubscribe_many($contact_id,email_list)

  end
  
end

# == Schema Information
#
# Table name: contact_forms
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  company    :string(255)
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

