require 'pry'
class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a human."
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
    Cat.all.select {|i| i.owner == self}
  end

  def dogs
    Dog.all.select {|i| i.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
   # binding.pry
    self.dogs.select {|i| i.mood = "happy"}
  end

  def feed_cats
    self.cats.select {|i| i.mood = "happy"}
  end

  def sell_pets
    self.cats.select do |i| 
      i.mood = "nervous"
       i.owner = nil
    end
    self.dogs.select do |i| 
      i.mood = "nervous"
       i.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end