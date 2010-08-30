class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :role,:name,:remember_me
  
  ROLES = %w[admin supervisor]
  
  has_many :pages, :class_name => "page", :foreign_key => "user_id"
  has_many :projects,:foreign_key => "user_id"
  named_scope :uploaders, :conditions=>{:role => "supervisor"}
  
  def upgrade
    self.role = "admin"
    self.save
  end
  
  def complete?
    role != "supervisor"
  end
    
end


# == Schema Information
#
# Table name: admins
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
#  role                 :string(255)     default("supervisor")
#  name                 :string(255)
#

