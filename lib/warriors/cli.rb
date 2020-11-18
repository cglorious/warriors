class Warriors::CLI

  @@all = []

  def call
    puts "Welcome to the Warriors, coach! It's time to learn about your team."
    roster
  end

  def roster
    puts "To view your roster, type VIEW. To exit, type EXIT."
    input = gets.strip
    case input.upcase
      when "VIEW"
        view
      when "EXIT"
        exit_time
      else
        puts "Please choose a valid option."
        roster
      end
  end

  def view
    Warriors::Player.roster
    sleep 2
    puts "Which bio would you like to view?"
    sleep 2
    Warriors::Player.bio
    what_next
  end

  def what_next
    sleep 2
    puts "Would you like to learn about another player? Type Y to view the roster or N to exit."
    input = gets.strip
    case input.upcase
      when "Y"
        view
      when "N"
        exit_time
      else
        puts "Please enter a valid option."
        what_next
      end
  end

  def exit_time
    puts "See you next time, coach!"
    exit
  end

end