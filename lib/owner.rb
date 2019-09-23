require 'pry'
class Owner
  attr_accessor :all, :cats, :dogs
  attr_reader :species, :name
  @@owners = []
  def initialize(name)
    @name = name 
    @species = "human"
    @@owners << self
    @cats = []
    @dogs = []
  end
  
  def say_species
    "I am a human."
  end 
  
  def self.all 
    @@owners
  end
  
  def self.count
    @@owners.size
  end 
  
  def self.reset_all
    @@owners.clear
  end 
  
  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
  end 
  
  def buy_dog(dog_name)
    new_cat = Dog.new(dog_name, self)
  end
  
  def walk_dogs
    self.dogs.each do|dog|
      dog.mood = "happy"
    end 
  end 
  
  def feed_cats
    self.cats.each do|cat|
      cat.mood = "happy"
    end 
  end 
  
  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end 
    
    self.dogs.each do|dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats = [] 
    self.dogs = []
  end 
  
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
  
 
  
end
