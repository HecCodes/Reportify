class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :test_quizes, null:false
      t.integer :homework, null:false
      t.integer :classwork, null:false
      t.integer :punctuality_attendance, null:false
      t.integer :contributions, null:false
      t.integer :collab_coop, null:false
      t.integer :openness_to_feedback, null:false
      t.integer :consistently_good_effort, null:false
      t.integer :takes_responsibility, null:false
      t.integer :teacher_id, foreign_key:true
      t.integer :student_id, foreign_key:true
      t.string  :feedback
      t.string  :assignment, null:false
      t.timestamps
    end
  end
end
