class Owner
  attr_reader :name, :species
  attr_accessor :cats, :dogs
  @@all = []
  @@owner_count = 0
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@owner_count += 1
  end
  
  def say_species
    "I am a #{self.species}."
  end
  
  def dogs
   Dog.all.select {|d| d.owner == self}
  end
  
  def cats
    Cat.all.select {|c| c.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end
  
  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |d|
      d.mood = "happy"
    end
  end
  
  def feed_cats
    cats.each do |c|
      c.mood = "happy"
    end
  end
  
  def sell_pets
    dogs.each do |d| 
      d.mood = "nervous" 
      d.owner = nil
    end
    cats.each do |c| 
      c.mood = "nervous" 
      c.owner = nil
    end
  end
  
  
  def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end
  
  
  def self.all 
    @@all
  end
  
  def self.count
    @@owner_count
  end
  
  def self.reset_all
    @@all.clear
    @@owner_count = 0
  end
end