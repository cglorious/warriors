require 'nokogiri'
require 'open-uri'
@site = "https://www.nba.com/warriors/roster"

class Warriors::Scraper

  attr_accessor :name, :position, :jersey, :bio_url

  def self.scrape_players
    players = []

    players << self.scrape_guards
  
    players
  end
  
  def self.scrape_guards
    doc = Nokogiri::HTML(open(@site))

    #iterate through the roster, return a list of players
    #if position == guard, then get information

    #doc.css(".roster").each do |player|
    #  roster = []
    #  guard = self.new
    #  guard.name = player.css("h2").text
    #  roster << name
    #  end

    guard = self.new
    guard.name = doc.search("header.roster_player_header h2").text.strip
    guard.position = doc.search("header.roster_player_header div.roster_player_header_position").text.strip
    guard.jersey = doc.search("header.roster_player_header div.roster_player_header_jnumber").text.strip
    guard.bio_url = doc.search("")

    guard
  end

end