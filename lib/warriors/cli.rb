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
        Warriors::Player.roster
        sleep 3
        puts "Which bio would you like to view?"
        sleep 3
        Warriors::Player.bio
      when "EXIT"
        exit_time
      else
        puts "Please choose a valid option."
        roster
      end
  end

  #instance or class method?
  def self.what_next
    puts "Would you like to learn about another player? Type Y to view the roster or N to exit."
    input = gets.strip
    case input.upcase
      when "Y"
        Warriors::Player.roster
        sleep 3
        puts "Which bio would you like to view?"
        sleep 3
        Warriors::Player.bio
      when "N"
        puts "Thanks for your help, coach! Goodbye!"
        exit
      else
        puts "Please enter a valid option."
        self.what_next
      end
  end

  def exit_time
    puts "Thanks for your help, coach! Goodbye!"
    exit
  end

end