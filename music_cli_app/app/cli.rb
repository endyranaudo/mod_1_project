class CLI


  def initialize
    @prompt = TTY::Prompt.new
  end


  def find_or_create_user
    name = @prompt.ask("What's your name?: ")
    @user = User.find_or_create_by(name: name)
  end


  def welcome
    puts "Welcome, #{@user.name}. Ready to rock?"
    # sleep(2.seconds)
  end


  def generate_question
    @user.points = 0
    i = 0
    while i < 3
      answered = UserQuestion.all.select{|uq| uq.user_id == @user.id}.map{|uq| uq.question}
      filtered = Question.all.select{|question| !answered.include?(question)}
      # if filtered.length == 0
      #   puts "You've answered all the questions correctly!"
      #   puts final_score
      #   if @prompt.yes?('Would you like to restart the game?')
      #     answered = []
      #     filtered = Question.all.select{|question| !answered.include?(question)}
      #     binding.pry
      #     generate_question
      #   else
      #     goodbye
      #   end
      # else
      question = filtered.sample.album
      right_answer = question.artist.name
      user_answer = @prompt.ask( "Who wrote the album '#{question.title}'?")
      if user_answer == right_answer
        UserQuestion.create(user_id: @user.id, question_id: question.id)
        puts "You got it right! + 1 point!!"
        @user.points +=1
        @user.save
        i += 1
      else
        puts "Wrong answer! Sorry."
        i += 1
      end
    end
    @user.user_questions.destroy_all
    final_score
    generate_question if @prompt.yes?("Would you like to play again?")
  end


  def goodbye
    puts "See you soon, #{@user.name}!"
  end


  def final_score
    if @user.points <= 8
      puts "Ops, your final score is just #{@user.points} points!"
    elsif @user.points >= 9 && @user.points <= 18
      puts "Not too bad, #{@user.name}! Your final score is #{@user.points} points!"
    else
      puts "YOU ROCK, #{@user.name}!!! Your final score is #{@user.points} points!"
    end
  end


  def run
    find_or_create_user
    welcome
    generate_question
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
