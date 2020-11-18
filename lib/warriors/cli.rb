class Warriors::CLI

  @@all = []

  def call
    puts "Welcome, coach! It's time to pick your starting lineup."
    #sleep 3
    puts "Remember to choose 5 players - two guards and three forwards."
    #sleep 3
    roster
  end

  def roster
    puts "Would you like to view the roster? Type Y to view or N to exit."
    input = gets.strip
    case input.upcase
      when "Y"
        list
      when "N"
        exit_time
      else
        puts "Please choose a valid option."
        roster
      end
  end

  def list
    Warriors::Player.roster
    sleep 3
    decision
  end







###

  def decision
    puts "Would you like to add this person to your lineup? Type Y or N."
    input = gets.strip
    case input.upcase
      when "Y"
        yes
      when "N"
        no
      when "EXIT"
        exit_time
      else
        puts "We understand this is a hard decision..."
        sleep 3
        decision
      end
  end

  def yes
    @@all << "Player"
    puts "Great choice! You have added this player to your lineup."
    sleep 3
    puts "Would you like to add another player? Type Y to view roster or N to leave the court. Type LINEUP to view your current lineup."
    input = gets.strip
    case input.upcase
      when "Y"
        roster
      when "N" || "EXIT"
        exit_time
      when "LINEUP"
        lineup
      else
        puts "Would you like to add another player? Type Y or N. Type LINEUP to view your current lineup."
      end
  end

  def no
    puts "Tough call, but we trust your decision."
    sleep 3
    puts "Would you like to view the roster? Type Y to view roster or N to leave the court."
    puts "For your current lineup, type LINEUP."
      input = gets.strip
      case input.upcase
        when "Y"
          roster
        when "N" || "EXIT"
          exit_time
        when "LINEUP"
          lineup
        else
          puts "Please type Y, N, or LINEUP."
      end
  end

  def lineup
    puts "This is a list of your current lineup."
    sleep 3
    puts "Would you like to view the roster? Type Y to view roster or N to leave the court."
    input = gets.strip
      case input.upcase
        when "Y"
          roster
        when "N" || "EXIT"
          exit_time
        else
          puts "Please type Y or N."
          lineup
      end
  end

  def exit_time
    puts "Thanks for your help, coach! Goodbye!"
    exit
  end

  #create way to output lineup - an array?
  #create way so you are unable to add same player
  #create way so you must add 2 guards only and 3 forwards

end