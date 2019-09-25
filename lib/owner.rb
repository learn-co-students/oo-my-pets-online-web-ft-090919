class Owner
  
  attr_reader :name, :species

  @@all = []
  @@owner_count = 0

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
    @@owner_count += 1
  end 

  def say_species
    "I am a #{species}."
  end

  def self.all 
    @@all 
  end

  def self.count 
    @@owner_count
  end

  def self.reset_all
    @@owner_count = 0 
  end

  def cats 
     Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
    name = Cat.new(name, self) 
  end

  def buy_dog(name)
    name = Dog.new(name, self) 
  end

  def walk_dogs
    Dog.all.each { |dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    Cat.all.each { |cat| cat.mood = "nervous" }
    Dog.all.each { |cat| cat.mood = "nervous" }
    Cat.all.each { |cat| cat.owner = nil }
    Dog.all.each { |cat| cat.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end