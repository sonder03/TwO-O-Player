class Player
  attr_reader :name, :lives, :score
  attr_accessor :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def reduce_life
    @lives -= 1
  end

  def is_dead?
    @lives <= 0
  end
end
