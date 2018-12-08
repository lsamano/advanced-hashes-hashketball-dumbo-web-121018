# Hash of the NBA game and all stats.
# ex. game_hash[:home][:players]["Alan Anderson"][:number] = 0
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

### HELPER METHODS
# Helper method that collects all players into its own separate hash.
def players
  all_players = {}
  game_hash.each do |home_or_away, team_stats|
    all_players.merge!(team_stats[:players])
  end
  all_players
end

# Helper method for finding the player with the highest specific stat.
def player_with_most(stat)
  value = nil
  owner = nil
  players.each do |player, stats|
    if value == nil || stats[stat] > value
      value = stats[stat]
      owner = player
    end
  end
  owner
end

# Helper method for gathering all of the stats of one team only.
def one_team_stats(team_name)
  game_hash.each do |home_or_away, team_stats|
    if team_stats[:team_name] == team_name
      return team_stats
    end
  end
end

def array_of_one_stat(home_or_away, stat)
  array = []
  game_hash[home_or_away][:players].each do |player, player_stats|
    array << player_stats[stat]
  end
  array
end

### ----------------------------

### METHODS
# Accepts a number and returns the associated player's name.
def player_by_number(number)
  players.each do |name, stats|
    if stats[:number] == number
      return name
    end
  end
end

# Accepts a name and returns the number of points they scored for the game.
def num_points_scored(name)
players[name][:points]
end

# Accepts a name and returns their shoe size.
def shoe_size(name)
  players[name][:shoe]
end

# Accepts a team name and returns the team colors.
def team_colors(team_name)
  one_team_stats(team_name)[:colors]
end

# Gives the team names of the game in an array.
def team_names
  team_names = []
  game_hash.each do |home_or_away, team_stats|
    team_names << team_stats[:team_name]
  end
  team_names
end

# Accepts a team name and returns an array of the players' numbers.
def player_numbers(team_name)
  side = nil
  game_hash.each do |home_or_away, team_stats|
    if team_stats[:team_name] == team_name
      side = home_or_away
    end
  end
  array_of_one_stat(side, :number)
end

# Accepts a player's name and returns a hash of their stats.
def player_stats(name)
  players[name]
end

# Finds the player with the largest shoe size and returns their rebounds.
def big_shoe_rebounds
  players[player_with_most(:shoe)][:rebounds]
end

# Finds the player with the most points scored.
def most_points_scored
player_with_most(:points)
end

# Determines the winning team by adding the points scored by each player.
# First it adds each team's points together and stores it as a key-value pair.
# ex. team_totals = {home: 102, away: 114}
# Then it takes the scores of each team and sorts them, storing the team with
# the higher amount of points into the variable "winner" (:home or :away).
# The game_hash is then checked and the winning team name is returned.
def winning_team
  team_totals = {}
  game_hash.each do |home_or_away, team_stats|
    team_totals[home_or_away] = 0
    team_stats[:players].each do |player, stats|
      team_totals[home_or_away] += stats[:points]
    end
  end
  winner = team_totals.max_by{|team, points| points }[0]
  game_hash[winner][:team_name]
end

# Finds the player with the longest.
def player_with_longest_name
  players.keys.sort_by { |name| name.length }[-1]
end

# Checks if the player with the longest name also has the most steals.
def long_name_steals_a_ton?
  player_with_most(:steals) == player_with_longest_name
end
