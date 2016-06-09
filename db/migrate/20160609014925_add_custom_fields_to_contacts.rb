class AddCustomFieldsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :custom_fields, :hstore
  end
end
