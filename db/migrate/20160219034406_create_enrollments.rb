class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :grade
      t.string :course_id
      t.string :status
      t.string :user_id
      #status requested, enrolled, past
      t.string :status
      t.timestamps null: false
    end
  end
end
