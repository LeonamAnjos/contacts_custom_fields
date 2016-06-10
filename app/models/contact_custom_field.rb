class ContactCustomField < ActiveRecord::Base
  belongs_to :user
  before_save do 
    self.field_name = name.strip.gsub(' ', '_').downcase 
    self.combobox_options = '' unless combo_box?
  end 
  
  validates :field_name, presence: true
  validates :combobox_options, presence: true, if: :combo_box?

  scope :of_user, lambda { |user| where(user_id: user.id) }
  
  def combo_box?
    field_type == 'combo_box'
  end
  
end
