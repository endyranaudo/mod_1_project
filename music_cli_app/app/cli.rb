class CLI

  def initialize
    @prompt = TTY::Prompt.new
  end

  def find_or_create_user
    name = @prompt.ask("What's your name?: ")
    # @user = name
    @user = User.find_or_create_by(name: name)
  end

  def welcome
    puts "Welcome, #{@user.name}. Ready to rock?"
    sleep(2.seconds)
  end


  # def generate_question
  #   album_ids = Album.all.map {|album| album.id}
  #   binding.pry
  #   album_ids.map { |id| Question.create(album_id: id) }
  #   binding.pry
  # end



  def make_a_question
    # @total_points = 0
    # i = 0
    # while i <= 5
    # album = Album.random
    right_answer = album.artist.name
    user_answer = @prompt.ask( "Who wrote the album '#{album.title}'?")

    if user_answer == right_answer
      puts "You got it right! + 1 point!!"
      @total_points +=1
      i += 1
    else
      puts "Wrong answer! Sorry."
      i += 1
    end
  end

  def generate_question
    answered = UserQuestion.all.select{|uq| uq.user_id == @user.id}.map{|uq| uq.question}
    filtered = Question.all.select{|question| !answered.include?(question.id)}
    question = filtered.sample.album
    right_answer = question.artist.name
    user_answer = @prompt.ask( "Who wrote the album '#{question.title}'?")
    if user_answer == right_answer
      puts "You got it right! + 1 point!!"
      @user.points +=1
    else
      puts "Wrong answer! Sorry."
    end
    UserQuestion.create(user_id: @user.id, question_id: question.id)
    # binding.pry
    # write prompt to answer question and check the answer
  end


  def goodbye
    puts "Well done, #{@user.name}. Your final score is #{@user.points}"
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
