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
  Dog.all.clear
  Cat.all.clear
end


attr_reader :name, :species

  def initialize (name)
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


end
