# Please copy/paste all three classes into this file to submit your solution!
class Viewer
  attr_writer :first_name, :last_name

  @@all = []

  def initialize(name)
    @name = name
    @first_name = name.split[0]
    @last_name = name.split[1]
    @@all << self
  end

  def first_name
    @first_name.capitalize
  end

  def last_name
    @last_name.capitalize
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|viewer| viewer.full_name == name.split.map {|e| e.capitalize}.join(' ')}
  end

  def create_rating(score, movie)
    Rating.new(score, movie, self)
  end
end

class Rating
  attr_accessor :score, :movie, :viewer

  @@all = []

  def initialize(score, movie, viewer)
    @score = score
    @movie = movie
    @viewer = viewer
    @@all << self
  end

  def self.all
    @@all
  end
end

class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.find {|movie| movie.title == title}
  end

  def ratings
    Rating.all.select {|rating| rating.movie == self}
  end

  def viewers
    self.ratings.map {|rating| rating.viewer}
  end

  def average_rating
    scores = self.ratings.map(&:score)
    size = scores.size
    (scores.inject(:+) / size.to_f).round(1)
  end
end
