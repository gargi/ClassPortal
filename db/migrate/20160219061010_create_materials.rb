class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :course_id
      t.string :content
      t.timestamps null: false
    end
  end
end
