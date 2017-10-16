# Write your code here!
require "pry"
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash.each do |team, team_data|
    #binding.pry
    if team_data[:players].include?(player)
      return team_data[:players][player][:points]
    end

  end
end

def shoe_size(player)
  game_hash.each do |team, team_data|
    if team_data[:players].include?(player)
      return team_data[:players][player][:shoe]
    end
  end
end

def team_colors(team)
  game_hash.each do |teams, team_data|
    #binding.pry
    if team_data[:team_name].include?(team)
      return team_data[:colors]
    end
  end
end

def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
end

def player_numbers(team)
  numbers = []
  game_hash.each do |teams, team_data|
    #binding.pry
    if team_data[:team_name].include?(team)
      team_data[:players].each do |player, stat|
        #binding.pry
        numbers << stat[:number]
      end
    end
  end
  return numbers
end


def player_stats(player)
  game_hash.each do |teams, team_data|
    if team_data[:players].include?(player)
      return team_data[:players][player]
    end
  end
end


def big_shoe_rebounds
  biggest_shoe = nil
  biggest_shoe_name = nil
  biggest_shoe_rebound = nil
  all_players.each do |player, stats|
    if biggest_shoe == nil
      biggest_shoe = stats[:shoe]
      biggest_shoe_name = player
      biggest_shoe_rebound = stats[:rebounds]
    elsif stats[:shoe] > biggest_shoe
      biggest_shoe = stats[:shoe]
      biggest_shoe_name = player
      biggest_shoe_rebound = stats[:rebounds]

    end
  end
  return biggest_shoe_rebound
end

def all_players
  all_players = []
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.merge(away_players)
  #binding.pry

end




def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end
#num_points_scored("Jeff Adrien")
