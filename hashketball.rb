require "pry"

def game_hash
  hash =
  {
    home:
    {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:
      {
        "Alan Anderson" =>
        {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" =>
        {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" =>
        {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" =>
        {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" =>
        {
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
    away:
    {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:
      {
        "Jeff Adrien" =>
        {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" =>
        {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" =>
        {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" =>
        {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" =>
        {
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

### THIS IS THE STRUCTURE OF THE HASH
# home / away
# team name / color / players
# name
# stats


def num_points_scored(name)
  hash = game_hash
  hash.each do |home_status, team_attributes|
    hash[home_status][:players].each do |players, stats|
      if name == players
        return hash[home_status][:players][players][:points]
      end
    end
  end
end

def shoe_size(name)
  hash = game_hash
  hash.each do |home_status, team_attributes|
    hash[home_status][:players].each do |players, stats|
      if name == players
        return hash[home_status][:players][players][:shoe]
      end
    end
  end
end

def team_colors(team)
  hash = game_hash
  hash.each do |home_status, team_attributes|
    if hash[home_status][:team_name] == team
      return hash[home_status][:colors]
    end
  end
end

def team_names
  output = []
  game_hash.each do |home_status, team_attributes|
    output << game_hash[home_status][:team_name]
  end
  output
end

def player_numbers(team_name)
  output = []
  game_hash.each do |home_status, team_attributes|
    if game_hash[home_status][:team_name] == team_name
      game_hash[home_status][:players].each do |players, stats|
        output << game_hash[home_status][:players][players][:number]
      end
    end
  end
  output
end

def player_stats(name)
  game_hash.each do |home_status, team_attributes|
    game_hash[home_status][:players].each do |hash_name, stats|
      if hash_name == name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  biggest_shoe_player = ""
  game_hash.each do |home_status, team_attributes|
    game_hash[home_status][:players].each do |hash_name, stats|
      if game_hash[home_status][:players][hash_name][:shoe] > biggest_shoe_size
        biggest_shoe_size = game_hash[home_status][:players][hash_name][:shoe]
        biggest_shoe_player = hash_name
      end
    end
  end
  game_hash.each do |home_status, team_attributes|
    game_hash[home_status][:players].each do |hash_name, stats|
      if hash_name == biggest_shoe_player
        return game_hash[home_status][:players][hash_name][:rebounds]
      end
    end
  end
end
