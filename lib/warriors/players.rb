class Warriors::Players

  attr_accessor :name, :jersey, :bio_url

  def self.guard_roster
    puts "Here is your Guard roster. 30 - Curry, 11 - Thompson."
    self.scraped_guard_roster
  end

  def self.scraped_guard_roster
    roster = []
    roster << self.scrape_guards
    roster
  end

  def self.scrape_guards
    doc = Nokogiri::HTML(open("https://www.nba.com/warriors/roster"))
    results = doc.css("div.roster__player")

    results.each do |r|
      #roster = []
      puts name = r.css("h2.roster__player__header__heading").text
      #roster << name
      #CURRENTLY LISTS ALL PLAYERS - alter to only guards
    end

    #iterate through the elements
    #guard = self.new
    #guard.name = doc.search("header.roster_player_header h2").text.strip
    #guard.position = doc.search("header.roster_player_header div.roster_player_header_position").text.strip
    #guard.jersey = doc.search("header.roster_player_header div.roster_player_header_jnumber").text.strip
    #guard.bio_url = doc.css(".roster__player__footer").css("a").attr("href").#value

    #guard
  end

  def self.forward_roster
    puts "Here is your Forward roster. 23 - Green, 32 - Chriss."
    self.scraped_forward_roster
  end

  def self.scraped_forward_roster
    roster = []
    roster << self.scrape_forwards
    roster
  end

  def self.scrape_forwards
    doc = Nokogiri::HTML(open("https://www.nba.com/warriors/roster"))
    results = doc.css("div.roster__player")

    results.each do |r|
      #roster = []
      puts name = r.css("h2.roster__player__header__heading").text
      #roster << name
      #CURRENTLY LISTS ALL PLAYERS - alter to only forwards
    end

    #iterate through the elements
    forward = self.new
    forward.name = doc.search("header.roster_player_header h2").text.strip
    forward.position = doc.search("header.roster_player_header div.roster_player_header_position").text.strip
    forward.jersey = doc.search("header.roster_player_header div.roster_player_header_jnumber").text.strip
    forward.bio_url = doc.css(".roster__player__footer").css("a").attr("href").value

    forward
  end

end