class Warriors::CLI

  @@lineup = []

  def call
    puts "Welcome to the Warriors, coach!"
    puts "It's time to choose 5 players for your starting lineup."
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
    @input = gets.strip
    if valid_input(@input.to_i)
      show_bio(@input.to_i)
    elsif @input.upcase == "EXIT"
      puts "Thanks for joining us on the court."
    else
      puts "Please choose a valid option."
      user_choice
    end
  end

  def valid_input(i)
    i.between?(1,13)
  end

  def show_bio(i)
    @player = @players[i - 1]
    puts "#{@player.name} is a #{@player.position}. His jersey is number #{@player.jersey}."
    #puts "More info can be found at: #{@player.bio_url}"
    view_full_bio?
    what_next
  end

  def view_full_bio?
    puts "Type B to view this player's bio. Type S to skip."
    @input = gets.strip
    case @input.upcase
    when "B"
      full_bio
      add_player
    when "S"
      add_player
    when "EXIT"
      puts "Thanks for learning more about the Warriors."
    else
      puts "Please choose a valid option."
      view_bio?
    end
  end

  def full_bio
    puts "Here is #{@player.name}'s bio."
    #stub - will retrieved scraped data from player
  end

  def add_player
    puts "Would you like to add #{@player.name} to your lineup? Type Y or N."
    @input = gets.strip
    case @input.upcase
      when "Y"
        if !@@lineup.include?(@player)
          @@lineup << @player
          puts "#{@player.name} is added to your lineup."
        else
          puts "#{@player.name} is already in your lineup."
        end
      when "N"
        puts "Tough call, but we understand your decision."
      else
        puts "Please choose a valid option."
        add_player
      end
  end

  def lineup
    if @@lineup.length == 0
      puts "There is no one in your lineup."
    else
      puts "This is your lineup."
    end

    @@lineup.each.with_index(1) do |player, index|
      puts "#{index}. #{player.name}"
    end

    if @@lineup.length == 5
      puts "Type any key to EXIT and leave the court."
      @input = gets.strip
    else
      what_next
    end
  end

  def lineup_full
    puts "You already have 5 players."
    lineup
    puts "Type any key to leave the court."
    @input = gets.strip
  end

  def what_next
    puts "What would you like to do now? Type L to view your lineup. Type R to view the roster. Type EXIT to leave the court."
    @input = gets.strip
    case @input.upcase
      when "R"
        get_roster
      when "L"
        lineup
      when "EXIT"
        puts "Ta-ta!"
      else
        puts "Please choose a valid option."
        what_next
      end
  end

  def goodbye
    puts "See you next time, Coach!"
  end

end