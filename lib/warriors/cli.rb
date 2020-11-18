class Warriors::CLI

  def call
    puts "Welcome to the Warriors, coach! It's time to learn about your team."
    sleep 2
    @input = ""
    until @input.upcase == "EXIT"
      get_roster
      list_roster
      user_choice
      what_next
    end
    goodbye
  end

  def get_roster
    @players = Warriors::Player.all
  end

  def list_roster
    puts "Here is your roster."
    @players.each.with_index(1) do |player, index|
      puts "#{index}. #{player.name}"
    end
  end

  def user_choice
    sleep 2
    puts "Which bio would you like to view?"
    sleep 2
    puts "Choose an option between 1 and 13."
    input = gets.strip.to_i
    if valid_input(input)
      show_bio(input)
    else
      puts "Please choose a valid option."
      user_choice
    end
  end

  def valid_input(input)
    input.between?(1,13)
  end

  def show_bio(input)
    player = @players[input - 1]
    puts "#{player.name} is a #{player.position}. His jersey is number #{player.jersey}."
    sleep 2
    puts "More info can be found at: #{player.bio_url}"
    sleep 2
  end

  #would you like to learn more about this player
  #look into player bio and capture additional information

  def what_next
    puts "Would you like to learn more? Press the enter key to view the roster. Type EXIT to leave the court."
    @input = gets.strip
  end

  def goodbye
    puts "See you next time, coach!"
    sleep 2
  end

end