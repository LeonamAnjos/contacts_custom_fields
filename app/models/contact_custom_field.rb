class ContactCustomField < ActiveRecord::Base
  belongs_to :user
  
  scope :of_user, lambda { |user| where(user_id: user.id) }
end
