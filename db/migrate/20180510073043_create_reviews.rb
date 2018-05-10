class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description

      t.timestamps
    end

    add_reference :reviews, :professor
    add_reference :reviews, :my_class
  end
end
