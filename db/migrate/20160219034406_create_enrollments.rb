class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :grade
      t.integer :course_id
      t.string :status
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
