require 'spec_helper'

RSpec.describe Leaderboard do
  let(:leaderboard) { Leaderboard.new }

  describe ".new" do
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

    describe "#team_game_summary" do
      it 'generates a summary of the games played by team' do
        expect(leaderboard.team_game_summary("Patriots")).to eq(3)
      end
    end

  end
end
