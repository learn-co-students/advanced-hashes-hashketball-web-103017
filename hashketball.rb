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
      :colors => ["Purple", "Turquoise"],
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


# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     #location = :home
#     #team_data = everything else
#     # binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         #attribute = :team_name
#         # binding.pry
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#         end
#       end
#   end
# end
#
# good_practices

def num_points_scored(name)
  points_scored = 0

  game_hash.each do |location, data|
    data.each do |category, data_item|
      if category == :players
        data_item.each do |names, stats|
          if names.to_s == name
            stats.each do |type, value|
              if type == :points
                points_scored = value
              end
            end
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(name)
  shoe_size = 0

  game_hash.each do |location, data|
    data.each do |category, data_item|
      if category == :players
        data_item.each do |names, stats|
          if names.to_s == name
            stats.each do |type, value|
              if type == :shoe
                shoe_size = value
              end
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(name)
  teams_colors = ""

  game_hash.each do |location, data|
    data.each do |category, data_item|
      if category == :team_name && data_item != name
        break
      elsif category == :colors
        teams_colors = data_item
      end
    end
  end
  teams_colors
end


def team_names
  names_array = []

  game_hash.each do |location, data|
    data.each do |category, data_item|
      if category == :team_name
        names_array << data_item
      end
    end
  end
  names_array
end


def player_numbers(team)
  numbers = []

  game_hash.each do |location, data|
    data.each do |category, data_item|
      if data_item == team
        data.each do |category, data_item|
          if category == :players
            data_item.each do |name, stats|
              stats.each do |statistic, number|
                if statistic == :number
                  numbers << number
                end
              end
            end
          end
        end
      end
    end
  end
  numbers
end


def player_stats(player)
  statistics = {}

  game_hash.each do |location, data|
    data.each do |category, data_item|
      if category == :players
        data_item.each do |name, stats|
          if name == player
            statistics = stats
          end
        end
      end
    end
  end
  statistics
end


def big_shoe_rebounds
  biggest = 0
  rebounds = 0

  game_hash.each do |location, data|
    data.each do |category, data_item|
      if category == :players
        data_item.each do |name, stats|
          stats.each do |statistic, number|
            if statistic == :shoe && number > biggest
              biggest = number
              stats.each do |statistic, number|
                if statistic == :rebounds
                  rebounds = number
                end
              end
            end
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  player = ""
  biggest = 0
  rebounds = 0

  game_hash.each do |location, data|
    data.each do |category, data_item|
      if category == :players
        data_item.each do |name, stats|
          player = name
          stats.each do |statistic, number|
            if statistic == :points && number > biggest
              biggest = number
              player = name
              # data_item.each do |name, stats|
              #   if statistic == :rebounds
              #     rebounds = number
              #   end
              # end
            end
          end
        end
      end
    end
  end
  puts player
  puts biggest
end

most_points_scored
