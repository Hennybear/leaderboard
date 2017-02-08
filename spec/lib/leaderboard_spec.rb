require 'spec_helper'

RSpec.describe Leaderboard do
  describe ".new" do
    let(:leaderboard) { Leaderboard.new }
  # YOUR CODE GOES HERE
    it 'generates a list of teams' do
      expect(leaderboard.teams).to be_a(Array)
      expect(leaderboard.teams.length).to eq(4)
      expect(leaderboard.teams[0].name).to eq("Patriots")
      expect(leaderboard.teams[0]).to be_a(Team)
    end

    it 'assigns wins and losses for each team object' do
      expect(leaderboard.teams[0].wins).to eq(3)
      expect(leaderboard.teams[0].losses).to eq(0)
    end

    it 'ranks teams based on wins' do
      expect(leaderboard.teams[0].rank).to eq(1)
      expect(leaderboard.teams[2].rank).to eq(4)
    end

    it 'ranks team higher if equal number of wins but less losses' do
    end

  end
end
