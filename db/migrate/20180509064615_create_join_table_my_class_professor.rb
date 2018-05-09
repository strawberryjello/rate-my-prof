class CreateJoinTableMyClassProfessor < ActiveRecord::Migration[5.2]
  def change
    create_join_table :my_classes, :professors do |t|
      t.index [:my_class_id, :professor_id]
      t.index [:professor_id, :my_class_id]
    end
  end
end
