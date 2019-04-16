class Album < ActiveRecord::Base
  belongs_to :artist
  validates :title, presence: true

  # def self.random
  #   self.all.sample
  # end

end
