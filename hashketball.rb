# Write your code here!
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

def players
  all_players = {}
  game_hash.each do |status, characteristics|
    all_players.merge!(characteristics[:players])
  end
  all_players
end

def player_by_number(number)
  players.each do |name, stats|
    if stats[number:] == number
      return name
    end
  end
end

=begin
def player_by_number(number)
  game_hash.each do |status, characteristics|
    characteristics[:players].each do |player, stats|
      if stats[:number] == number
        return player
      end
    end
  end
end
=end

def num_points_scored(name)
  #game_hash[team][:players][name][:points]
  game_hash.each do |status, characteristics|
    if characteristics[:players].has_key?(name)
      return characteristics[:players][name][:points]
    end
  end
end








def shoe_size(name)
  #game_hash[team][:players][name][:shoe]
  game_hash.each do |status, characteristics|
    if characteristics[:players].has_key?(name)
      return characteristics[:players][name][:shoe]
    end
  end
end

def team_colors(name)
  game_hash.each do |status, characteristics|
    if characteristics[:team_name] == name
      return characteristics[:colors]
    end
  end
end

def team_names
  names = []
  game_hash.each do |status, characteristics|
    names << characteristics[:team_name]
  end
  names
end

def player_numbers(name)
  array = []
  game_hash.each do |status, characteristics|
    if characteristics[:team_name] == name
      characteristics[:players].each do |player, stats|
        array << characteristics[:players][player][:number]
      end
    end
  end
  array
end

def player_stats(name)
  game_hash.each do |status, characteristics|
    if characteristics[:players].has_key?(name)
      return characteristics[:players][name]
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_value = nil
  biggest_shoe_owner = nil
  game_hash.each do |status, characteristics|
    characteristics[:players].each do |player, stats|
      if biggest_shoe_value == nil || stats[:shoe] > biggest_shoe_value
        biggest_shoe_value = stats[:shoe]
        biggest_shoe_owner = player
      end
    end
  end

  game_hash.each do |status, characteristics|
    if characteristics[:players].has_key?(biggest_shoe_owner)
      return characteristics[:players][biggest_shoe_owner][:rebounds]
    end
  end
end

def most_points_scored
  most_points_value = nil
  most_points_owner = nil
  game_hash.each do |status, characteristics|
    characteristics[:players].each do |player, stats|
      if most_points_value == nil || stats[:points] > most_points_value
        most_points_value = stats[:points]
        most_points_owner = player
      end
    end
  end
  most_points_owner
end

def winning_team
  team_totals = {}
  game_hash.each do |home_or_away, characteristics|
    team_totals[home_or_away] = 0
    characteristics[:players].each do |player, stats|
      team_totals[home_or_away] += stats[:points]
<<<<<<< HEAD
    end
  end
  side = team_totals.max_by{|team, points| points }[0]
  game_hash[side][:team_name]
end

def player_with_longest_name
  longest_name_value = nil
  longest_name_owner = nil
  game_hash.each do |status, characteristics|
    characteristics[:players].each do |player, stats|
      if longest_name_value == nil || player.length > longest_name_value
        longest_name_value = player.length
        longest_name_owner = player
      end
    end
  end
  longest_name_owner
end

def long_name_steals_a_ton?
  most_steals_value = nil
  most_steals_owner = nil
  game_hash.each do |status, characteristics|
    characteristics[:players].each do |player, stats|
      if most_steals_value == nil || stats[:steals] > most_steals_value
        most_steals_value = stats[:steals]
        most_steals_owner = player
      end
    end
  end
  most_steals_owner == player_with_longest_name
=======
      end
    end
  end
  team_totals.max_by{|team, points| points }[0]
>>>>>>> 263c94c361c26eb66e6f61590e2fbfc25e4c8c03
end
