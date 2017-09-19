class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.integer :teacher_id, foreign_key:true
      t.integer :parent_id, foreign_key:true
      t.timestamps
    end
  end
end
