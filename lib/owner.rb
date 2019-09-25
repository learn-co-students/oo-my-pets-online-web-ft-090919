# frozen_string_literal: true

class Owner

  attr_reader :species, :name, :owner

  @@all = []
  @@count = 0
  @@pets = {:cats => [], :dogs => []}

  def initialize(name, species = 'human')
    @name = name
    @species = species
    @@all << self
    @@count += 1
  end

  def say_species
    'I am a human.'
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

  def cats
    Cat.all.select { |cats| cats.owner == self }
  end

  def dogs
    Dog.all.select {|dogs| dogs.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, owner = self)
    @@pets[:cats] << self
  end

  def buy_dog(name)
    Dog.new(name, owner = self)
    @@pets[:dogs] << self
  end

  def walk_dogs
    Dog.all.each {|dogs| dogs.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|cats| cats.mood = "happy"}
  end

  def sell_pets
    Cat.all.each {|cats| cats.mood = "nervous"}
    Dog.all.each {|dogs| dogs.mood = "nervous"}
    Cat.all.each {|cats| cats.owner = nil}
    Dog.all.each {|dogs| dogs.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end
