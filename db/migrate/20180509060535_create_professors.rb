class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
    add_index :professors, :first_name
    add_index :professors, :last_name
  end
end
