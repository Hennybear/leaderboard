require_relative 'team'

class Leaderboard
GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]

# YOUR CODE GOES HERE
  attr_reader :teams
  def initialize
    @teams = []
    generate_teams
    assign_wins_and_losses
    sort_teams_by_wins(@teams)
    assign_rankings
  end

  private
  def generate_teams
    team_names = []
    GAME_INFO.each do |game|
      if !team_names.include?(game[:home_team])
        team_names << game[:home_team]
        @teams << Team.new(game[:home_team])
      end
      if !team_names.include?(game[:away_team])
        team_names << game[:away_team]
        @teams << Team.new(game[:away_team])
      end
    end
  end

  # name = game[:home_team]
  # if !@teams.any? { |team| team.name == name }
  #   @teams << Team.new(game[:home_team])

  def find_team(name)
    result = nil
    @teams.each do |team|
      if team.name == name
        result = team
      end
    end
      result
  end

  def assign_wins_and_losses
    GAME_INFO.each do |game|
      home_team = find_team(game[:home_team])
      away_team = find_team(game[:away_team])
      if game[:home_score] > game[:away_score]
        home_team.wins += 1
        away_team.losses += 1
      else
        away_team.wins += 1
        home_team.losses += 1
      end
    end
  end

  def sort_teams_by_wins(teams)
    sorted_teams = teams.sort_by { |team| team.wins }
    sorted_teams.reverse
  end

  def assign_rankings
    sorted_teams = sort_teams_by_wins(@teams)

    sorted_teams[0].rank = 1
    sorted_teams[1].rank = 2
    sorted_teams[2].rank = 3
    sorted_teams[3].rank = 4
  end



end

# patriots = Team.new("Patriots")
# patriots_leaderboard = Leaderboard.new(patriots)
# puts patriots_leaderboard.team.name
# puts patriots_leaderboard.GAME_INFO.inspect


puts Leaderboard.new.inspect
