class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :bookmark
      t.string :title
      t.integer :maker_id
      t.integer :challenge_id

      t.timestamps
    end
  end
end
