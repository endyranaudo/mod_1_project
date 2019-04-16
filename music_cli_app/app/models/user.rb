class User < ActiveRecord::Base
  has_many :user_questions
  has_many :questions, through: :user_questions

  validates :name, presence: true

end
