class Share < ActiveRecord::Base
  
  belongs_to :project
  
  validates_presence_of :to_email, :on => :create, :message => "can't be blank"
  
  after_create :send_share
  
    def send_share

        options = { :list_id => $share_id, :subject => self.subject, :from_email => self.from_email, :from_name=> self.from }
        content = { :html => self.content }
        campaign_id = $hominid.create_campaign(options, content, "trans")

        email_list = [self.to_email]

        $hominid.subscribe_many($share_id,email_list.map{|i| {"EMAIL"=>i}})
        $hominid.send_now(campaign_id)
        # $hominid.delete(campaign_id)    
        $hominid.unsubscribe_many($share_id,email_list)

    end  
    
  
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

