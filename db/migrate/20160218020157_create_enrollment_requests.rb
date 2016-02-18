class CreateEnrollmentRequests < ActiveRecord::Migration
  def change
    create_table :enrollment_requests do |t|

      t.timestamps null: false
    end
  end
end
