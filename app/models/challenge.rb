class Challenge < ActiveRecord::Base
  belongs_to :proposer, class_name: :User

  validates :theme, {uniqueness: true, presence: true}
  validates :course_submissions_deadline, :review_submissions_deadline, {presence: true}
end
