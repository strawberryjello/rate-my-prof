class CreateMyClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :my_classes do |t|
      t.string :name

      t.timestamps
    end
    add_index :my_classes, :name
  end
end
