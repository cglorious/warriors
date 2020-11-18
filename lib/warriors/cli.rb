class Warriors::CLI

  @@lineup = []

  def call
    puts "Welcome to the Warriors, coach! It's time to learn about your team."
    @input = ""
    until @input.upcase == "EXIT" || @@lineup.length == 5
      get_roster
      list_roster
      user_choice
      if @@lineup.length == 5
        lineup_full
      end
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
    puts "Which bio would you like to view?"
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
    puts "More info can be found at: #{player.bio_url}"
    puts "Would you like to add this player to your lineup? Type Y or N."
    #would you like to know more about this player?
    input = gets.strip
    case input.upcase
      when "Y"
        if !@@lineup.include?(player)
          @@lineup << player
          puts "#{player.name} is added to your lineup."
        else
          puts "#{player.name} is already in your lineup."
        end
      when "N"
        puts "Tough call, but we understand your decision."
      else
        puts "Please choose a valid option."
      end
      what_next
  end

  #def show_more
    #additional bio information about player, use player.bio_url
    #need to scrape additional information
  #end

  def lineup
    puts "This is your lineup."
    @@lineup.each.with_index(1) do |player, index|
      puts "#{index}. #{player.name}"
    end

    if @@lineup.length == 5
      puts "Type any key to EXIT and leave the court."
      input = gets.strip
    else
      what_next
    end
  end

  #way to differentiate between guards and forwards within array?

  def lineup_full
    puts "You already have 5 players. Would you like to view your lineup? Type L to view line up. Type EXIT to leave the court."
    input = gets.strip
    case input.upcase
      when "L"
        lineup
      when "EXIT"
        goodbye
      else
        puts "Please choose a valid option."
      end
  end

  def what_next
    puts "What would you like to do now? Type L to view your lineup. Type R to view the roster. Type EXIT to leave the court."
    input = gets.strip
    case input.upcase
      when "R"
        get_roster
      when "L"
        lineup
      when "EXIT"
        goodbye
      else
        puts "Please choose a valid option."
        what_next
      end
  end

  def goodbye
    puts "See you next time, coach!"
  end

end