class Artist

  attr_reader :name, :years_active

  @@all = []

  def initialize(name, years_active)
    @name = name
    @years_active = years_active
    @@all << self
  end

  # Get a list of all artists
  def self.all
    @@all
  end

  # Get a list of all the paintings by a specific artist
  def my_paintings
    Painting.all.select do |painting|
      painting.artist == self
    end
  end

  # Get a list of all the galleries that a specific artist has paintings in
  def my_galleries
    self.my_paintings.map do |painting|
      painting.gallery
    end.uniq
  end

  # Get a list of all cities that contain galleries that a specific artist has paintings in
  def my_cities
    self.my_galleries.map do |gallery|
      gallery.city
    end.uniq
  end

  # Find the average years of experience of all artists
  def self.avg_years
    self.all.reduce(0) do |accumulator, artist|
      accumulator += artist.years_active
    end.to_f / self.all.length
  end
end
