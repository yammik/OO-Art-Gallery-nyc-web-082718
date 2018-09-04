class Painting

  attr_reader :title, :style, :artist, :gallery

  @@all = []

  def initialize(title, style, artist, gallery)
    @title = title
    @style = style
    @artist = artist
    @gallery = gallery
    @@all << self
  end

  # Get a list of all paintings
  def self.all
    @@all
  end

  # Get a list of all painting styles (a style should not appear more than once in the list)
  def self.styles
    self.all.map do |painting|
      painting.style
    end.uniq
  end

end
