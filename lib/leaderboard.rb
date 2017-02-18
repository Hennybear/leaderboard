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
    @team_summary = {}
    generate_teams
    assign_wins_and_losses
    assign_rankings
  end



  def summary
    summary_setup(@teams)
  end

  def team_game_summary(team_name)
    # find the correct team based on team name
    team = find_team(team_name)
    games_played = team.wins + team.losses

    #find_team(team_name)
    # home_or_away = assign_home_and_away(@teams[0])
    #
    result = "#{team_name} played #{games_played} games. \n"

    GAME_INFO.each do |game|
      if game[:home_team] == team_name || game[:away_team] == team_name
        if game[:home_team] == team_name
          home_or_away = "home"
          opponent = game[:away_team]
          team_score = game[:home_score]
          opponent_score = game[:away_score]
        elsif game[:away_team] == team_name
          home_or_away = "away"
          opponent = game[:home_team]
          team_score = game[:away_score]
          opponent_score = game[:home_score]
        end
        if team_score > opponent_score
          won_or_lost = "won"
        else
          won_or_lost = "lost"
        end
        result += "They played as the #{home_or_away} team against the #{opponent} and #{won_or_lost}: #{team_score} to #{opponent_score}\n"
      end
    end
    result
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

  def summary_setup(teams)
    patriots = @teams[0]
    broncos = @teams[1]
    colts = @teams[2]
    steelers = @teams[3]

    print "    ------------------------------------------------
    | Name      Rank    Total Wins    Total Losses |
    | #{patriots.name}  #{patriots.rank}       #{patriots.wins}             #{patriots.losses}            |
    | #{steelers.name}  #{steelers.rank}       #{steelers.wins}             #{steelers.losses}            |
    | #{broncos.name}   #{broncos.rank}       #{broncos.wins}             #{broncos.losses}            |
    | #{colts.name}     #{colts.rank}       #{colts.wins}             #{colts.losses}            |
    ------------------------------------------------"
  end

  def game_count(team)
    team.wins + team.losses
  end

end


puts Leaderboard.new.summary
puts Leaderboard.new.team_game_summary("Patriots")
