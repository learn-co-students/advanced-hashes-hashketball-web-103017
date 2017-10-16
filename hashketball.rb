# Write your code here!
require "pry"

def game_hash
  {
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

def num_points_scored(name)
  return_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, a_data|
      if attribute == :players
        a_data.each do |player_name, player_stats|
          if player_name == name
            return_points = player_stats[:points]
          end
        end
      end
    end
  end
  return_points
end

def shoe_size(name)
  return_shoe = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, a_data|
      if attribute == :players
        a_data.each do |player_name, player_stats|
          if player_name == name
            return_shoe = player_stats[:shoe]
          end
        end
      end
    end
  end
  return_shoe
end

def team_colors(team)
  return_colors = []
  game_hash.each do |location, data|
    if data[:team_name] == team
      return_colors = data[:colors]
  end
end
return_colors
end

def team_names
  team_name_array = []
  game_hash.each do |location, data|
    team_name_array.push(data[:team_name])
  end
  team_name_array
end

def player_numbers(team)
  jerseys = []
  game_hash.each do |location, data|
    if data[:team_name] == team
    data[:players].each do |player, stats|
      jerseys.push(stats[:number])
    end
  end
end
  jerseys
end

def player_stats(name)
  game_hash.each do |location, data|
    data[:players].each do |player_name, stats|
      if player_name == name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  biggest = 0
  biggest_name = ""
  game_hash.each do |location, data|
    data[:players].each do |name, stats|
      if stats[:shoe] > biggest
        biggest = stats[:shoe]
        biggest_name = name
      end
    end
  end

  game_hash.each do |location, data|
    data[:players].each do |name, stats|
      if name = biggest_name
        return stats[:rebounds]
      end
    end
  end

end

=begin
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

good_practices
=end
