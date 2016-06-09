class AddFieldNameToContactCustomFields < ActiveRecord::Migration
  def change
    add_column :contact_custom_fields, :field_name, :string, null: false, default: ''
  end
end
