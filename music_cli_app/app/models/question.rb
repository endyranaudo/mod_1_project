class Question < ActiveRecord::Base
  has_many :user_questions
  has_many :users, through: :user_questions
  belongs_to :album


  validates :user_id, presence: true

end
