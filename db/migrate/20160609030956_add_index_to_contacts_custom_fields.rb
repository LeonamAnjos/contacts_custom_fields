class AddIndexToContactsCustomFields < ActiveRecord::Migration
  def change
    add_index :contacts, :custom_fields, using: :gist
  end
end
