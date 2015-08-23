class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.string :email

      t.timestamps null: false
    end
    add_index :participants, :display_name, unique: true
    add_index :participants, :email, unique: true
  end
end
