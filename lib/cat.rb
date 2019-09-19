class Cat

  @@all = []

  attr_writer :mood
  attr_reader :name
  attr_accessor :owner, :mood

  def initialize(name, owner)
    @name = name
    @owner = owner
    @@all << self
    self
  end


  def self.all
    @@all
  end

  def mood
    @mood ||= "nervous"
  end

end
