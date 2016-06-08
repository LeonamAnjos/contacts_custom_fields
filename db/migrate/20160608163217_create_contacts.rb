class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name,  null: false, default: ''
      t.string :email, null: false, default: ''

      t.timestamps null: false
    end
    
    add_index :contacts, :email, unique: true
  end
end
