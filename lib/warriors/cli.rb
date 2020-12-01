class Warriors::CLI

  @@lineup = []

  @@hello_array = ["Welcome to the Warriors, Coach!", "Hey there, Coach!", "Glad you could join us, Coach!", "So happy to see you, Coach!", "Just in time, coach. We need your expertise!"]
  @@no_array = ["Tough call...", "Okay, we trust your decision.", "Alright, Coach!", "Ah... makes sense.", "Choices, choices. Am I right?", "You sure...? Alright then..."]
  @@invalid_array = ["Please choose a valid option.", "Does... not... compute.", "Sorry... I didn't quite get that.", "Apologies - that is an incorrect input.", "Could you try that again, coach?"]
  @@bye_array = ["See you next time, Coach!", "Ta-ta!", "Thanks for your expertise!", "Thanks for joining us on the court.", "Until next time!"]

  def call
    puts @@hello_array.sample
    puts "It's time to choose your starting lineup."
    @input = ""
    until @input.upcase == "EXIT" || lineup_length == 5
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
    puts "Choose an option between 1 and #{@players.length}."
    @input = gets.strip
    if valid_input(@input.to_i)
      show_bio(@input.to_i)
    elsif @input.upcase == "EXIT"
      goodbye
    else
      uh_oh
      user_choice
    end
  end

  def valid_input(i)
    i.between?(1,@players.length)
  end

  def show_bio(i)
    puts ""
    @player = @players[i - 1]
      puts "#{@player.name} is a #{@player.position}."
      if @player.jersey.to_i > 0
        puts "His jersey number is #{@player.jersey}."
      elsif @player.jersey == 0
        puts "His jersey number is yet to be determined."
      end
    add_player
    what_next
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
        puts @@no_array.sample
      when "EXIT"
        goodbye
      else
        uh_oh
        add_player
      end
  end

  def lineup
    puts ""
    case lineup_length
      when 0
        puts "There is no one in your lineup."
        puts "Remember, you will need to choose 5 players in total."
      when (1..3)
        puts "This is your lineup:"
        current_lineup
        remainder
        puts "You need #{remainder} more players in your lineup."
      when 4
        puts "This is your lineup:"
        current_lineup
        remainder
        puts "You need #{remainder} more player in your lineup."
      end
    what_next
  end

  def lineup_length
    @@lineup.length
  end

  def change(input)
    case input
    when (1..5)
      @@lineup.delete_at(input - 1)
    when "B"
      what_next
    else
      uh_oh
    end
    lineup
  end

  def current_lineup
    @@lineup.each.with_index(1) do |player, index|
      puts "#{index}. #{player.name} - #{player.position}"
    end
  end

  def remainder
    remainder = 5 - lineup_length
  end

  def uh_oh
    puts ""
    puts @@invalid_array.sample
  end

  def done?
    puts ""
    puts "Would you like solidify your starting lineup?" if lineup_length == 5
    current_lineup
    puts ""
    puts "Type S to solidify your lineup and exit." 
    puts "Type C to change your lineup."
    @input = gets.strip
    case @input.upcase
      when "S"
        goodbye
      when "C"
        when_c
      else
        uh_oh
        done?
      end
  end

  def what_next
    puts ""

    if lineup_length == 0
      puts "There are no players in your lineup."
    elsif lineup_length == 1
      puts "There is #{lineup_length} player in your lineup."
    elsif lineup_length == 2 || 3 || 4 || 5
      puts "There are #{lineup_length} players in your lineup."
    end
    
    case lineup_length
    when 0
    when (1..4)
      puts ""
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
        when "EXIT"
          goodbye
        else
          uh_oh
          what_next
        end
    when 5
        done? 
    end
  end

  def when_c
    puts ""
    if lineup_length == 0
      puts "You don't have any players in your lineup!"
      what_next
    end

    current_lineup unless lineup_length == 0
    case lineup_length
      when 1
        puts "Type 1 to remove this player."
      when 2
        puts "Type 1 or 2 to remove player."
      when (3..5) 
        puts "Choose a number between 1 and #{lineup_length} to remove player."
    end
    puts "Type B to go back."

    @input = gets.strip
    if @input.to_i.between?(1,lineup_length)
      change(@input.to_i)
    elsif @input.upcase == "B"
      what_next
    else
      uh_oh
      when_c
    end 
  end

  def goodbye
    puts ""
    puts @@bye_array.sample
    exit
  end

end