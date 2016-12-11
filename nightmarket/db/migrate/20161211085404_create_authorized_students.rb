class CreateAuthorizedStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :authorized_students do |t|

      t.timestamps
      t.string      :email
      t.string      :role
    end
  end
end
