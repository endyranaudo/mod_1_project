class Question < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true

  # define method to generate question
  def question_generator
    album = Album.random
    right_answer = album.artist.name
    puts "Who wrote: #{album.name}"
    user_answer = gets.chomp
    user_answer == right_answer
  end
end
