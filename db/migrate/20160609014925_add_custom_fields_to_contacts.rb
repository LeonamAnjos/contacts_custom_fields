class AddCustomFieldsToContacts < ActiveRecord::Migration
  def change
    enable_extension 'hstore'
    add_column :contacts, :custom_fields, :hstore
  end
end
