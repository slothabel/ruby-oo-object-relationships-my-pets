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
    Cat.all.select {|i| i.owner.name == self.name}
  end

  def dogs
    Dog.all.select {|i| i.owner.name == self.name}
  end

  # def buy_cat(name)
  #   new_cat = Cat.new(name, self)
  #   Cat.all << new_cat
  # end


end