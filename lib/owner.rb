require 'pry'

class Owner

@@all = []

def self.all
  @@all
end

def self.count
  @@all.count
end

def self.reset_all
  self.all.clear
end


attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    var = Cat.all.select {|cat| cat.owner = self}
  end

  def dogs
    var = Dog.all.select {|cat| cat.owner = self}
  end

  def buy_cat(cat_name)
    var = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    var = Dog.new(dog_name, self)
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
    Cat.all.each do |cat|
      if cat.owner = self
      cat.mood = "nervous"
      cat.owner = nil
      end
      binding.pry

    end

    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end



end
