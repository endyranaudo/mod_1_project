class CLI

  def initialize
    @prompt = TTY::Prompt.new
  end

  def create_user
    name = @prompt.ask("What's your name?: ")
    @user = name
    # @user = user.find_or_create_by(name: name)
  end

  def welcome
    puts "Welcome, #{@user}. Ready to rock?"
    sleep(2.seconds)
  end


  def make_a_question
    album = Album.random

  end


  #MAKE A QUESTION
  # def make_a_question
  #   @total_points = 0
  #   i = 0
  #   while i <= 5
  #   album = Album.random
  #   right_answer = album.artist.name
  #   user_answer = @prompt.ask( "Who wrote the album '#{album.title}'?")
  #
  #   if user_answer == right_answer
  #     puts "You got it right! + 1 point!!"
  #     @total_points +=1
  #     i += 1
  #   else
  #     puts "Wrong answer! Sorry."
  #     i += 1
  #   end
  # end
  # end


  def goodbye
    puts "Well done, #{@user}. Your final score is #{@total_points}"
  end

  def run
    create_user
    welcome
    make_a_question
    goodbye
  end

end

### extra methods --- start ---
# def instructions
#   puts "Trivial Rock is easy:"
#   sleep(1.seconds)
#   puts "you have to answer to five simple questions."
#   sleep(1.seconds)
#   puts "We will give a title of an album and you will need to guess who wrote it"
#   sleep(2.seconds)
# end
### extra methods --- end ---
