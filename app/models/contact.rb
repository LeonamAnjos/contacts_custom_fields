class Contact < ActiveRecord::Base
    belongs_to :user
    before_save { self.email = email.downcase }

    store_accessor :custom_fields
    
    validates :name,    presence: true, 
                        length: { maximum: 50 }
                        
    validates :email,   presence: true, 
                        length: { maximum: 255 }, 
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                        uniqueness: true

    scope :of_user, lambda { |user| where(user_id: user.id) }    
    
    
end
