class UserQuestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :question_id, presence: true

end
