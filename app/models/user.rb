class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :contacts         
  has_many :contact_fields, class_name: 'ContactCustomField'
  
  validates :name, presence: true, length: { maximum: 30 }
  
end
