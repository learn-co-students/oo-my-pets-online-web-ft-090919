
class Owner
  attr_reader :name, :species

  @@all = []
  @@count = 0
  
  def initialize(name)
    @name = name
    @species= "human"
    @@all << self
    @@count +=1
  end

  def say_species
    p "I am a #{@species}." 
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
    Cat.all.select{|cat|cat.owner==self}
  end    

  def dogs
    Dog.all.select{|dog| dog.owner==self}
  end
  
  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood ="happy"}
  end
  
  def feed_cats
    cats.each {|cat|cat.mood = "happy"}
  end
  
  def sell_pets
    owners_pets = dogs + cats
    owners_pets.each {|pet| pet.mood = "nervous"}
    owners_pets.each {|pet| pet.owner = nil}
  end

    
  def list_pets
    p "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end
    
    
  end
    
    
    
    
    
    
    
    
    