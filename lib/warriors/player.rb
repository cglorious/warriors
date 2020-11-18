class Warriors::Player

  attr_accessor :name, :position, :jersey, :bio_url
  @@roster = []

  def initialize(name, position, jersey, bio_url)
    @name = name
    @position = position
    @jersey = jersey
    @bio_url = bio_url
  end

  def self.roster
    self.all << Warriors::Scraper.scrape_roster
  end

  def self.all 
    @@roster
  end

  def self.bio
    puts "Choose an option between 1 and 13."
    input = gets.strip

    #get scraped data from Warriors::Scraper.scrape_bio

    case input.to_i
      when 1
        puts "Ky Bowman"
      when 2
        puts "Marquese Chriss"
      when 3
        puts "Stephen Curry"
      when 4
        puts "Draymond Green"
      when 5
        puts "Damion Lee"
      when 6
        puts "Kevon Looney"
      when 7
        puts "Mychal Mulder"
      when 8
        puts "Eric Paschall"
      when 9
        puts "Jordan Poole"
      when 10
        puts "Alan Smailagic"
      when 11
        puts "Klay Thompson"
      when 12
        puts "Juan Toscano-Anderson"
      when 13
        puts "Andrew Wiggins"
      else
        self.bio
      end

  end

end