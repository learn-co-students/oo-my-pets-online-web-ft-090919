class Cat

@@all = []

def self.all
  @@all
end

  attr_reader :name, :owner, :mood

  def initialize (name, owner_obj)
    @name = name
    @owner = owner_obj
    @mood = "nervous"
    @@all << self
  end

  def owner= (owner_obj)
    @owner = owner_obj
  end

  def mood= (mood)
    @mood =  mood
  end

end
