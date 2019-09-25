class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.each { |cat| cat.mood = "happy" }
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |cat| cat.owner == self }
  end

  def sell_pets
    pets = dogs + cats
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end
  
  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end
end