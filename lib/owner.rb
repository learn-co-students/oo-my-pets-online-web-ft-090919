class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @cats = []
    @dogs = []
    save
  end

  # Creates new cat instance
  def buy_cat(name)
    Cat.new(name, self)
  end

  # Adds existing cat instance
  def add_cat(cat)
    @cats << cat
  end

  def feed_cats
    @cats.each { |cat| cat.mood = 'happy' }
  end

  # Creates new dog instance
  def buy_dog(name)
    Dog.new(name, self)
  end

  # Adds existing dog instance
  def add_dog(dog)
    @dogs << dog
  end

  def walk_dogs
    @dogs.each { |dog| dog.mood = 'happy' }
  end

  def sell_pets
    @cats.each { |cat|
      cat.mood = 'nervous'
      cat.owner = nil
    }

    @dogs.each { |dog|
      dog.mood = 'nervous'
      dog.owner = nil
    }

    @cats = []
    @dogs = []
  end

  def list_pets
    "I have #{@dogs.count} dog(s), and #{@cats.count} cat(s)."
  end  

  def say_species
    "I am a #{@species}."
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count 
    @@all.length
  end

  def self.reset_all
    @@all = []
  end
end
