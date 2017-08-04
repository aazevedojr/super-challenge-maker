class Course < ActiveRecord::Base
  belongs_to :maker, class_name: :User
  belongs_to :challenge
  has_many :reviews

  validates :bookmark, {uniqueness: true, presence: true}
  validates :title, {presence: true}
end