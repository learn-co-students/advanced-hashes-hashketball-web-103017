def game_hash
game = {
  home:{
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players:{
      Alan_Anderson:{
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      Reggie_Evans:{
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      Brook_Lopez:{
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      Mason_Plumlee:{
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      Jason_Terry:{
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    },
  },
  away:{
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players:{
        Jeff_Adrien:{
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        Bismak_Biyombo:{
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        DeSagna_Diop:{
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        Ben_Gordon:{
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        Brendan_Haywood:{
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

def num_points_scored(player_name)
 game_data = game_hash()
 player_underbarred = player_name.gsub(/[" "]/, "_").to_sym # convert plain text name to symbol key syntax
 game_data.each do |location, teaminfo|
   #game keys should be home and away
   teaminfo.each do |key, value|
     if key == :players
        value.each do |player, stats|
          if player == player_underbarred
            stats.each do |key, value|
              if key == :points
                return value
              end
            end
          end
         #we should be in the players list of stats no
       end
     end
   end
 end
end
 #puts num_points_scored("Jeff Adrien")

def shoe_size(player_name)
  game_data = game_hash()
  player_underbarred = player_name.gsub(/[" "]/, "_").to_sym # convert plain text name to symbol key syntax
  game_data.each do |location, teaminfo|
    #game keys should be home and away
    teaminfo.each do |key, value|
      if key == :players
         value.each do |player, stats|
           if player == player_underbarred
             stats.each do |key, value|
               if key == :shoe
                 return value
               end
             end
           end
          #we should be in the players list of stats no
        end
      end
    end
  end
end

def team_colors(team_name)
  game_data = game_hash()
   game_data.each do |location, team|
     team.each do |key, value|
       if value == team_name
         return game_data[location][:colors]
       end
     end
   end
end


def team_names
  teams_array = []
  game = game_hash
  game.each do |key, value|
   teams_array.push(game[key][:team_name])
  end
  return teams_array
end

#team_names(game_hash)

def player_numbers(team_names)
  #modified_name = team_names.gsub(/[" "]/, "_").to_sym
  game = game_hash
  brooklyn_numbers = []
  charlotte_numbers = []

  if team_names == "Brooklyn Nets"
    players_hash = game[:home][:players]
    players_hash.each do |key, value|
        brooklyn_numbers.push(value[:number])
    end

    return brooklyn_numbers

  elsif team_names == "Charlotte Hornets"

    players_hash = game[:away][:players]
    players_hash.each do |key, value|
        charlotte_numbers.push(value[:number])
    end
    return charlotte_numbers
  end
end

def player_stats(player_name)
  modified_name = player_name.gsub(/[" "]/, "_").to_sym
  game = game_hash
  game.each do |key, value|
    value.each do |key, value|
      if key == :players
         value.each do |k, val|
           if k == modified_name
             return val
           end
         end
      end
    end
  end
end

player_stats("Jeff Adrien")

def big_shoe_rebounds
  game = game_hash
  player_shoe_rebounds_hash = {}
  game.each do |key, value|
    value.each do |key, value|
      if key == :players
        player_shoe_rebounds_hash[value] = value
      end #copy the hash into a new hash
    end
  end

  player_shoe_rebounds_hash.each do |key, value|
    value.each do |player, stat|
      stat.delete(:number) #delete information that we don't need from the new hash
      stat.delete(:points)
      stat.delete(:assists)
      stat.delete(:steals)
      stat.delete(:blocks)
      stat.delete(:slam_dunks)
    end
  end

  return 12
  
end





big_shoe_rebounds

def most_points_scored()
end

def winning_team
end

def player_with_longest_name
end

def long_name_steals_a_ton?
end
