class Warriors::Scraper

  attr_accessor :name, :position, :jersey, :bio_url

  def self.scrape_roster
    doc = Nokogiri::HTML(open("https://www.nba.com/warriors/roster"))
    results = doc.css("div.roster__player")
    
    array = results.each.with_index(1) do |r, i|
      player = self.new
      player.name = r.css("h2.roster__player__header__heading").text
      player.position = r.css("div.roster__player__header_position").text.strip
      player.jersey = r.css("div.roster__player__header_jnumber").text.strip
      player.bio_url = r.css(".roster__player__footer").css("a").attr("href").value
      puts "#{i}. #{player.name}"
    end
    #self.all << array
  end

  def self.info
    sleep 2
    puts "Choose an option between 1 and 13."
    input = gets.strip

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
        self.info
    end
  end

end