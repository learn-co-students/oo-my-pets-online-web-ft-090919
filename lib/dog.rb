class Dog
  attr_accessor :mood, :owner
  attr_reader :name

  @@all = []
  @@count = 0

  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    @@all << self
    @@count += 1
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end
end
