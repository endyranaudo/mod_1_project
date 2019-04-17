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
    rock = "Rock"
    pop = "Pop"
    genre_selection = @prompt.select("Choose your genre", %w(Rock Pop))
    if genre_selection. == rock
      @genre = "Rock"
    else
      @genre = "Pop"
    # sleep(2.seconds)
    end
  end


  def main_menu
    # answer = @prompt.ask('Select "START" if you want to play a new game, "HELP" if you are not sure about how GOR™ works. "EXIT" to quit')
    start = "start"
    help = "help"
    exit = "exit"
    answer = @prompt.select('Select "START" if you want to play a new game, "HELP" if you are not sure about how GOR™ works. "EXIT" to quit', %w(start help exit))
    # answer = @prompt.multi_select('Select "START" if you want to play a new game, "HELP" if you are not sure about how GOR™ works. "EXIT" to quit', choices, filter: true)
    if answer == "start"
      find_or_create_user
    elsif answer == "help"
      instructions
    elsif answer == "exit"
      goodbye
      # sleep(2.seconds)
    end
  end

  
  def instructions
    puts
    puts "####### HELP #######"
    puts "Trivial Rock is easy:"
    # sleep(1.seconds)
    puts "you have to answer to five simple questions."
    # sleep(1.seconds)
    puts "We will give a title of an album and you will need to guess who wrote it"
    # sleep(1.seconds)
    puts "If you guess the correct ansewer you earn ONE point!"
    # sleep(2.seconds)
    puts "####################"
    puts
    main_menu
  end

  def generate_question
    @user.points = 0
    i = 0
    while i < 3
      answered = UserQuestion.all.select{|uq| uq.user_id == @user.id}.map{|uq| uq.question}
      filtered = Question.all.select{|question| !answered.include?(question) && question.album.genre == @genre}
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
    if @user.points <= 3
      puts "Ops, your final score is just #{@user.points} points!"
    elsif @user.points >= 4 && @user.points <= 7
      puts "Not too bad, #{@user.name}! Your final score is #{@user.points} points!"
    else
      puts "YOU ROCK, #{@user.name}!!! Your final score is #{@user.points} points!"
    end
  end

  def graphic_intro
    puts "-- WELCOME TO: --"
    font = TTY::Font.new(:doom)
    puts font.write("GODS  OF  ROCK")
  end

  def run
    graphic_intro
    main_menu
    welcome
    generate_question
    goodbye
  end

end
