def game_hash
  game_hash = {
            :home=> {
              :team_name=> "Brooklyn Nets",
              :colors=> ["Black", "White"],
              :players=> {
                :player_name=> ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"],
                :number=> [0, 30, 11, 1, 31],
                :shoe=> [16, 14, 17, 19, 15],
                :points=> [22, 12, 17, 26, 19],
                :rebounds=> [12, 12, 19, 12, 2],
                :assists=> [12, 12, 10, 6, 2],
                :steals=> [3, 12, 3, 3, 4],
                :blocks=> [1, 12, 1, 8, 11],
                :slam_dunks=> [1, 7, 15, 5, 1]
              }
            },

            :away=> {
              :team_name=> "Charlotte Hornets",
              :colors=> ["Turquoise", "Purple"],
              :players=> {
                 :player_name=> ["Jeff Adrien", "Bismak Biyombo", "DeSagna Diop", "Ben Gordon", "Brendan Haywood"],
                 :number=> [4, 0, 2, 8, 33],
                 :shoe=> [18, 16, 14, 15, 15],
                 :points=> [10, 12, 24, 33, 6],
                 :rebounds=> [1, 4, 12, 3, 12],
                 :assists=> [1, 7, 12, 2, 12],
                 :steals=> [2, 7, 4, 1, 22],
                 :blocks=> [7, 15, 5, 1, 5],
                 :slam_dunks=> [2, 10, 5, 0, 12]
              }
            }
  }
end

def num_points_scored(player)
    game_hash.collect do |key, value|
      name=value[:players][:player_name]
      if   name.include?(player)
       return value[:players][:points][(  name.index(player))]
      end
    end
end

def shoe_size(team_player)
  game_hash.collect do |key, value|
    name=value[:players][:player_name]
    if name.include?(team_player)
      return value[:players][:shoe][(name.index(team_player))]
    end
  end
end

def team_colors (team)
  game_hash.collect do |key, value|
   if value[:team_name] == team
    return value[:colors].collect {|color| color}
   end
 end
end

def team_names
 team_names=[]
    game_hash.collect do |key, value|
      team_names<<value[:team_name]
    end
  return team_names
end

def player_numbers(team_name)
  game_hash.collect do |key, value|
   if value[:team_name] == team_name
     return value[:players][:number]
   end
 end
end

def player_stats(player)
  hash = {}
  idx = 0
  game_hash.each do |key, value|
    player_name=value[:players]
      if player_name[:player_name].include?(player)
       idx = (player_name[:player_name].index(player))
       hash[:number] = player_name[:number][idx]
       hash[:shoe] = player_name[:shoe][idx]
       hash[:points] = player_name[:points][idx]
       hash[:rebounds] = player_name[:rebounds][idx]
       hash[:assists] = player_name[:assists][idx]
       hash[:steals] = player_name[:steals][idx]
       hash[:blocks] = player_name[:blocks][idx]
       hash[:slam_dunks] = player_name[:slam_dunks][idx]
    end
  end
   return hash
end

def big_shoe_rebounds
  home_shoes = game_hash[:home][:players][:shoe]
  away_shoes = game_hash[:away][:players][:shoe]
   game_hash.each do |key, value|
     if home_shoes.max > away_shoes.max
     return value[:players][:rebounds][home_shoes.index(home_shoes.max)]
     end
    end
end
