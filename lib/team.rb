class Team
  # YOUR CODE GOES HERE
  attr_accessor :wins, :losses, :rank
  def initialize(name)
  	@name = name
  	@wins = 0
  	@losses = 0
  	@rank = nil
  end

  def name
  	@name
  end

  def rank
    @rank
  end

end
