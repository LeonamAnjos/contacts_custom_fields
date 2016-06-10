class ContactCustomField < ActiveRecord::Base
  belongs_to :user
  before_validation { self.field_name = name.strip.gsub(' ', '_').downcase  }
  before_save { self.combobox_options = '' unless combo_box? }
  
  validates :name, presence: true
  validates :field_type, presence: true, inclusion: { in: %w(text_field text_area combo_box) }
  validates :field_name, presence: true
  validates :combobox_options, presence: true, if: :combo_box?
  validates :user_id, presence: true

  scope :of_user, lambda { |user| where(user_id: user.id) }
  
  def combo_box?
    field_type == 'combo_box'
  end
  
end
