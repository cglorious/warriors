class Warriors::Scraper

  def self.scrape_roster
    doc = Nokogiri::HTML(open("https://www.nba.com/warriors/roster"))
    results = doc.css("div.roster__player")
    
    results.each do |r|
      name = r.css("h2.roster__player__header__heading").text
      position = r.css("div.roster__player__header_position").text.strip
      jersey = r.css("div.roster__player__header_jnumber").text.strip.to_i
      bio_url = r.css(".roster__player__footer").css("a").attr("href").value
      Warriors::Player.new(name, position, jersey, bio_url)
    end
  end

end