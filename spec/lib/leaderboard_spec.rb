require 'spec_helper'

RSpec.describe Leaderboard do
  describe ".new" do
  # YOUR CODE GOES HERE
  it 'iterates through GAME_INFO to create team objects with only their names' do 
  	patriots = Team.new(patriots)
  	patriots_leaderboard = Leaderboard.new(patriots)
  	expect(patriots_leaderboard).to eq(patriots_leaderboard)
  end

  end
end
