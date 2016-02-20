class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :grade
      t.string :course_id
      t.string :instructor_id
      t.timestamps null: false
    end
  end
end
