class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :theme
      t.text :guidelines
      t.datetime :course_submissions_deadline
      t.datetime :review_submissions_deadline
      t.integer :proposer_id

      t.timestamps
    end
  end
end
