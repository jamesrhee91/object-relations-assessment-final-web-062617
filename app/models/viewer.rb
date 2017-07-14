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
