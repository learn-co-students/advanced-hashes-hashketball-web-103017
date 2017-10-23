# Write your code here!

require "pry"

def game_hash
game_hash  = {


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

def num_points_scored(p_name)

    game_hash.each do |team,team_info|
        player_array = team_info[:players]
        player_array.each do |player_name,player_info|
            if player_name == p_name
                return player_info[:points]
            end
        end
    end
end

def shoe_size(p_name)

    game_hash.each do |team,team_info|
        player_array = team_info[:players]
        player_array.each do |player_name,player_info|
            if player_name == p_name
                return player_info[:shoe]
            end
        end
    end
end


def team_names
    game_hash.collect do |team, team_info|
        team_info[:team_name]
    end
end

def team_colors(t_name)
    game_hash.collect do |team, team_info|
        if team_info[:team_name] == t_name
            return team_info[:colors]
        end
    end
end

def player_numbers(t_name)

    num_array = []

    game_hash.each do |team,team_info|
        player_array = team_info[:players]
        if team_info[:team_name] == t_name
                player_array.each do |player_name,player_info|
                    num_array.push(player_info[:number])
                end
            end
        end
    num_array
end

def player_stats(p_name)

    game_hash.each do |team,team_info|
        player_array = team_info[:players]
            player_array.each do |player_name,player_info|
                    if player_name == p_name
                        return player_info
                end
            end
        end
end


def big_shoe_rebounds
    big_shoe = 0
    rebounds = 0
    game_hash.each do |team,team_info|
        player_array = team_info[:players]
            player_array.each do |player_name,player_info|
                    if player_info[:shoe] > big_shoe  #Loops through the different player shoe size comparing all of them until finding the biggest shoe
                        big_shoe = player_info[:shoe]
                    end
                    rebounds = player_info[:rebounds]

                end
            end
rebounds #after going thru both team's players shoes sizes and finding the biggest shoe size the rebounds for that player is returned
end
