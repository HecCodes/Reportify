class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.string :email, null:false
      t.timestamps
    end
  end
end
