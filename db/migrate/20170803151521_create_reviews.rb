class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :feedback
      t.integer :reviewer_id
      t.integer :course_id

      t.timestamps
    end
  end
end
