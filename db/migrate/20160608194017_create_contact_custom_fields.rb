class CreateContactCustomFields < ActiveRecord::Migration
  def change
    create_table :contact_custom_fields do |t|
      t.string :name
      t.string :field_type
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
