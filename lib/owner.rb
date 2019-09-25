require "pry"

class Owner
  # code goes here
  attr_reader :name, :species
  attr_accessor :dogs, :cats, :pets
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def pets
    @pets = dogs.zip(cats).flatten.flatten
  end
  
  def say_species
    "I am a #{species}."
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
  
  def cats
    Cat.all.select do |my_cat|
      my_cat.owner == self
    end
  end
  
  def dogs
    Dog.all.select do |my_dog|
      my_dog.owner == self
    end
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    self.pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end
  
  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end
  
  
end