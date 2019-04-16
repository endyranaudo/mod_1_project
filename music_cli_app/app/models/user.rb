class User < ActiveRecord::Base
  has_many :questions
  has_many :artists, through: :questions

  validates :name, presence: true

end
