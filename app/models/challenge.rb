class Challenge < ActiveRecord::Base
  belongs_to :proposer, class_name: :User
  has_many :courses

  validates :theme, {uniqueness: true, presence: true}
  validates :course_submissions_deadline, :review_submissions_deadline, {presence: true}
end
