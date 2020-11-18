class Warriors::Scraper

  attr_accessor :name, :position, :jersey, :bio_url

  def self.scrape_roster
    doc = Nokogiri::HTML(open("https://www.nba.com/warriors/roster"))
    results = doc.css("div.roster__player")
    
    results.each.with_index(1) do |r, i|
      name = r.css("h2.roster__player__header__heading").text
      puts "#{i}. #{name}"
      #Warriors::Player.new(name, position, jersey, bio_url) - create new player object
    end
    #Warriors::Player.all << array - add players to array
  end

    #scrape bio information
    #create and save Player object into player class

  def self.scrape_bio
    doc = Nokogiri::HTML(open("https://www.nba.com/warriors/roster"))
    results = doc.css("div.roster__player")
    
    results.each.with_index(1) do |r, i|
      name = r.css("h2.roster__player__header__heading").text
      position = r.css("div.roster__player__header_position").text.strip
      jersey = r.css("div.roster__player__header_jnumber").text.strip
      bio_url = r.css(".roster__player__footer").css("a").attr("href").value
      puts "#{i}. #{name}"
      #create new player object
      Warriors::Player.new(name, position, jersey, bio_url)
    end
    #add players to array
  end

end