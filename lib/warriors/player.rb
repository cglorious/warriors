class Warriors::Player

  attr_accessor :weight, :height, :age, :career, :before_nba, :personal
  attr_reader :name, :position, :jersey, :bio_url
  @@all = []

  def initialize(name, position, jersey, bio_url)
    @name = name
    @position = position
    @jersey = jersey
    @bio_url = bio_url
    save
  end

  def self.all 
    Warriors::Scraper.scrape_roster if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end

  def self.find(id)
    self.all[id - 1]
  end

end