class ContactCustomField < ActiveRecord::Base
  belongs_to :user
  before_save { self.field_name = name.strip.gsub(' ', '_').downcase } 
  
  scope :of_user, lambda { |user| where(user_id: user.id) }
end
