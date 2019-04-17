class CLI

  def initialize
    @prompt = TTY::Prompt.new
  end


  def find_or_create_user
    name = @prompt.ask("What's your name?: ")
    @user = User.find_or_create_by(name: name)
  end


  def welcome
    puts "Welcome, #{@user.name}. Ready?"
    rock = "Rock"
    pop = "Pop"
    genre_selection = @prompt.select("Choose your genre", %w(Rock Pop))
    if genre_selection. == rock
      @genre = "Rock"
      puts "\u{1F91F}" + " " + "\u{1F3B8}" + "  #####   GODS OF ROCK !!! #####  "
    else
      @genre = "Pop"
      puts "\u{1F478}" + " " + "\u{1F3A4}" + "  #####   QUEENS OF POP !!! #####  "
    # sleep(2.seconds)
    end
  end


  def main_menu
    start = "START"
    help = "HELP"
    exit = "EXIT"
    answer = @prompt.select('Select "START" if you want to play a new game, "HELP" if you are not sure about how MUSIC QUIZ™ works. "EXIT" to quit', %w(START HELP EXIT))
    if answer == start
      find_or_create_user
    elsif answer == help
      instructions
    elsif answer == exit
      goodbye
      sleep(3.seconds)
    end
  end


  def instructions
    puts
    puts "####### HELP #######"
    puts "Music Quiz is easy to play!"
    sleep(1.seconds)
    puts "You have to answer to ten simple questions:"
    sleep(1.seconds)
    puts "We will give a title of an album and you will need to guess who wrote it"
    sleep(1.seconds)
    puts "If you guess the correct ansewer you earn ONE point!"
    puts "####################"
    sleep(3.seconds)
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
      puts "YOU ARE A STAR, #{@user.name}!!! Your final score is #{@user.points} points!"
    end
  end

  def graphic_intro
    puts "-- WELCOME TO: --"
    sleep(1.seconds)
    font = TTY::Font.new(:doom)
    puts font.write("MUSIC  QUIZ")
  end

  def run
    graphic_intro
    sleep(2.seconds)
    main_menu
    welcome
    generate_question
    goodbye
  end

end
