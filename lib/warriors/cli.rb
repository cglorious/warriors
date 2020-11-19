class Warriors::CLI

  @@lineup = []

  def call
    puts "Welcome to the Warriors, coach!"
    puts "It's time to choose your starting lineup."
    @input = ""

    until @input.upcase == "EXIT"
      get_roster
      list_roster
      user_choice
    end

  end

  def get_roster
    @players = Warriors::Player.all
  end

  def list_roster
    puts ""
    puts "Here is your roster:"
    @players.each.with_index(1) do |player, index|
      puts "#{index}. #{player.name}"
    end
  end

  def user_choice
    puts ""
    puts "Which bio would you like to view?"
    puts "Choose an option between 1 and 13."
    @input = gets.strip
    if valid_input(@input.to_i)
      show_bio(@input.to_i)
    elsif @input.upcase == "EXIT"
      puts "Thanks for joining us on the court."
      goodbye
    else
      puts "Please choose a valid option."
      user_choice
    end
  end

  def valid_input(i)
    i.between?(1,13)
  end

  def show_bio(i)
    puts ""
    @player = @players[i - 1]
    puts "#{@player.name} is a #{@player.position}. His jersey is number #{@player.jersey}."
    #puts "More info can be found at: #{@player.bio_url}"
    view_full_bio?
    what_next
  end

  def view_full_bio?
    puts ""
    puts "Type B to view this player's full bio. Type S to skip."
    @input = gets.strip
    case @input.upcase
    when "B"
      full_bio
      add_player
    when "S"
      add_player
    when "EXIT"
      puts "Thanks for learning more about the Warriors."
      goodbye
    else
      puts "Please choose a valid option."
      view_full_bio?
    end
  end

  def full_bio
    puts ""
    puts "Here is #{@player.name}'s bio."
    #stub - will retrieved scraped data from player
  end

  def add_player
    puts ""
    puts "Would you like to add #{@player.name} to your lineup? Type Y or N."
    @input = gets.strip
    puts ""
    case @input.upcase
      when "Y"
        if !@@lineup.include?(@player)
          @@lineup << @player
          puts "#{@player.name} is added to your lineup."
        else
          puts "#{@player.name} is already in your lineup."
        end
      when "N"
        puts "Tough call, but we trust your decision."
      else
        puts "Please choose a valid option."
        add_player
      end
  end

  def lineup
    puts ""
    current = @@lineup.length
    case current
      when 0
        puts "There is no one in your lineup."
        puts "Remember, you will need to choose 5 players in total."
      when (1..3)
        puts "This is your lineup:"
        iterate
        remainder
        puts "You need #{remainder} more players in your lineup."
      when 4
        puts "This is your lineup:"
        iterate
        remainder
        puts "You need #{remainder} more player in your lineup."
      when 5
        puts "Congratulations! You chose five players!"
        iterate
      end
    what_next
  end

  def change(input)
    case input
    when (1..5)
      @@lineup.delete_at(input - 1)
      what_next
    else
      puts "Apologies - that is an incorrect input."
      what_next
    end
  end

  def iterate
    @@lineup.each.with_index(1) do |player, index|
      puts "#{index}. #{player.name}"
    end
  end

  def remainder
    remainder = 5 - @@lineup.length
  end

  def done?
    puts "Would you like solidify your starting lineup?" 
    iterate
    puts "Type EXIT to keep your lineup and exit." 
    puts "Type C to change your lineup."
    @input = gets.strip
    case @input.upcase
      when "EXIT"
        puts "Thanks for your expertise!"
        goodbye
      when "C"
        when_c
      else
        puts "Please choose a valid option."
        done?
      end
  end

  def what_next
    puts ""
    case @@lineup.length
    when (0..4)
      puts "What would you like to do now?"
      puts "Type L to view your lineup."
      puts "Type C to change your lineup."
      puts "Type R to view the roster."
      puts "Type EXIT to leave the court."
      @input = gets.strip
      case @input.upcase
        when "L"
         lineup
        when "C"
          when_c
        when "R"
          get_roster
        when "EXIT"
          puts "Ta-ta!"
        else
          puts "Please choose a valid option."
          what_next
        end
    when 5
      until @input == "EXIT"
        done? 
      end
    end
  end

  def when_c
    puts ""
    case @@lineup.length
      when 0
        puts "There are no players in your lineup."
        what_next
      when 1
        iterate
        puts "Type 1 to remove this player."
        @input = gets.strip
        change(@input.to_i)
      when 2
        iterate
        puts "Type 1 or 2 to remove player."
        @input = gets.strip
        change(@input.to_i)
      when (3..5)
        iterate
        puts "Choose a number between 1 and #{@@lineup.length} to remove player."
        @input = gets.strip
        change(@input.to_i)
      end
  end

  def goodbye
    puts "See you next time, Coach!"
    exit
  end

end