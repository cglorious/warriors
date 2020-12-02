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

  def self.scrape_summary(i)
    @player_summary = Warriors::Player.find(i)
    bio = "https:#{@player_summary.bio_url}"
    doc = Nokogiri::HTML(open("https:#{@player_summary.bio_url}"))
    
    profile = doc.css("p.PlayerSummary_playerStatLabel__2f2Z8").text.split("|")
    @player_summary.height = profile[0].gsub!(/[A-Za-z]/, '').strip
    @player_summary.weight = profile[1].strip
    @player_summary.age = profile[2].strip
  end
 
end