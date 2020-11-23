- A command line interface coaching simulation to create a Warriors starting line-up

User greeted as a coach
- show roster in a numbered list
- search by number 1 - 13
- show bio
- ask to see another player's bio or exit

Data: https://www.nba.com/warriors/roster
- Bio: name, position, jersey_number, bio_url
- More: Height, Weight, Country, Last Attended, Age, Birthdate, Draft, Experience

Classes:
- Player
- CLI
- Scraper

Note:
- use repl.it to test

What is a Player?
- Name
- position
- jersey_number
- bio_url

Additional Features:

1. Add bio_url
2. Conditionals to only allow 2 guards and 3 forwards
- guard array, forward array
2. Full bio
- scrape data from bio_url link (height, weight, height, birthdate, last attended, draft)
- Add in show_bio above what_next

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
    puts "#{@player.name} is #{@player.height}."
  end