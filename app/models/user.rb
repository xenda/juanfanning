class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name, :role,:company, :address1, :address2, :city, :state, :zip, :phone, :interest 
  
 before_save :verify_change
 after_save :update_suscription

  ROLES = %w[user banned]
  SALE_TYPE = {
                :all => "all",
                :competitive => "competitive",
                :negotiated => "negotiated"
                
              }

  has_many :downloads
  named_scope :downloaders, :joins=>:downloads,:conditions=>["id in (select user_id from downloads group by user_id)"]
  
  def download_for(project)
    download = self.downloads.find(:all, :conditions => {:document_id => project.id })
    return download.first if download
    return nil
  end
  
  def verify_change
    logger.info "Verifying"
    @changed = (self.interest != self.interest_was)
    @interested = self.interest_was
    logger.info "Was #{@interested}"
    logger.info "Is now #{self.interest}"
  end
  
  def update_suscription
    logger.info "Changing"
    logger.info @changed
    if @changed
      logger.info "Changing"
      logger.info "Unsubscribing from #{@interested}"
      case @interested
        when SALE_TYPE[:all]
          unsuscribe_from($all_id)
        when SALE_TYPE[:competitive]
          unsuscribe_from($competitive_id)
        when SALE_TYPE[:negotiated]
          unsuscribe_from($negotiated_id)
      end
      
      case self.interest
        when SALE_TYPE[:all]
          suscribe_to($all_id)
        when SALE_TYPE[:competitive]
          suscribe_to($competitive_id)
        when SALE_TYPE[:negotiated]
          suscribe_to($negotiated_id)
      end
    end
    
  end
  
  def unsuscribe_from(list_id)
    logger.info "Unsuscribing from #{list_id}, email #{self.email}"
    $hominid.unsubscribe(list_id,self.email)
  end
  
  def suscribe_to(list_id)
    logger.info "Suscribing to #{list_id}"
    $hominid.subscribe(list_id,self.email)
  end
  
  
end



# == Schema Information
#
# Table name: users
#
#  id                   :integer(4)      not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  confirmation_token   :string(255)
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  name                 :string(255)
#  role                 :string(255)     default("user")
#  company              :string(255)
#  address1             :string(255)
#  address2             :string(255)
#  city                 :string(255)
#  state                :string(255)
#  zip                  :string(255)
#  phone                :string(255)
#

