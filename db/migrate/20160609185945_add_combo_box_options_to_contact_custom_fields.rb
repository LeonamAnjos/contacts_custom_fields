class AddComboBoxOptionsToContactCustomFields < ActiveRecord::Migration
  def change
    add_column :contact_custom_fields, :combobox_options, :string
  end
end
