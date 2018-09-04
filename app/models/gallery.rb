class Gallery

  attr_reader :name, :city

  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end

  # Get a list of all galleries
  def self.all
    @@all
  end

  # Get a list of all cities that have a gallery. A city should not appear more than once in the list
  def self.cities
    self.all.map do |gallery|
      gallery.city
    end.uniq
  end

  def paintings
    Painting.all.select do |painting|
      painting.gallery == self
    end
  end

  # Get a list of artists that have paintings at a specific gallery
  def artists
    self.paintings.map do |painting|
      painting.artist
    end.uniq
  end

  # Get a list of the names of artists that have paintings at a specific gallery
  def artist_names
    self.artists.map do |artist|
      artist.name
    end
  end

  # Get the combined years of experience of all artists at a specific gallery
  def artist_years
    self.artists.reduce(0) do |accumulator, artist|
      accumulator += artist.years_active
    end
  end

end
