require 'pry'

class Owner
  
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    cat = Cat.new(name, owner = self)
  end
  
  def buy_dog(name)
    dog = Dog.new(name, owner = self)
  end
  
  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    Dog.all.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    Cat.all.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end
  
  def list_pets
    dogs = []
    cats = []
    Dog.all.each do |dog|
      if dog != nil && dog.owner == self
      dogs << dog
      end
    end
    Cat.all.each do |cat|
      if cat != nil && cat.owner == self
      cats << cat
      end
    end
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end
  
end