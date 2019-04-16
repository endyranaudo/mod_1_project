class Question < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true

  # define method to generate question
  # def make_a_question
  #   album = Album.random
  #   right_answer = album.artist.name
  #   puts "Who wrote: #{album.title}?"
  #   user_answer = gets.chomp
  #
  #   if user_answer == right_answer
  #     puts "You got it right! + 1 point!!"
  #   else
  #     puts "Wrong answer! Sorry"
  #   end
  # end

end
