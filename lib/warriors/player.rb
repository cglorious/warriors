class Warriors::Player

  attr_accessor :name, :position, :jersey, :bio_url

  @@roster = []

  def self.roster
    puts "Here is your roster."

    self.all << Warriors::Scraper.scrape_roster
    sleep 3
    puts "Which bio would you like to view?"
    Warriors::Scraper.info
  end

  def self.all 
    @@roster
  end

    #iterate through @@roster
    #if input equals

end