require 'pry'
class Owner
    @@all = []
  attr_accessor :pets
  attr_reader :name, :species


  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {:dogs => [], :cats => []}
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
    @pets[:cats]
    # Cat.all.select {|cat| cat.owner == self}
  end
  def dogs
    @pets[:dogs]
    # Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    # @pets[:cats] <<
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
     self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    @pets.each do |pet_type, pet_array|
      pet_array.each do |pet|
        pet.mood = "nervous"
         pet.owner=(nil)
      end
      @pets[pet_type] = []
    end

    def list_pets
      # @pets.each do |pet_type, pet_array|
        # pet_array.each.count do |pet|
        #   pet.dogs = dog_count
        #   pet.cats = cat_count
           "I have #{pets[:dogs].size} dog(s), and #{pets[:cats].size} cat(s)."
         end
end
end
