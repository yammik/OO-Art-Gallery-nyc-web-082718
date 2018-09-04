require 'pry'
require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

picasso = Artist.new('picasso', 30)
vanGogh = Artist.new('van gogh', 15)
rembrandt = Artist.new('rembrandt', 40)

louvre = Gallery.new('louvre', 'paris')
met = Gallery.new('metropolitan', 'nyc')

nightwatch = Painting.new('night watch', 'baroque', rembrandt, louvre)
prodigal = Painting.new('the prodigal return', 'baroque', rembrandt, louvre)
starry = Painting.new('starry night', 'impressionist', vanGogh, met)

binding.pry
