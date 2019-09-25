require 'pry'

class Owner
  attr_accessor :owner, :pets 
  attr_reader :species, :name
  
  @@all = []
  
  def initialize(name)
    @owner = self
    @name = name
    @pets = {:dogs => [], :cats => []}
    save 
  end 

  
  def save
    @@all << self 
  end 
  
  def species
    @species = "human" 
  end 
  
  def say_species
    "I am a #{species}."
  end 
  
  def self.all 
    @@all
  end 
  
  def self.count
    self.all.count 
  end 
  
  def self.reset_all 
    @@all.clear
  end 
  
  def cats 
    @cats = Cat.all.select { |cat| cat.owner == self }
  end 
  
  def dogs 
    @dogs = Dog.all.select { |dog| dog.owner == self }
  end 
  
  def buy_cat(cat_name)
    @pets[:cats] << Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    @pets[:dogs] << Dog.new(dog_name, self)
  end
  
  def walk_dogs
    dogs_mood = self.dogs.each do |dog| dog.mood = "happy" end
    dogs_mood
  end 
  
  def feed_cats
    cats_mood = self.cats.each do |cat| cat.mood = "happy" end
    cats_mood
  end 
  
  def sell_pets
    self.cats.each do |pet| pet.mood = "nervous" end
    self.dogs.each do |pet| pet.mood = "nervous" end
    self.cats.each do |pet| pet.owner = nil end  
    self.dogs.each do |pet| pet.owner = nil end 
  end 
  
  def list_pets
    "I have #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
  
  
end

