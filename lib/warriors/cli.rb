class Warriors::CLI

  @@all = []

  def call
    puts "Welcome, coach!"
    sleep 2
    game_time
    sleep 3
    roster
  end

  def game_time
    puts "It's time to pick your starting lineup." 
    sleep 3
    puts "Remember to choose 5 players - two guards and three forwards."
  end

  def roster
    puts "Which roster would you like to view? Type GUARD or FORWARD."
    input = gets.strip
    case input.upcase
      when "GUARD"
        guard
      when "FORWARD"
        forward
      else
        roster
      end
  end

  def guard
    @guards = Warriors::Players.guard_roster
    sleep 3
    puts "Which bio would you like to view? Choose a player by their jersey number."
    sleep 3
    input = gets.strip
    case input.upcase
      when "30"
        puts "Steph Curry is a guard."
      when "11"
        puts "Klay Thompson is a guard."
      when "FORWARD"
        forward
      else
        puts "Please input a valid jersey number."
        sleep 3
        puts "Choose FORWARD to view the forward roster."
        sleep 3
        guard
      end
    sleep 3
    decision
  end

  def forward
    @forwards = Warriors::Players.forward_roster
    sleep 3
    puts "Which bio would you like to view? Choose a player by their jersey number."
    input = gets.strip
    case input.upcase
      when "23"
        puts "Draymond Green is a forward."
      when "32"
        puts "Marquese Chriss is a forward."
      when "GUARD"
        guard
      else
        puts "Please input a valid jersey number."
        sleep 3
        puts "Choose GUARD to view the guard roster."
        sleep 3
        forward
      end
    sleep 3
    decision
  end

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