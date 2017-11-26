class User < ActiveRecord::Base
  
  has_and_belongs_to_many :teams 
  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  def self.list_of_users
    User.pluck(:email,:id)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
