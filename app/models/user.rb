class User < ActiveRecord::Base
  has_many :courses, foreign_key: :maker_id
  has_many :reviews, foreign_key: :reviewer_id
  has_many :challenges, foreign_key: :proposer_id

  validates :email, :username, {uniqueness: true, presence: true}

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(login_username, login_password)
    user = self.find_by username: login_username
    return user if !user || (user.password == login_password)
  end
end
