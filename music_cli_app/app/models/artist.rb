class Artist < ActiveRecord::Base
  has_many :albums
  validates :name, presence: true

  # def self.random
  #   self.all.sample
  # end

end
