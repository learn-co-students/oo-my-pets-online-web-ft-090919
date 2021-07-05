class Owner
  # code goes here
attr_reader :name, :species

@@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self


  end

 def say_species
    p "I am a #{@species}."
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
  Cat.all.select {|cats|cats.owner == self}
end

  def dogs
    Dog.all.select {|dogs|dogs.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self )
  end

  def buy_dog(name)
    Dog.new(name,self)
  end


  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy" }
  end

def feed_cats
  Cat.all.each {|cat| cat.mood = "happy"}
end


  def sell_pets
    Cat.all.each{|cats| cats.mood = "nervous"}
    Dog.all.each{|dogs| dogs.mood = "nervous"}
    Cat.all.each{|cats| cats.owner = nil }
    Dog.all.each{|dogs| dogs.owner  = nil }

  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
