class Team
  # YOUR CODE GOES HERE

  def initialize(team)
  	@team = team
  	@wins = []
  	@losses = []
  	@rank = rank
  end

  def name
  	@team
  end

  def rank
  end

  def wins
  	@wins.count
  end

  def losses
  	@losses.count
  end

end
